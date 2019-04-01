class Badge < ApplicationRecord
  RULES = %i[tests_from_one_category test_from_first_try test_from_one_complexity].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :name, :badge_url, presence: true
end
