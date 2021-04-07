class NewsItem
  attr_reader :title, :summary, :date

  def initialize(title, summary, date)
    @title = title
    @summary = summary
    @date = date
  end

end
