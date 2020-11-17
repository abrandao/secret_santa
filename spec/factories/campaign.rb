FactoryBot.define do
  factory :campaign do
    #title { FFaker::Lorem.word }
    title { 'Nova Campanha' }
    #description { FFaker::Lorem.sentence }
    description { 'Descreva sua campanha...' }
    user
    status { :pending }
    locale { "#{FFaker::Address.city}, #{ FFaker::Address.street_address}"}
    event_date { FFaker::Time.date }
    event_hour { rand(24).to_s }
  end
end