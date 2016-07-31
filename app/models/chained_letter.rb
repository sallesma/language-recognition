# == Schema Information
#
# Table name: chained_letters
#
#  id            :integer          not null, primary key
#  first_letter  :string
#  second_letter :string
#  occurences    :integer          default(0)
#  frequency     :decimal(, )      default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  language_id   :integer
#
# Indexes
#
#  index_chained_letters_on_first_letter   (first_letter)
#  index_chained_letters_on_language_id    (language_id)
#  index_chained_letters_on_second_letter  (second_letter)
#

class ChainedLetter < ActiveRecord::Base
  belongs_to :language
end
