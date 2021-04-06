require_relative '../lib/scraper'
require_relative './sitesample'
require 'webmock/rspec'

describe NewsScraper do
  context 'scrap' do
    let(:scraper) { NewsScraper.new }

    it 'returns all the news summaries on a page' do
      stub_request(:get, 'https://www.lupus.org/').to_return(status: 200, body: SAMPLE)
      expect(scraper.scrap.size).to be 1
    end

  end
end
