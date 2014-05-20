require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/home" do
    it "should have a home page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/home'
      expect(page).to have_title('Tutorial Sample App')
    end

    it "should not have a custom title" do
    visit 'static_pages/home'
    expect(page).not_to have_title('| Home')
    end

  end

  describe "GET /static_pages/help" do
    it "should have a help page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/help'
      expect(page).to have_title('Tutorial Sample App | Help')
    end
  end

  describe "GET /static_pages/about" do
    it "should have an about page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/about'
      expect(page).to have_title('Tutorial Sample App | About')
    end
  end

end
