require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:gamer) { User.create(username: "human", password: "code") }
  let(:game) { Game.create(title: "board bored") }

  describe "CREATE comments" do
    it "creates a comment if given good params" do
      text = "Lots of words"
      session[:user_id] = gamer.id
      post :create, { game_id: game.to_param, comment: { body: text } }

      expect(assigns(:comment)).to be_a(Comment)
      expect(assigns(:comment).id).not_to be_nil
    end

    it "adds new comment to current user" do
      text = "Lots of words"
      session[:user_id] = gamer.id
      post :create, { game_id: game.to_param, comment: { body: text } }

      expect(assigns(:comment)).to be_a(Comment)
      expect(gamer.comments).to include(assigns(:comment))
    end

    it "adds new comment to game" do
    text = "Lots of words"
    session[:user_id] = gamer.id
    post :create, { game_id: game.to_param, comment: { body: text } }

    expect(assigns(:comment)).to be_a(Comment)
    expect(game.comments).to include(assigns(:comment))
    end
  end

  describe "DESTROY comments" do
    it "destroys a comment" do
      comment_body = "I absolutely love this game becuase I always win!!"
      comment = Comment.create(user: gamer, game: game, body: comment_body)
      comment_num = Comment.all.length

      delete :destroy, { game_id: game.id, id: comment.to_param }
      expect(Comment.all.length).to be(comment_num - 1)
    end
  end
end
