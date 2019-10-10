
[1mFrom:[0m /home/marine/Documents/Formation_THP/S2_THP/J4_S2_THP/projet_scrapping/lib/02_mairie.rb @ line 33 Object#get_townhall_email:

    [1;34m28[0m:   i = [1;34m0[0m
    [1;34m29[0m:   nbr_town.times [32mdo[0m
    [1;34m30[0m:     url_villes[i] = [31m[1;31m"[0m[31mhttps://www.annuaire-des-mairies.com#{nom_villes[i][1..-1]}[0m[31m[1;31m"[0m[31m[0m
    [1;34m31[0m:     i += [1;34m1[0m
    [1;34m32[0m:   [32mend[0m
 => [1;34m33[0m:   binding.pry
    [1;34m34[0m:   [1;34m# mails des villes[0m
    [1;34m35[0m:   mail_villes = []
    [1;34m36[0m:   page_mails = []
    [1;34m37[0m:   b = [1;34m0[0m
    [1;34m38[0m:   nbr_town.times [32mdo[0m

