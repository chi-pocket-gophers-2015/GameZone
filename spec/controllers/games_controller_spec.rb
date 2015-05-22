require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:type1) { Type.create(phrase: "Type 1") }
  let(:type2) { Type.create(phrase: "Type 2") }
  let(:type3) { Type.create(phrase: "Type 3") }
  let(:game1) { Game.create(title: "Game 1") }
  let(:game2) { Game.create(title: "Game 2") }
  let(:g_t1) { Game_type.create(game: game1, type: type1) }
  let(:g_t2) { Game_type.create(game: game1, type: type2) }
  let(:g_t3) { Game_type.create(game: game2, type: type1) }
  let(:g_t4) { Game_type.create(game: game2, type: type3) }

  describe "index" do
    it "should contain a list all of existing Games" do
      get :index
      expect(assigns(:games)).to include(game1, game2)
    end
  end

  describe "show" do
    it "should find the game specified in params" do
      get :show, { id: game1.to_param }
      expect(assigns(:game)).to eq(game1)
    end
  end

  describe "new" do
    it "should contain a list all of existing types" do
      get :new
      expect(assigns(:types)).to eq(Type.all)
    end
  end

  describe "create" do
    it "creates a game if given good params" do
      post :create, game: { title: "A new game", type: [{"1"=>"1"}] }

      expect(assigns(:game)).to be_a(Game)
      expect(assigns(:game).id).not_to be_nil
    end
  end

end
