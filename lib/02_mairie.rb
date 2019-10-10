require 'rubygems'
require 'nokogiri'
require 'open-uri' # for remote site
require 'pry'
#require 'restclient' #
#require 'CSV'

def page_valdoise
  main_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  return main_page
end

def get_townhall_email # récupère l’e-mail d'une mairie à partir de son URL sur la page mairies
  # nom des villes :
  main_page = page_valdoise
  nom_villes_xpath = main_page.xpath("//a[@class='lientxt']/@href")
  noms_css = main_page.css('a.lientxt')

  nom_villes = []
  noms = []
  a = 0
  nom_villes_xpath.size.times do
    nom_villes[a] = nom_villes_xpath[a].text
    noms[a] = noms_css[a].text
    a += 1
  end
  nbr_town = nom_villes.size

  # array avec url complet des villes
  url_villes = []
  i = 0
  nbr_town.times do
    url_villes[i] = "https://www.annuaire-des-mairies.com#{nom_villes[i][1..-1]}"
    i += 1
  end

  # mails des villes
  mail_villes = []
  page_mails = []
  b = 0
  nbr_town.times do
    page_mails << Nokogiri::HTML(open(url_villes[b]))
    mail_villes[b] = page_mails[b].xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    b += 1
  end

  # associe noms des villes et mails
  result_hash = []
  mairie_mail= Hash.new
    z = 0
  nbr_town.times do
    mairie_mail= Hash.new
    mairie_mail["#{noms[z].downcase.capitalize}"] = mail_villes[z]
    result_hash << mairie_mail
    z += 1
  end
binding.pry
    puts result_hash
    return result_hash

end

get_townhall_email

### Def example 1 ville ##
# def get_townhall_email (test_avernes)
#  page_arvenes = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
#  mail = page_arvenes.xpath("//*[contains(text(), '@')]")               # ("//*[contains(text(), '@')]")
#  puts mail
#end
