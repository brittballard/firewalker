class FakeTwitter
  class_attribute :return_tweets_text
  self.return_tweets_text = []

  def self.search(query)
    return_tweets = return_tweets_text.map do |tweet_text|
      Twitter::Tweet.new({ id: 1234, text: tweet_text })
    end
    Twitter::SearchResults.new(statuses: return_tweets)
  end
end
