require 'spec_helper'
require 'cart'
require 'line_item'

describe Order do

  let!(:order){create :order}

  it "adding line items from cart" do
    cart = Cart.create!
    order.add_line_items_from_cart(cart).should 
  end

end
