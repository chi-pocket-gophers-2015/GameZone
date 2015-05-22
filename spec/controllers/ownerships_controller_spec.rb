require 'rails_helper'

describe OwnershipsController do
  let!(:user) { User.create!(username: "brang", password: "brang") }
  let!(:game) { Game.create!(title: "Suck It", players_min: 2, players_max: 6, duration: 60, complexity: "med") }
  let!(:ownership) { Ownership.create!(user: user, game: game) }

  describe "POST create" do
    it "creates a new Ownership" do
      request.env["HTTP_REFERER"] = games_path
      expect {
        post :create, user_id: user.id, game_id: game.id
      }.to change(Ownership, :count).by(1)
    end

    it "assigns a newly created game as @ownership" do
      request.env["HTTP_REFERER"] = games_path
      post :create, user_id: user.id, game_id: game.id
      expect(assigns(:ownership)).to be_a(Ownership)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ownership" do
      request.env["HTTP_REFERER"] = games_path
      expect(ownership).to be_truthy
      num = Ownership.all.length
      delete :destroy, { id: ownership.to_param }
      expect(Ownership.all.length).to be(num - 1)
    end
  end
end
