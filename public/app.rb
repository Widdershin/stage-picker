class Stage < Prism::Component
  attr_reader :name
  attr_reader :img

  def initialize(name:, img:)
    @name = name
    @img = img
  end
end

def load_stages(stages_data)
  stages_data.map { |stage_data| Stage.new(name: stage_data.fetch("name"), img: stage_data.fetch("image_url")) }
end

DEFAULT_STAGES = load_stages(CONFIG.fetch("starters"))
DEFAULT_COUNTERPICKS = load_stages(CONFIG.fetch("counterpicks"))

class Match
  attr_reader :starters
  attr_reader :counterpicks
  attr_reader :state
  attr_reader :bans
  attr_reader :picked_stage
  attr_reader :stages_played

  def initialize
    @modified_dsr = true
    @round = 0
    @state = :awaiting_roles

    @starters = DEFAULT_STAGES
    @counterpicks = DEFAULT_COUNTERPICKS

    @bans = []
    @picked_stage = nil
    @stages_played = []
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
    (@stages_played.include?(stage)) ||
    (@counterpicks.include?(stage) && !counterpicks_enabled?) ||
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
    if @state == :banning && banned?(stage)
      @bans.delete(stage)
      return
    end

    return if disabled?(stage)

    case @state
    when :banning
      ban(stage)
    when :picking
      pick(stage)
    end
  end

  def confirm_pick
    @stages_played << @picked_stage
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
          *(match.starters + match.counterpicks)
            .map { |stage| render_stage(stage) },
        ]),
        button("Ban two stages", props: {disabled: match.bans.length < 2}, onClick: call_match(:confirm_bans)),
      ]
    when :picking
      [
        div(".stages", [
          *(match.starters + match.counterpicks)
            .map { |stage| render_stage(stage) },
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

  def header
    div('.header', 'smashpick.app')
  end

  def render
    div(".stage-picker", [
      header,
      *render_state,
      div('.button-placeholder')
    ])
  end
end

Prism.mount(StagePicker.new)
