
FactoryGirl.define do
  factory :language do
    locale { FFaker::Locale.code }
    name { FFaker::Locale.language(locale) }

    factory :invalid_language do
      locale nil
    end
  end
end
