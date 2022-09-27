require 'rails_helper'

RSpec.describe Article, type: :model do
  it "return the slug correctly" do
    article = create(:article)
    expect(article.slug).to eq(article.title.parameterize)
  end

  it "Should not save because title not present" do
    expect{Article.create!(text: "")}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "Title should be at least 5 characters" do
    expect{Article.create!(title: "qwe")}.to raise_error(ActiveRecord::RecordInvalid)
  end

 ## it "Using stub to test slug method" do
 ##   article = double("article")
 ##   allow(Article).to receive(:slug).and_return("article-testing-1")
 ##   Article.first
 ## end
end
