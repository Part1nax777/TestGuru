class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  def self.sort_body_test_desc(title)
    joins(:results).where(categories: { title: :title })
      .order(title: :desc).pluck(:title)
  end
end
