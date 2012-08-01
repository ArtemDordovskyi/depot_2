FactoryGirl.define do
  factory :product do
    sequence(:title) {|n| "MyString#{n}" }
    description "MyText"
    image_url "MyString.jpg"
    price 10
  end

  factory :order do
    name "Name"
    address "Address"
    email "Email"
    pay_type "Check"
  end

  factory :cart do
  end

  factory :line_item do
    cart
    product
    quantity 3
  end

end
