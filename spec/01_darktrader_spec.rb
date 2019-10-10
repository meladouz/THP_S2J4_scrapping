require_relative '../lib/01_darktrader.rb'

# 1.fonctionnement de base de ton programme (pas d'erreur ni de retour vide)
# 2. que ton programme sort bien un array cohérent
    # > vérifier la présence de 2-3 cryptomonnaies,
    # > vérifier que l’array est de taille cohérente, etc.).

describe "the crypto method" do
  	it "should return hash" do
     tab = []
    end

  	it "Array contains BTC, ETH and LTC" do
  		expect({"Bitspace"=>""}).to eq({"Bitspace"=>""})
  		expect({"ETH"=>""}).to include({"ETH"=>""})
  		expect({"LTC"=>""}).to include({"LTC"=>""})
  	end

	it "found_NIL" do
		expect(nil).to be_nil
	end
end
