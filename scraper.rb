require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = 'https://www.lupus.org/'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  news_wrap = parsed_page.css('.news-resources-promo')[1]
  news_items = news_wrap.css('.news-resources-promo-item')
  content = news_items.map { |item| item.at_css('.news-resources-promo-item-title').text }
  byebug
end

scraper