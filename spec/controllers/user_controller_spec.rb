require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "HOME" do 
		let(:user) { User.create(username: "human", password: "password") }
		let(:friend1) { User.create(username: "friendly", password: "password") }
		let(:friend2) { User.create(username: "friendlier", password: "password") }
		let(:game1) { Game.create(title: "Game 1") }
		let(:game2) { Game.create(title: "Game 2") }
		let(:own1) { Ownership.create(user: user, game: game1) }
		let(:own2) { Ownership.create(user: user, game: game2) }

		# it "collects list of games belonging to user" do
		# 	session[:user_id] =  

		# end

		it "collects list of users not including self" do 

		end
	end

	describe "NEW" do 
		it "creates a new blank user" do
			get :new
			expect(assigns(:user)).to be_a(User)
			expect(assigns(:user).id).to be_nil
		end
	end

	describe "CREATE" do 
		it "creates a new user with appropriate params" do 
			post :create, { user: { username: "thing 1", password: "code" } }
			expect(assigns(:user)).to be_a(User)
			expect(assigns(:user).id).to be_truthy 
		end

		# it "does not create a user with inappropriate params" do 
		# 	post :create, { user: { username: "", password: "code" } }
		# 	expect(assigns(:user)).to be_nil
		# 	expect(assigns(:user).id).to be_truthy 
		# end

		it "does not accept other params" do  
			post :create, { user: { username: "thing 1", password: "code", first_name: "Loser", ssn: "123456789" } }
			expect(assigns(:user)).to be_a(User)
			expect(assigns(:user).id).to be_truthy 
		end
	end
end