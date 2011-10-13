require 'spec_helper'

describe Card do
  before(:each) do
    login_with_oauth
    visit root_path
    click_link("signin_")
  end
end
