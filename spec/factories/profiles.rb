FactoryGirl.define do
  factory :profile do
    first_name  "Bunny"
    last_name   "Rabbit"
    bio         { Faker::Lorem.sentence}
    user        nil
  end
end
