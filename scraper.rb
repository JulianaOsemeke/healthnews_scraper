require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://www.lupus.org/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  news_blocks = parsed_page.css('div.filtered-content-items')
  news_blocks.each do |news_block|
    news = {
        title: news_block.css('div.filtered-content-item-title').text,
        date: news_block.css('div.filtered-content-item-date').text,
        summary: news_block.css('div.filtered-content-item-summary').text,
        url: 'https://www.lupus.org/' + news_blocks.css('a')[0].attributes["href"].value
    }
    byebug
  end
end

scraper