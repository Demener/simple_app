require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/home" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/home'
      expect(page).to have_content('Tutorial Sample App | Home')
    end
  end

  describe "GET /static_pages/help" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/help'
      expect(page).to have_content('Tutorial Sample App | Help')
    end
  end

  describe "GET /static_pages/about" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/about'
      expect(page).to have_content('Tutorial Sample App | About')
    end
  end

end
