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
