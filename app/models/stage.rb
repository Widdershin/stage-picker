class Stage < ApplicationRecord
  has_many :ruleset_stages
  has_many :rulesets, through: :ruleset_stages

  scope :competitive, -> { where(is_competitive: true) }
  scope :not_competitive, -> { where(is_competitive: false) }
end
