class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :complexity, message: 'title with this complexity already exist' }
  validates :complexity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :light_test, -> { where(complexity: 0..1) }
  scope :middle_test, -> { where(complexity: 2..4) }
  scope :hard_test, -> { where(complexity: 5..Float::INFINITY) }
  scope :test_complexity, ->(level) { where(complexity: level)}
  scope :with_category, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc) }

  def self.with_array(title)
    with_category(title).pluck(:title)
  end

  def have_timer?
    timer.positive?
  end
end
