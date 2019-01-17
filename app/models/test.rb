class Test < ApplicationRecord
  has_many :results
  has_many :users, through :results
  belongs_to :category
  def self.sort_body_test_desc(title)
    joins('JOIN categories ON test.category_id = categories.id').where(categories: { title: :category })
      .order(title: :desc).pluck(:title)
  end
end
