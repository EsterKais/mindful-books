FactoryGirl.define do
  factory :product do
    name          "MyString"
    description   { Faker::Lorem.sentence }
    user          nil
  end
end
