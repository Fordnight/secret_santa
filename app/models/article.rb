class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }

  def slug
    title.parameterize
  end
end
