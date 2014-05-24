require 'spec_helper'

describe "StaticPages" do

  subject { page }
  describe "Home Page" do
    before { visit root_path }
    it { should have_content('Welcome') }
    it { should have_title('Tutorial Sample App') }
    it { should_not have_title('| Home') }
  end

  describe "Help Page" do
    before { visit help_path }
    it { should have_content('Help') }
    it { should have_title('Tutorial Sample App | Help') }
  end

  describe "About Page" do
    before { visit about_path }
    it { should have_content('About') }
    it { should have_title('Tutorial Sample App | About') }
  end

  describe "Contact Page" do
    before { visit contact_path }
    it { should have_content('Contact') }
    it { should have_title('Tutorial Sample App | Contact') }
  end

end
