require 'rails_helper'
Dir['./spec/fixtures/**/*.rb'].each { |f| require f }

RSpec.describe Trainer, type: :service do
  before(:all) do
    Trainer.train(Fixtures::FullText::english, 'en')
    Trainer.train(Fixtures::FullText::french, 'fr')
    Trainer.train(Fixtures::FullText::spanish, 'es')
  end

  it 'Recognizes an english text' do  
    result = Identifier.identify(Fixtures::BasicEnglish::text)

    expect(result).to eq(Language.find_by(locale: 'en'))
  end

  it 'Recognizes a french text' do  
    result = Identifier.identify(Fixtures::BasicFrench::text)

    expect(result).to eq(Language.find_by(locale: 'fr'))
  end

  it 'Recognizes a spanish text' do  
    result = Identifier.identify(Fixtures::BasicSpanish::text)

    expect(result).to eq(Language.find_by(locale: 'es'))
  end

  after(:all) do
    Language.destroy_all
  end
end