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

describe('adding questions to a survey', {:type => :feature}) do
  it('allows a user to add a question to a survey') do
    test_survey = Survey.new({:title => "The Banana Enjoyment Survey", :id=> nil})
    test_survey.save()
    visit("/surveys/#{test_survey.id}/questions")
    fill_in("question", :with => "Do you like dark spots on your Banana?")
    click_button("Add Question")
    expect(page).to have_content("Do you like dark spots on your Banana?")
  end
end

# describe('removing a question from a survey', {:type => :feature}) do
#   it('removes a question from a specific survey') do
#     test_survey = Survey.new({:title => "The Banana Enjoyment Survey", :id=> nil})
#     test_survey.save()
#     test_question = Question.new({:question => "Do you like dark spots on your Banana?", :survey_id => test_survey.id(), :answer => nil, :id => nil})
#     test_question.save()
#     visit("/surveys/#{test_survey.id()}/questions")
#     click_button("Delete")
#     expect(page).to have_content("The Banana Enjoyment Survey")
#   end
# end
