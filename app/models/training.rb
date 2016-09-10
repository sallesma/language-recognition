# == Schema Information
#
# Table name: trainings
#
#  id          :integer          not null, primary key
#  text        :string
#  processed   :boolean
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_trainings_on_language_id  (language_id)
#
# Foreign Keys
#
#  fk_rails_9953539391  (language_id => languages.id)
#

class Training < ActiveRecord::Base
  belongs_to :language

  validates_presence_of :text
end
