class Test < ApplicationRecord
  belongs_to :category
  def self.sort_body_test_desc(title)
    Test.joins(:category).where(categories: { title: :category })
    .order(title: :desc).pluck(:title)
  end
end
