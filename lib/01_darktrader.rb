require 'rubygems'
require 'nokogiri'
require 'open-uri' # for remote site
require 'pry'
#require 'restclient' #
#require 'CSV'

$url = "https://coinmarketcap.com/all/views/all/"

# 1) Isoler les éléments HTML
# 2) En extraire le texte et mettre ça dans un hash,
#3) Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé.

def crypto
  page = Nokogiri::HTML(open($url))
  liens_name = page.xpath("//a[@class='currency-name-container link-secondary']")
  liens_price = page.xpath("//a[@class='price']")
#  binding.pry
  tab = []
  i = 0
  (liens_name.size).times do
    crypto_hash = Hash.new
    crypto_hash[liens_name[i].text] = liens_price[i].text
    tab << crypto_hash
    i += 1
  end
 p tab 
end

crypto
