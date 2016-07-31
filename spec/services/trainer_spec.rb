require 'rails_helper'
Dir['./spec/fixtures/**/*.rb'].each { |f| require f }

RSpec.describe Trainer, type: :service do
  it 'Stores an english text' do
    text = Fixtures::BasicEnglish::text
    locale = 'en'
    
    Trainer.train(text, locale)

    language = Language.find_by(locale: locale)
    expect(language.first_letters.pluck(:letter, :occurences, :frequency)).to match_array(Fixtures::BasicEnglish::first_letters)
    expect(language.chained_letters.pluck(:first_letter, :second_letter, :occurences, :frequency)).to match_array(Fixtures::BasicEnglish::chained_letters)
  end

  after(:all) do
    Language.destroy_all
  end
end