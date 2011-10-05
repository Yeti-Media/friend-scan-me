require 'spec_helper'

describe "LayoutLinks" do  
  it "should get home page when user visits /" do
    visit("/")
    page.should have_selector("title", :text => "FriendScan.Me")
  end
  
  it "should go to card edit page" do
    login_with_oauth
    visit root_path
    click_link("signin_")
    page.should have_content("@ FriendScan.Me")
  end
  
  describe "TestCardPageLinks" do
    before(:each) do
      login_with_oauth
      visit root_path
      click_link("signin_")
    end

    it "should take you to home page and have welcome message" do
      click_link("Home")
      page.should have_content("Welcome")
    end
    
    it "should have View Your Card link and work" do
      click_link("View Your Card")
      page.should have_content("Add as a Friend on Facebook")
    end
    
    it "should take you to home page and show Signed out! when Sign Out link is clicked" do
      click_link("Sign Out")
      page.should have_content("Signed out!")
    end
  end
  
end
