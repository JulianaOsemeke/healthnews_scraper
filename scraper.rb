require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://www.lupus.org/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    byebug
end

scraper
