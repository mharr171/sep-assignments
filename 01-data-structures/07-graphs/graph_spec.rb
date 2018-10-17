include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:graph) { Graph.new() }

  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:lori_singer) { Node.new("Lori Singer") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:dianne_wiest) { Node.new("Dianne Wiest") }
  let (:chris_penn) { Node.new("Chris Penn") }
  let (:sarah_jessica_parker) { Node.new("Sarah Jessica Parker") }
  let (:zac_efron) { Node.new("Zac Efron") }
  let (:michelle_pfeiffer) { Node.new("Michelle Pfeiffer") }
  let (:robert_deniro) { Node.new("Robert De Niro") }
  let (:halle_berry) { Node.new("Halle Berry") }
  let (:ashton_kutcher) { Node.new("Ashton Kutcher") }
  let (:jessica_alba) { Node.new("Jessica Alba") }
  let (:kathy_bates) { Node.new("Kathy Bates") }
  let (:jessica_biel) { Node.new("Jessica Biel") }
  let (:bradley_cooper) { Node.new("Bradley Cooper") }
  let (:patrick_dempsey) { Node.new("Patrick Dempsey") }
  let (:amy_adams) { Node.new("Amy Adams") }
  let (:james_marsden) { Node.new("James Marsden") }
  let (:idina_menzel) { Node.new("Idina Menzel") }
  let (:julie_andrews) { Node.new("Julie Andrews") }
  let (:susan_sarandon) { Node.new("Susan Sarandon") }
  let (:richard_stratton) { Node.new("Richard Stratton") }
  let (:harry_kerrigan) { Node.new("Harry Kerrigan") }
  let (:michael_douglas) { Node.new("Michael Douglas") }
  let (:carey_mulligan) { Node.new("Carey Mulligan") }
  let (:shia_labeouf) { Node.new("Shia LaBeouf") }
  let (:keanu_reeves) { Node.new("Keanu Reeves") }
  let (:rachel_weisz) { Node.new("Rachel Weisz") }
  let (:djimon_hounsou) { Node.new("Djimon Hounsou") }
  let (:max_baker) { Node.new("Max Baker") }
  let (:gavin_rossdal) { Node.new("Gavin Rossdal") }
  let (:ben_stiller) { Node.new("Ben Stiller") }
  let (:owen_wilson) { Node.new("Owen Wilson") }
  let (:christine_taylor) { Node.new("Christine Taylor") }
  let (:will_ferrell) { Node.new("Will Ferrell") }
  let (:milla_jovovich) { Node.new("Milla Jovovich") }


  before do
    # Footloose
    kevin_bacon.film_actor_hash['Footloose'] = [lori_singer, john_lithgow, dianne_wiest, chris_penn, sarah_jessica_parker]
    lori_singer.film_actor_hash['Footloose'] = [kevin_bacon, john_lithgow, dianne_wiest, chris_penn, sarah_jessica_parker]
    john_lithgow.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, dianne_wiest, chris_penn, sarah_jessica_parker]
    dianne_wiest.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, chris_penn, sarah_jessica_parker]
    chris_penn.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, dianne_wiest, sarah_jessica_parker]
    sarah_jessica_parker.film_actor_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, dianne_wiest, chris_penn]

    # New Year's Eve
    sarah_jessica_parker.film_actor_hash["New Year\'s Eve"] = [zac_efron, michelle_pfeiffer, robert_deniro, halle_berry, ashton_kutcher]
    zac_efron.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, michelle_pfeiffer, robert_deniro, halle_berry, ashton_kutcher]
    michelle_pfeiffer.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, robert_deniro, halle_berry, ashton_kutcher]
    robert_deniro.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, michelle_pfeiffer, halle_berry, ashton_kutcher]
    halle_berry.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, michelle_pfeiffer, robert_deniro, ashton_kutcher]
    ashton_kutcher.film_actor_hash["New Year\'s Eve"] = [sarah_jessica_parker, zac_efron, michelle_pfeiffer, robert_deniro, halle_berry]

    # Valentine's Day
    ashton_kutcher.film_actor_hash["Valentine\'s Day"] = [jessica_alba, kathy_bates, jessica_biel, bradley_cooper, patrick_dempsey]
    jessica_alba.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, kathy_bates, jessica_biel, bradley_cooper, patrick_dempsey]
    kathy_bates.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, jessica_biel, bradley_cooper, patrick_dempsey]
    jessica_biel.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, kathy_bates, bradley_cooper, patrick_dempsey]
    bradley_cooper.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, kathy_bates, jessica_biel, patrick_dempsey]
    patrick_dempsey.film_actor_hash["Valentine\'s Day"] = [ashton_kutcher, jessica_alba, kathy_bates, jessica_biel, bradley_cooper]

    # Enchanted
    patrick_dempsey.film_actor_hash["Enchanted"] = [amy_adams, james_marsden, idina_menzel, julie_andrews, susan_sarandon]
    amy_adams.film_actor_hash["Enchanted"] = [patrick_dempsey, james_marsden, idina_menzel, julie_andrews, susan_sarandon]
    james_marsden.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, idina_menzel, julie_andrews, susan_sarandon]
    idina_menzel.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, james_marsden, julie_andrews, susan_sarandon]
    julie_andrews.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, james_marsden, idina_menzel, susan_sarandon]
    susan_sarandon.film_actor_hash["Enchanted"] = [patrick_dempsey, amy_adams, james_marsden, idina_menzel, julie_andrews]

    # Wall Street
    susan_sarandon.film_actor_hash["Wall Street"] = [richard_stratton, harry_kerrigan, michael_douglas, carey_mulligan, shia_labeouf]
    richard_stratton.film_actor_hash["Wall Street"] = [susan_sarandon, harry_kerrigan, michael_douglas, carey_mulligan, shia_labeouf]
    harry_kerrigan.film_actor_hash["Wall Street"] = [susan_sarandon, richard_stratton, michael_douglas, carey_mulligan, shia_labeouf]
    michael_douglas.film_actor_hash["Wall Street"] = [susan_sarandon, richard_stratton, harry_kerrigan, carey_mulligan, shia_labeouf]
    carey_mulligan.film_actor_hash["Wall Street"] = [susan_sarandon, richard_stratton, harry_kerrigan, michael_douglas, shia_labeouf]
    shia_labeouf.film_actor_hash["Wall Street"] = [susan_sarandon, richard_stratton, harry_kerrigan, michael_douglas, carey_mulligan]

    # Constantine
    shia_labeouf.film_actor_hash["Constantine"] = [keanu_reeves, rachel_weisz, djimon_hounsou, max_baker, gavin_rossdal]
    keanu_reeves.film_actor_hash["Constantine"] = [shia_labeouf, rachel_weisz, djimon_hounsou, max_baker, gavin_rossdal]
    rachel_weisz.film_actor_hash["Constantine"] = [shia_labeouf, keanu_reeves, djimon_hounsou, max_baker, gavin_rossdal]
    djimon_hounsou.film_actor_hash["Constantine"] = [shia_labeouf, keanu_reeves, rachel_weisz, max_baker, gavin_rossdal]
    max_baker.film_actor_hash["Constantine"] = [shia_labeouf, keanu_reeves, rachel_weisz, djimon_hounsou, gavin_rossdal]
    gavin_rossdal.film_actor_hash["Constantine"] = [shia_labeouf, keanu_reeves, rachel_weisz, djimon_hounsou, max_baker]

    # Zoolander
    gavin_rossdal.film_actor_hash["Zoolander"] = [ben_stiller, owen_wilson, christine_taylor, will_ferrell, milla_jovovich]
    ben_stiller.film_actor_hash["Zoolander"] = [gavin_rossdal, owen_wilson, christine_taylor, will_ferrell, milla_jovovich]
    owen_wilson.film_actor_hash["Zoolander"] = [gavin_rossdal, ben_stiller, christine_taylor, will_ferrell, milla_jovovich]
    christine_taylor.film_actor_hash["Zoolander"] = [gavin_rossdal, ben_stiller, owen_wilson, will_ferrell, milla_jovovich]
    will_ferrell.film_actor_hash["Zoolander"] = [gavin_rossdal, ben_stiller, owen_wilson, christine_taylor, milla_jovovich]
    milla_jovovich.film_actor_hash["Zoolander"] = [gavin_rossdal, ben_stiller, owen_wilson, christine_taylor, will_ferrell]
  end

  describe "#find_kevin_bacon(kevin, actor)" do
    # have to split up tests, otherwise all nodes must be reset between each test
    it "properly finds connection of first degree actor" do
      expect(graph.find_kevin_bacon(sarah_jessica_parker)).to eq ["Footloose"]
    end

    it "properly finds connection of second degree actor" do
      expect(graph.find_kevin_bacon(ashton_kutcher)).to eq ["New Year\'s Eve", "Footloose"]
    end

    it "properly finds connection of third degree actor" do
      expect(graph.find_kevin_bacon(bradley_cooper)).to eq ["Valentine's Day", "New Year\'s Eve", "Footloose"]
    end

    it "properly finds connection of fourth degree actor" do
      expect(graph.find_kevin_bacon(amy_adams)).to eq ["Enchanted", "Valentine's Day", "New Year\'s Eve", "Footloose"]
    end

    it "properly finds connection of fifth degree actor" do
      expect(graph.find_kevin_bacon(michael_douglas)).to eq ["Wall Street", "Enchanted", "Valentine's Day", "New Year\'s Eve", "Footloose"]
    end

    it "properly finds connection of sixth degree actor" do
      expect(graph.find_kevin_bacon(max_baker)).to eq ["Constantine", "Wall Street", "Enchanted", "Valentine's Day", "New Year\'s Eve", "Footloose"]
    end

    it "cannot 'find' connections of larger than sixth degree actor" do
      expect(graph.find_kevin_bacon(owen_wilson)).to be_nil
    end
  end
end
