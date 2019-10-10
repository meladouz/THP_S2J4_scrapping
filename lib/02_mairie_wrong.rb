require 'rubygems'
require 'nokogiri'
require 'open-uri' # for remote site
require 'pry'
#require 'restclient' #
#require 'CSV'

URL = "http://annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_email(townhall_url) # récupère l’e-mail d'une mairie à partir de l'URL de mairies
  mail_hash = Hash.new
	city_name = townhall_url[35..-6]
	list_mail = Nokogiri::HTML(open(townhall_url)).xpath("//*[contains(text(), '@')]")
	list_mail.each { |mail| mail_hash[city_name]= mail.text	}
  return mail_hash
end

def get_townhall_urls # récupère les URLs de chaque ville du Val d'Oise.
  page_city = Nokogiri::HTML(open(URL))
  city_url = (page_city.xpath("//a[@class='lientxt']/@href"))
  return city_url # ex : "./95/avernes.html"
end

def perform
  list_url = get_townhall_urls.map {|x|
		URL[0..30] + x.text[1..-1]   # ajoute début url "http://annuaire-des-mairies.com/" + le .text des urls
	} # renvoie l'url de la page de la ville
#  puts list_url
  list_hash = []
  	for i in 0..list_url.size-1 do
  		list_hash[i]= Hash.new
  		list_hash[i]= get_townhall_email(list_url[i])
  	end
    puts "We found #{list_hash.length } townhalls and saved their emails "
    return list_hash
    p list_hash
end

perform
