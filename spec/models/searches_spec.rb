require 'spec_helper'

describe Searches, '#new' do
  it 'should require a search query' do
    expect{Searches.new}.to raise_error ArgumentError
  end
end

describe Searches, '#query' do
  context 'given a hashless term' do
    it 'displays the given term' do
      search = Searches.new('hashless')
      expect(search.query).to eq 'hashless'
    end
  end

  context 'given a hashful term' do
    it 'displays the term without the hash' do
      search = Searches.new('#hashful')
      expect(search.query).to eq 'hashful'
    end
  end
end

describe Searches, '#seo_term' do
  context 'given a hashless term' do
    it 'prepends the term with a hash' do
      search = Searches.new('hashless')
      expect(search.seo_term).to eq '#hashless'
    end
  end

  context 'given a hashful term' do
    it 'displays the given term' do
      search = Searches.new('#hashful')
      expect(search.seo_term).to eq '#hashful'
    end
  end
end