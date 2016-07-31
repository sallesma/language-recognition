require 'rails_helper'

RSpec.describe TextPreprocessor, type: :service do

  it 'removes punctuation' do
    text = 'this is punctuated, really.'
    result = TextPreprocessor.prepare(text)

    expect(result).to eq(['this', 'is', 'punctuated', 'really'])
  end

  it 'splits text by words' do
    text = 'this is a text with spaces'
    result = TextPreprocessor.prepare(text)

    expect(result).to eq(['this', 'is', 'a', 'text', 'with', 'spaces'])
  end

  it 'downcases strings' do
    text = 'Title'
    result = TextPreprocessor.prepare(text)

    expect(result).to eq(['title'])
  end
end