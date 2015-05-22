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
      expect(assigns(:games)).to include?(Game.all)
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

  # decribe "create" do
  #   it "" do
  #     expect()
  #   end
  # end

end
