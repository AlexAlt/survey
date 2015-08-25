class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, :presence => true)
  before_save(:capitalize_title)

private

  define_method(:capitalize_title) do
  title = self.title
  capitalize_title = title.split(" ")
  capitalize_title.each() do |title|
      title.capitalize!()
    end
  self.title = capitalize_title.join(" ")
  end
end
