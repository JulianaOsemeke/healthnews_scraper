require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://www.lupus.org/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  news_resources = parsed_page.css('div.news-resources-promo-items')
  news_resources.each do |news_resource|
    news = {

    
    }

  end
  byebug
end


scraper