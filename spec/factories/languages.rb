# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  locale     :string
#  name       :string
#  local_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_languages_on_locale  (locale) UNIQUE
#


FactoryGirl.define do
  factory :language do
    locale { [:en, :fr, :es].sample }
    name { FFaker::Locale.language }

    factory :invalid_language do
      locale nil
    end
  end
end
