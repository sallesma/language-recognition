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

class Language < ActiveRecord::Base
  has_many :first_letters
  has_many :chained_letters
end