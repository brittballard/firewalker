class FakeTwitter
  def self.search(query)
    Twitter::SearchResults.new
  end
end
