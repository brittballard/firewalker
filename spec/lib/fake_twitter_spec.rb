require 'spec_helper'

describe FakeTwitter, '#search' do
  it 'returns a Twitter::SearchResults' do
    result = FakeTwitter.search('YOLO')

    expect(result).to be_a(Twitter::SearchResults)
  end
end
