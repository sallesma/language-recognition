require 'rails_helper'

RSpec.describe TextPreprocessor, type: :service do
  before(:all) do
    @text_preprocessor = TextPreprocessor.new
  end

  it 'removes punctuation' do
    text = 'this is punctuated, really.'
    result = @text_preprocessor.prepare(text)

    expect(result).to eq(['this', 'is', 'punctuated', 'really'])
  end

  it 'splits text by words' do
    text = 'this is a text with spaces'
    result = @text_preprocessor.prepare(text)

    expect(result).to eq(['this', 'is', 'a', 'text', 'with', 'spaces'])
  end

  it 'downcases strings' do
    text = 'Title'
    result = @text_preprocessor.prepare(text)

    expect(result).to eq(['title'])
  end

  it 'keeps spanish special characters' do
    text = 'de tamaño muy variable según'
    result = @text_preprocessor.prepare(text)

    expect(result).to eq(['de', 'tamaño', 'muy', 'variable', 'según'])
  end

  it 'keeps chinese characters' do
    text = '汉语 漢語'
    result = @text_preprocessor.prepare(text)

    expect(result).to eq(['汉语', '漢語'])
  end
end