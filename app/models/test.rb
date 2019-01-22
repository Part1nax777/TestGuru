class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  #  def self.sort_body_test_desc(title)
  #    joins(:category).where(categories: { title: :title })
  #      .order(title: :desc).pluck(:title)
  #  end

  scope :light_test, -> { where(complexity: 0..1) }
  scope :middle_test, -> { where(complexity: 2..4) }
  scope :hard_test, -> { where(complexity: 5..Float::INFINITY) }

  scope :sort_body_test_desc, -> (title) { joins(:category).where(categories: { title: :title }).order(title: :desc) }
end
