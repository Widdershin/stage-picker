class Stage < Prism::Component
  attr_reader :name
  attr_reader :img

  def initialize(name:, img:)
    @name = name
    @img = img
  end
end

DEFAULT_STAGES = [
  ["Battlefield", "https://www.smashbros.com/assets_v2/img/stage/stage_img1.jpg"],
  ["Final Destination", "https://www.smashbros.com/assets_v2/img/stage/stage_img3.jpg"],
  ["Smashville", "https://www.ssbwiki.com/images/0/02/SSBU-Smashville.png"],
  ["Town and City", "https://www.ssbwiki.com/images/2/26/SSBU-Town_and_City.png"],
  ["Pokémon Stadium 2", "https://www.smashbros.com/assets_v2/img/stage/stage_img40.jpg"]
].map { |(name, img)| Stage.new(name: name, img: img) }

DEFAULT_COUNTERPICKS = [
  ["Kalos Pokémon League", "https://www.ssbwiki.com/images/b/bf/SSBU-Kalos_Pok%C3%A9mon_League.png"],
  ["Lylat Cruise", "https://www.smashbros.com/assets_v2/img/stage/stage_img39.jpg"],
  ["Yoshi's Story", "https://www.smashbros.com/assets_v2/img/stage/stage_img19.jpg"]
].map { |(name, img)| Stage.new(name: name, img: img) }

class Match
  attr_reader :starters
  attr_reader :counterpicks
  attr_reader :state
  attr_reader :bans
  attr_reader :picked_stage

  def initialize
    @round = 0
    @state = :awaiting_roles

    @starters = DEFAULT_STAGES
    @counterpicks = DEFAULT_COUNTERPICKS

    @bans = []
    @picked_stage = nil
  end

  def counterpicks_enabled?
    @round != 0
  end

  def next_round
    @round += 1
  end

  def set_roles
    @state = :banning
  end

  def banned?(stage)
    @bans.include?(stage)
  end

  def disabled?(stage)
    (@counterpicks.include?(stage) unless counterpicks_enabled?) ||
    (@state == :picking && @bans.include?(stage))
  end

  def picked?(stage)
    @picked_stage == stage
  end

  def ban(stage)
    @bans << stage
    @bans.uniq!
    @bans.shift until @bans.length <= 2
  end

  def confirm_bans
    @state = :picking
  end

  def pick(stage)
    @picked_stage = stage
  end

  def select_stage(stage)
    return if disabled?(stage)

    case @state
    when :banning
      ban(stage)
    when :picking
      pick(stage)
    end
  end

  def confirm_pick
    @state = :playing
  end

  def finish_playing
    @bans = []
    @picked_stage = nil
    @state = :banning
    @round += 1
  end
end

class StagePicker < Prism::Component
  attr_reader :match

  def initialize()
    @match = Match.new
  end

  def call_match(method)
    Prism::EventHandler.new(match, method)
  end

  def render_stage(stage)
    div(
      '.stage',
      {
        class: {
          banned: match.banned?(stage),
          disabled: match.disabled?(stage),
          picked: match.picked?(stage)
        },
        onClick: call_match(:select_stage).with(stage)
      },
      [
        img('.stage-icon', attrs: {src: stage.img}),
        div('.stage-name', stage.name)
      ]
    )
  end

  def render_state
    case match.state
    when :awaiting_roles
      [
        h2("Rock paper shotgun to decide who starts!"),
        button(
          "We did it!",
          onClick: call_match(:set_roles)
        )
      ]
    when :banning
      [
        div(".stages", [
          *match.starters.map { |stage| render_stage(stage) },
          div(".break"),
          *match.counterpicks.map { |stage| render_stage(stage) }
        ]),
        button("Ban two stages", props: {disabled: match.bans.length < 2}, onClick: call_match(:confirm_bans)),
      ]
    when :picking
      [
        div(".stages", [
          *match.starters.map { |stage| render_stage(stage) },
          div(".break"),
          *match.counterpicks.map { |stage| render_stage(stage) }
        ]),
        button("Pick a stage", props: {disabled: !match.picked_stage}, onClick: call_match(:confirm_pick)),
      ]
    when :playing
      [
        h2("Playing on #{match.picked_stage.name}"),
        button("Finished", onClick: call_match(:finish_playing))
      ]
    else
      div("Make a view for #{match.state}")
    end


  end

  def render
    div(".stage-picker", [
      *render_state,
    ])
  end
end

Prism.mount(StagePicker.new)
