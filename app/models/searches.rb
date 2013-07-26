class Searches
  def initialize(term)
    @term = term
  end
  def query; @term.gsub('#','') end
  def seo_term; '#' + query end

  def results
    retrieve_statuses.map(&:text)
  end

private
  def retrieve_statuses
    Twitter.search(query).statuses
  end
end