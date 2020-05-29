FactoryBot.define do
    factory :dashboard do
      title { 'title1' }
      description {'some text1'}
      position { 11 }
      user_id { 1 }
    end
end