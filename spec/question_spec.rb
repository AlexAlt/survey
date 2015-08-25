require('spec_helper')

describe(Question) do
  describe('#survey') do
    it('tells which survey it belongs to') do
      test_survey = Survey.create({:title => "Banana Enjoyment"})
      test_question = Question.create({:question => "Do you like bananas?", :survey_id => test_survey.id(), :answer => nil})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end
end
