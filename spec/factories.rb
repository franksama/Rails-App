FactoryGirl.define do
    factory :user do
        name    "Frank Huang"
        email   "test@test.com"
        password "foobar"
        password_confirmation "foobar"
    end
end