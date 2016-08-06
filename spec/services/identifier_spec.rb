require 'rails_helper'
Dir['./spec/fixtures/**/*.rb'].each { |f| require f }

RSpec.describe Trainer, type: :service do
  before(:all) do
    Trainer.train(Fixtures::Text::english, 'en')
    Trainer.train(Fixtures::Text::french, 'fr')
    Trainer.train(Fixtures::Text::spanish, 'es')

    @identifier = Identifier.new
  end

  it 'Recognizes an english text' do
    identification = Fixtures::English::identification
    result = @identifier.process(identification)

    expect(result).to be_truthy
    expect(identification.language).to eq(Language.find_by(locale: 'en'))
  end

  it 'Recognizes a french text' do
    identification = Fixtures::French::identification
    result = @identifier.process(identification)

    expect(result).to be_truthy
    expect(identification.language).to eq(Language.find_by(locale: 'fr'))
  end

  it 'Recognizes a spanish text' do 
    identification = Fixtures::Spanish::identification
    result = @identifier.process(identification)

    expect(result).to be_truthy
    expect(identification.language).to eq(Language.find_by(locale: 'es'))
  end

  after(:all) do
    Language.destroy_all
  end
end