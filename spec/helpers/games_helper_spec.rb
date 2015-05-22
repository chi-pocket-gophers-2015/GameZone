require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TypesHelper. For example:
#
# describe TypesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe GamesHelper do
  let!(:game1) { Game.create!(title: "Checkers", players_min: 2, players_max: 2, duration: 15, complexity: "low") }
  let!(:game2) { Game.create!(title: "Sorry!", players_min: 2, players_max: 6, duration: 60, complexity: "low") }
  let!(:brang) { User.create!(username: "brang", password: "brang") }
  let!(:natty) { User.create!(username: "natty", password: "natty") }
  let!(:ownership1) { Ownership.create!(user: brang, game: game1) }
  let!(:ownership2) { Ownership.create!(user: natty, game: game1) }

  describe "#check_players" do

    it "return true when players_min equals players_max" do
      expect(game1.players_min == game1.players_max).to be_truthy
    end

    it "return false when players_min doesn't equal players_max" do
      expect(game2.players_min == game2.players_max).to be_falsey
    end
  end

  describe "#duration" do
    it "returns minutes for values under 60 minutes" do
      expect(duration(game1)).to eq("15 min.")
    end

    it "returns hours for values 60 minutes and over" do
      expect(duration(game2)).to eq("1 hour")
    end
  end

  describe "#i_own?" do
    xit "presents `delete` button for games I own" do
      # helper.stub(:current_user) { natty }
      allow(helper).to receive(:current_user) { natty }
      expect(i_own?(game1)).to be_truthy
    end

    xit "presents `add` button for games I don't own" do
      expect(i_own?(game2)).to eq()
    end
  end

  describe "#friends_own?" do
    it "returns owners of a game" do
      expect(friends_own?(game1)).to eq("brang, natty")
    end

    it "returns zero owners for an unowned game" do
      expect(friends_own?(game2)).to eq("")
    end
  end
end
