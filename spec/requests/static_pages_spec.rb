require 'spec_helper'

describe "StaticPages" do

    subject { page }
  
    describe "Home page" do
        before { visit root_path }

        it { should have_selector('h1', :text => 'Sample App') }
        it { should have_selector('title', :text => full_title('')) }
    end

    describe "Help page" do
        it "should have the content 'Help'" do
            visit help_path
            page.should have_content('Help')
        end

        it "should have the right title" do
            visit help_path
            page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
        end
    end

    describe "About page" do
        it "should have the content 'About Us'" do
            visit about_path
            page.should have_content('About Us')
        end

        it "should have the right title" do
            visit about_path
            page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About")
        end
    end

    describe "Contact page" do
        it "should have the h1 'contact'" do
            visit contact_path
            page.should have_selector('h1', :text => 'Contact')
        end

        it "should have the title 'contact'" do
            visit contact_path
            page.should have_selector('title', :text => 'Ruby on Rails Tutorial Sample App | Contact')
        end
    end
end
