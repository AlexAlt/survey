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
end
