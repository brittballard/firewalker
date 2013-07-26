require 'spec_helper'

describe Searches, '#new' do
  it 'should require a search query' do
    expect{Searches.new}.to raise_error ArgumentError
  end
end

describe Searches, '#seo_term' do
  context 'given a hashless term' do
    it 'displays the given term' do
      search = Searches.new('hashless')
      expect(search.seo_term).to eq 'hashless'
    end
  end

  context 'given a hashful term' do
    it 'displays the term without the hash' do
      search = Searches.new('#hashful')
      expect(search.seo_term).to eq 'hashful'
    end
  end
end

describe Searches, '#query' do
  context 'given a hashless term' do
    it 'prepends the term with a hash' do
      search = Searches.new('hashless')
      expect(search.query).to eq '#hashless'
    end
  end

  context 'given a hashful term' do
    it 'displays the given term' do
      search = Searches.new('#hashful')
      expect(search.query).to eq '#hashful'
    end
  end
end

describe Searches, '#results' do
  it 'returns 15 text tweets' do
    search = Searches.new('query')
    results = search.results

    expect(results.length).to eq 15
    expect(results.first).to be_a String
  end

  it 'sends the search message with query to searcher' do
    searcher = double('searcher', search: double('results').as_null_object)
    searches = Searches.new('test query', searcher)

    searches.results

    expect(searcher).to have_received(:search).with('#test query')
  end
end
