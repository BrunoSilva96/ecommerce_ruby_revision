FactoryBot.define do
  factory :game do
    mode { %i(pvp pve both).sample }
    release_date { "2023-05-30 16:12:39" }
    developer { Faker::Company.name }
    system_requirement
  end
end
