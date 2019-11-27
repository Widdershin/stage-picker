class Ruleset < ApplicationRecord
  has_many :ruleset_stages
  has_many :stages, through: :ruleset_stages

  def starters
    @starters ||= ruleset_stages.where(is_starter: true).map { |rs| rs.stage }
  end

  def counterpicks
    @counterpicks ||= ruleset_stages.where(is_starter: false).map { |rs| rs.stage }
  end

  def config
    {
      starters: starters.map { |stage| { name: stage.name, image_url: stage.image_url } },
      counterpicks: counterpicks.map { |stage| { name: stage.name, image_url: stage.image_url } },
      settings: {}
    }
  end

  def starter?(stage)
    starters.include?(stage)
  end

  def counterpick?(stage)
    counterpicks.include?(stage)
  end
end
