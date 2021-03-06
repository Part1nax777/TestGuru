class Badge < ApplicationRecord
  RULES = %w[tests_from_one_category test_from_first_try test_from_one_complexity].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :name, :badge_url, presence: true
  validates :rule, inclusion: { in: RULES }
  validates :rule, uniqueness: { scope: :rule_params }
end
