
FactoryGirl.define do
  factory :language do
    locale { 'en' }
    name { FFaker::Locale.language(locale) }

    factory :invalid_language do
      locale nil
    end
  end
end
