require 'rails_helper'

describe OwnershipsController do
  let!(:user) { User.create!(username: "brang", password: "brang") }
  let!(:game) { Game.create!(title: "Suck It", players_min: 2, players_max: 6, duration: 60, complexity: "med") }
  let!(:ownership) { Ownership.create!(user: user, game: game) }

  # describe "GET #index" do
  #   it "assigns all games as @games" do
  #     get :index
  #     expect(assigns(:games)).to eq(Game.all)
  #   end
  # end

  # describe "GET #show" do
  #   it "assigns the requested game as @game" do
  #     get :show, { id: game.to_param }
  #     expect(assigns(:game)).to eq(game)
  #   end

  #   it "assigns winner throw" do
  #     get :show, { id: game.to_param }
  #     expect(assigns(:winner_throw)).to eq(game.winner_throw)
  #   end

  #   it "assigns loser throw" do
  #     get :show, { id: game.to_param }
  #     expect(assigns(:loser_throw)).to eq(game.loser_throw)
  #   end
  # end

  describe "GET #new" do
    it "creates empty Game object" do
      get :new
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  # describe "POST create" do
  #   context "when valid params are passed" do
  #     it "creates a new Ownership" do
  #       expect {
  #         post :create, :ownership => { (user: user, game: game) }
  #       }.to change(Ownership, :count).by(1)
  #     end

  #     # it "assigns a newly created game as @game" do
  #     #   post :create, :game => {user_throw: Game::THROWS.sample}
  #     #   expect(assigns(:game)).to be_a(Game)
  #     # end

  #     # it "redirects to the created game" do
  #     #   post :create, :game => {user_throw: Game::THROWS.sample}
  #     #   expect(response).to redirect_to(game_path(assigns(:game)))
  #     end
  #   end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved game as @game" do
        post :create, :game => {user_throw: "butts"}
        expect(assigns(:game)).to_not be_valid
      end

      it "re-renders the 'new' template" do
        post :create, :game => {user_throw: "butts"}
        expect(response).to render_template(:new)
      end
    end
  # end

  describe "DELETE #destroy" do
    # it "assigns the requested game as @game" do
    #   delete :destroy, { id: game.to_param }
    #   expect(assigns(:game)).to eq(game)
    # end

    it "destroys the requested ownership" do
      request.env["HTTP_REFERER"] = games_path
      expect(ownership).to be_truthy
      num = Ownership.all.length
      delete :destroy, { id: ownership.to_param }
      expect(Ownership.all.length).to be(num - 1)
      # expect {
      #   delete :destroy, id: ownership.id
      # }.to change(Ownership, :count).by(-1)
    end

    # it "redirects back to the page" do
    #   delete :destroy, { id: Ownership.to_param }
    #   expect(response).to redirect_to(:back)
    # end
  end

end
