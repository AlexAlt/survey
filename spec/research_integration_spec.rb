require('spec_helper')
require('capybara/rspec')
require('./app')
require('launchy')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the survey homepage', {:type => :feature}) do
  it('shows links to admin or survey page') do
    visit('/')
    click_link("Admin")
    expect(page).to have_content("Add Survey")
  end
end

describe('the admin homepage', {:type => :feature}) do
  it('allows admin to create a survey') do
    visit('/admin')
    fill_in("title", :with => "The Banana Enjoyment Survey")
    click_button("Add Survey")
    expect(page).to have_content("The Banana Enjoyment Survey")
  end
end
