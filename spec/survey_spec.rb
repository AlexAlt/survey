require('spec_helper')

describe(Survey) do
  it('validates the presence of a title') do
    test_survey = Survey.new({:title => ""})
    expect(test_survey.save()).to(eq(false))
  end

  it("capitalizes the title") do
    survey = Survey.create({:title => "the banana enjoyment survey"})
    expect(survey.title()).to(eq("The Banana Enjoyment Survey"))
  end

  describe('#questions') do
    it('tells which questions are in it') do
      survey = Survey.create({:title => "the banana enjoyment survey"})
      test_question1 = Question.create({:question => "Do you like bananas?", :survey_id => survey.id(), :answer => nil})
      test_question2 = Question.create({:question => "Do you like brown spots on bananas?", :survey_id => survey.id(), :answer => nil})
      expect(survey.questions()).to(eq([test_question1, test_question2]))
    end
  end
end
