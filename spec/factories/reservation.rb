FactoryBot.define do
  factory :reservation do
    name { FFaker::Name.first_name }
    seats { (2..8).to_a.sample }
    status { 0 }
  end
end
