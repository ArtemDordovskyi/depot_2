require 'spec_helper'

describe Cart do

  let!(:product){ create :product }
  let!(:product1){ create :product }

  let!(:cart){ create :cart }

  describe "adding in cart" do

    before(:each) do
      cart.add_product(product.id).save
    end

    context "existing product" do
      let(:item){ cart.line_items.first }

      it do
        expect { cart.add_product(product.id).save; item.reload }.to change(item, :quantity).from(1).to(2)
      end
    end

    context "new product" do
      before(:each) do
        cart.add_product(product1.id).save
      end

      let(:line_items){ cart.line_items }

      it { line_items.should have(2).line_items }

      it do
        line_item2 = line_items.last
        line_item2.quantity.should == 1
      end

      it do
        line_item1 = line_items.first
        line_item1.quantity.should == 1
      end
    end

  end

  context "total values" do

    let!(:item1){ create :line_item, :cart => cart }
    let!(:item2){ create :line_item, :cart => cart, :quantity => 2 }

    describe "price" do
      it { cart.total_price.should == 50 }
    end

    describe "items" do
      it { cart.total_items.should == 5 }
    end

  end

end
