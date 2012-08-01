require 'spec_helper'
require 'product'

describe LineItem do

  let!(:line_item){create :line_item}

  it "should counting total price" do
    line_item.total_price.should == 30
  end

end
