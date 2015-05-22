require 'rails_helper'

  feature "Signing in" do
    background do
      User.create(:username => "Django", :password => "Unchained")
    end

    scenario "Signing in with correct credentials" do
      visit '/login'
      # within("#session") do
        #maybe these should be filling in a simble
        fill_in 'Username', :with => 'Django'
        fill_in 'Password', :with => 'Unchained'
      # end

      click_button 'Log in'
      expect(page).to have_content("Welcome to MyGameZone!")
    end#END SCENARIO

  end#END FEATURE SIGNING IN


