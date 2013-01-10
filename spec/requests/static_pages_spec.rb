require 'spec_helper'

describe "StaticPages" do

    subject { page }
  
    describe "Home page" do
        before { visit root_path }

        it { should have_selector('h1', :text => 'Sample App') }
        it { should have_selector('title', :text => full_title('')) }

        describe "for signed-in users" do

            let(:user) { FactoryGirl.create(:user) }
            
            before do
                FactoryGirl.create(:micropost, :user => user, :content => "Lorem ipsum")
                FactoryGirl.create(:micropost, :user => user, :content => "Dolor sit amet")
            end

            it "should render the user's feed" do
                user.feed.each do |item|
                    page.should have_selector("li##{item.id}", :text => item.content)
                end
            end

        end

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

    describe "profile page" do
        let(:user) { FactoryGirl.create(:user) }
        let!(:m1) { FactoryGirl.create(:micropost, :user => user, :content => "Foo") }
        let!(:m2) { FactoryGirl.create(:micropost, :user => user, :content => "Bar") }

        before { visit user_path(user) }

        it { should have_selector('h1', :text => user.name) }
        it { should have_selector('title', :text => user.name) }

        describe "microposts" do
            it { should have_content(m1.content) }
            it { should have_content(m2.content) }
            it { should have_content(user.microposts.count) }
        end

    end
end
