# == Schema Information
#
# Table name: identifications
#
#  id          :integer          not null, primary key
#  text        :string
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_identifications_on_language_id  (language_id)
#
# Foreign Keys
#
#  fk_rails_d706eacb3f  (language_id => languages.id)
#

FactoryGirl.define do
  factory :identification do
    text { FFaker::Lorem.paragraph }

    factory :invalid_identification do
      text nil
    end
  end
end
