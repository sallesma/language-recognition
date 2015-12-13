# == Schema Information
#
# Table name: first_letters
#
#  id         :integer          not null, primary key
#  letter     :string
#  language   :string
#  occurences :integer          default(0)
#  frequency  :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FirstLetterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
