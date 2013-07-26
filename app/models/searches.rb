class Searches
  def initialize(term)
    @term = term
  end
  def query; @term.gsub('#','') end
  def seo_term; '#' + query end
end