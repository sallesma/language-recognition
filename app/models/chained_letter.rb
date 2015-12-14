# == Schema Information
#
# Table name: chained_letters
#
#  id            :integer          not null, primary key
#  first_letter  :string
#  second_letter :string
#  language      :string
#  occurences    :integer          default(0)
#  frequency     :decimal(, )      default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_chained_letters_on_first_letter   (first_letter)
#  index_chained_letters_on_language       (language)
#  index_chained_letters_on_second_letter  (second_letter)
#

class ChainedLetter < ActiveRecord::Base
end
