require 'spec_helper'

describe FakeTwitter, '.search' do
  it 'returns a Twitter::SearchResults' do
    result = FakeTwitter.search('Rails')

    expect(result).to be_a(Twitter::SearchResults)
  end

  it 'should have an statuses attributes that an array' do
    result = FakeTwitter.search('Rails')

    expect(result.statuses).to be_an(Array)
  end

  it 'should have statuses that have text' do
    FakeTwitter.return_tweets_text = ['my tweet']
    result = FakeTwitter.search('Rails')

    expect(result.statuses.first).to be_a(Twitter::Tweet)
  end

  it 'return the array of tweets with text based on return_tweets_text attribute' do
    FakeTwitter.return_tweets_text = ['test 1', 'test 2']

    result = FakeTwitter.search('Rails')

    expect(result.statuses).to be_an(Array)
    expect(result.statuses.length).to eq 2
    expect(result.statuses.first).to be_a(Twitter::Tweet)
    expect(result.statuses.first.text).to eq 'test 1'
    expect(result.statuses.last.text).to eq 'test 2'
  end
end
