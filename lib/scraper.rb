require 'byebug'
require 'puppeteer'
require_relative './news_item'


class NewsScraper
  def scrap
    Puppeteer.launch(headless: true) do |browser|
      page = browser.pages.first || browser.new_page
      page.goto('https://www.lupus.org/news')
      items = page.query_selector_all('.filtered-content-item-content').map do |item|
        title = item.eval_on_selector('.filtered-content-item-title', 'div => div.innerText')
        summary = item.eval_on_selector('.filtered-content-item-summary', 'div => div.innerText')
        date = item.eval_on_selector('.filtered-content-item-date', 'div => div.innerText')
        NewsItem.new(title,summary,date)
      end
    end
  end
end
