require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/admin') do
  @surveys = Survey.all()
  erb(:admin)
end

post('/admin') do
  title = params.fetch('title')
  @survey = Survey.create({:title => title, :id => nil})
  @survey.save()
  @surveys = Survey.all()
  redirect("/admin")
end

delete("/surveys/:id") do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  @survey.destroy()
  redirect("/admin")
end

get("/surveys/:id/questions") do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  erb(:survey_questions)
end

post("/surveys/:id/questions") do
  id = params.fetch("id").to_i()
  @survey = Survey.find(id)
  question = params.fetch('question')
  @question = Question.create({:question => question, :answer => nil, :id => nil, :survey_id => id})
  redirect("/surveys/#{id}/questions")
end

delete("/questions/:id") do
  id = params.fetch("id").to_i()
  @question = Question.find(id)
  @question.destroy()
  redirect("/surveys/#{id}/questions")
end

get("/surveys") do
  @surveys = Survey.all()
  erb(:surveys)
end
