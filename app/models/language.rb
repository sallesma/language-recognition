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

class Language < ActiveRecord::Base
  has_many :first_letters, dependent: :destroy
  has_many :chained_letters, dependent: :destroy

  has_many :identifications, dependent: :nullify

  validates_uniqueness_of :locale
  validates_presence_of :locale
end
