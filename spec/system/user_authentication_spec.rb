require "rails_helper"

RSpec.describe "User authentication", type: :system do
  scenario "User sees links to sign up and sign in" do
    visit '/'

    expect(page).to have_text "Authenticator"
    expect(page).to have_link "Join", href: "/join"
    expect(page).to have_link "Authenticate", href: "/authenticate"
  end

  scenario "User signs up successfully" do
    visit '/'
    click_link "Join"

    expect(page).to have_text "Become an Authenticator"

    fill_in 'user[email]', with: 'person@example.com'
    fill_in 'user[password]', with: 'testpass'
    fill_in 'user[password_confirmation]', with: 'testpass'

    click_button "Join"

    expect(page).to have_link "Logout", href: "/logout"
  end

  scenario "User authenticates successfully" do
    user = User.create(email: "person@example.com", password: "testpass")

    visit "/"
    click_link "Authenticate"

    expect(page).to have_text "Authenticate"

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_button "Authenticate"

    expect(page).to have_link "Logout", href: "/logout"
  end

  scenario "User logs out successfully" do
    user = User.create(email: "person@example.com", password: "testpass")

    visit "/"
    click_link "Authenticate"
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button "Authenticate"

    click_link "Logout"

    expect(page).to have_link "Join", href: "/join"
    expect(page).to not_have_link "Logout", href: "/logout"
  end
end
