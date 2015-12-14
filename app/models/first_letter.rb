# == Schema Information
#
# Table name: first_letters
#
#  id         :integer          not null, primary key
#  letter     :string
#  locale     :string
#  occurences :integer          default(0)
#  frequency  :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_first_letters_on_letter  (letter)
#  index_first_letters_on_locale  (locale)
#

class FirstLetter < ActiveRecord::Base
end
