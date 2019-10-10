require_relative '../lib/02_mairie.rb'

describe "mairie_christmas" do
    it "nbre de villes à trouver dans l'array" do
        expect(nbr_town).to eq (185)
    end

    it "valeur 10 de l'array" do
      expect(result_hash[10]).to eq ({"Attainville"=>"mairie@attainville.fr"})
    end

    it "test good url" do
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/nerville-la-foret.html")).
        to eq({"nerville-la-foret"=>"mairie-nerville95@wanadoo.fr"})
    end
end
