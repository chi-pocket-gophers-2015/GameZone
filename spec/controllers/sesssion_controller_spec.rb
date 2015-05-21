require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	describe "CREATE" do 
		# it "a successful login will add to the session" do 
		# 	expect(session)
		# end

		it "a unsuccessful login will not add to the session" do 

		end
	end

	describe "DESTROY" do 
		it "clears the session" do
			session[:user_id] = 10
			delete :destroy
			expect(session[:user_id]).to be_nil
		end
	end
end