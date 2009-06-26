require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'array_random_value'

module WikiQuotes
  URL = 'http://wiki/wiki/NabaztagQuotes'
  AUTHENTICATION = ['developmentserver', '12lion4']
  
  def self.get_quotes
    @quotes ||= (Hpricot(open(URL, :http_basic_authentication => AUTHENTICATION).read) /
      "div.searchable li").map { |el| el.inner_text.strip }
  end
  
  def self.random_quote
    get_quotes.random_value
  end
end
