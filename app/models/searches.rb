class Searches
  def initialize(term)
    @term = term
  end
  def query; '#' + seo_term end
  def seo_term; @term.gsub('#','') end

  def results
    retrieve_statuses.map(&:text)
  end

private
  def retrieve_statuses
    Twitter.search(query).statuses
  end
end