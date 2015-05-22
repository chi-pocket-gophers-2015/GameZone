require 'rails_helper'

RSpec.describe TypesController, type: :controller do
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
    it "should contain a list all of existing types" do
      get :index
      expect(assigns(:types)).to eq(Type.all)
    end
  end

  describe "show" do
    it "should find the type specified in params" do
      get :show, { id: type1.to_param }
      expect(assigns(:type)).to eq(type1)
    end
    it "should contain a list of games within specified type" do
      get :show, { id: type1.to_param }
      expect(assigns(:games)).to eq(type1.games)
    end
  end

end
