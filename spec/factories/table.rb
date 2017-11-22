FactoryBot.define do
  factory :table do
    name  { FFaker::Name.first_name }
    chairs { (2..8).to_a.sample }
  end
end
