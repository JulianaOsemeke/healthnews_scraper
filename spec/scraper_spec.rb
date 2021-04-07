require_relative '../lib/scraper'
require_relative './sitesample'
require 'webmock/rspec'

describe NewsScraper do
  context 'scrap' do
    let(:scraper) { NewsScraper.new }

    it 'returns all the news summaries on a page' do
      stub_request(:get, 'https://www.lupus.org/news').to_return(status: 200, body: SAMPLE)
      expect(scraper.scrap.size).to eq (12)
    end

    it 'correctly returns the title of a news item' do
      stub_request(:get, 'https://www.lupus.org/news').to_return(status: 200, body: SAMPLE)
      expect(scraper.scrap[0].title).to eq ('Stroke Outcomes in People with Lupus')
    end

    it 'correctly returns the date of a news item' do
      stub_request(:get, 'https://www.lupus.org/news').to_return(status: 200, body: SAMPLE)
      expect(scraper.scrap[0].date).to eq ('April 7, 2021')
    end
  end
end
