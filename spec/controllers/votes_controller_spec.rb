require 'rails_helper'

RSpec.describe VotesController, type: :controller do
	let(:game) { Game.create(title: "board bored") }
	let(:user) { User.create(username: "guy", password: "password") }

	# describe "upvote" do 
	# 	context "no user vote already exists" do
	# 		it "creates a new upvote" do 
	# 			session[:user_id] = user.id
	# 			post :upvote, { game_id: game.to_param }

	# 			expect(assigns(:vote)).to be_a(Vote)
	# 			expect(assigns(:vote).value).to eq(1)
	# 			expect(Vote.where(user: current_user, game: game).length).to eq(1)
	# 		end
	# 	end
		# context "user (down)vote already exists" do
		# 	it "should change vote.value but not create new vote" do
		# 		session[:user_id] = user.id
		# 		vote = Vote.create(user: current_user, game: game, value: -1)
		# 		post :upvote, { game: game.to_param }

		# 		expect(assigns(:vote).value).to eq(1)
		# 		expect(Vote.where(user: current_user, game: game).length).to eq(1)
		# 	end
		# end
		# context "user (up)vote already exists" do
		# 	it "should change nothing!!!" do
		# 		session[:user_id] = user.id
		# 		vote = Vote.create(user: current_user, game: game, value: 1)
		# 		post :upvote, { game: game.to_param }

		# 		expect(assigns(:vote).value).to eq(1)
		# 		expect(Vote.where(user: current_user, game: game).length).to eq(1)
		# 	end
		# end
	# end

	# describe "downvote" do 
	# 	context "no user vote already exists" do
	# 		it "creates a new downvote" do
	# 			session[:user_id] = user.id
	# 			post :downvote, { game: game.to_param }

	# 			expect(assigns(:vote)).to be_a(Vote)
	# 			expect(assigns(:vote).value).to eq(-1)
	# 			expect(Vote.where(user: current_user, game: game).length).to eq(1)
	# 		end
	# 	end
	# 	context "user (up)vote already exists" do
	# 		it "should change vote.value but not create new vote" do
	# 			session[:user_id] = user.id
	# 			vote = Vote.create(user: current_user, game: game, value: 1)
	# 			post :upvote, { game: game.to_param }

	# 			expect(assigns(:vote).value).to eq(-1)
	# 			expect(Vote.where(user: current_user, game: game).length).to eq(-1)
	# 		end
	# 	end
	# 	context "user (down)vote already exists" do
	# 		it "should change nothing!!!" do
	# 			session[:user_id] = user.id
	# 			vote = Vote.create(user: current_user, game: game, value: -1)
	# 			post :upvote, { game: game.to_param }

	# 			expect(assigns(:vote).value).to eq(-1)
	# 			expect(Vote.where(user: current_user, game: game).length).to eq(-1)
	# 		end
	# 	end
	# end


end
