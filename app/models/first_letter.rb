# == Schema Information
#
# Table name: first_letters
#
#  id          :integer          not null, primary key
#  letter      :string
#  occurences  :integer          default(0)
#  frequency   :decimal(, )      default(0.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#
# Indexes
#
#  index_first_letters_on_language_id  (language_id)
#  index_first_letters_on_letter       (letter)
#
# Foreign Keys
#
#  fk_rails_1e3088cc43  (language_id => languages.id)
#

class FirstLetter < ActiveRecord::Base
  belongs_to :language
end
