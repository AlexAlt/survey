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
  new_survey = Survey.create({:title => title, :id => nil})
  new_survey.save()
  @surveys = Survey.all()
  redirect('/admin')
end
