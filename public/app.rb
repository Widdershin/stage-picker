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
  attr_reader :current_player
  attr_reader :round
  attr_reader :p1_score
  attr_reader :p2_score
  attr_reader :best_of

  def initialize
    @modified_dsr = true
    @round = 0
    @best_of = 3
    @state = :awaiting_roles

    @starters = DEFAULT_STAGES
    @counterpicks = DEFAULT_COUNTERPICKS

    @bans = []
    @picked_stage = nil
    @stages_played = []

    @current_player = nil
    @p1_score = 0
    @p2_score = 0
  end

  def counterpicks_enabled?
    @round != 0
  end

  def next_round
    @round += 1
  end

  def set_roles(best_of, current)
    @best_of = best_of
    @state = :banning
    @current_player = current
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
    switch_players
  end

  def pick(stage)
    @picked_stage = stage
  end

  def switch_players
    if @current_player == 0
      @current_player = 1
    else
      @current_player = 0
    end
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
    @current_player = nil
  end

  def finish_playing(player)
    @bans = []
    @picked_stage = nil
    @current_player = player
    if player == 0
      @p1_score += 1
    else
      @p2_score += 1
    end

    if game_over?
      @state = :game_over
    else
      @round += 1
      @state = :banning
    end
  end

  def score_to_win
    (@best_of / 2).ceil
  end

  def game_over?
    p1_won? || p2_won?
  end

  def p1_won?
    @p1_score >= score_to_win
  end

  def p2_won?
    @p2_score >= score_to_win
  end
end

class Input < Prism::Component
  attr_accessor :value

  def initialize(className, value = "")
    @className = className
    @value = ""
    @initial_value = value
  end

  def render
    input(
      @className,
      onInput: call(:value=).with_target_data(:value),
      attrs: {placeholder: @initial_value},
      props: {value: value}
    )
  end
end

class StagePicker < Prism::Component
  attr_reader :match
  attr_accessor :best_of

  def initialize()
    reset
    @player1 = Input.new(".player", "Player 1")
    @player2 = Input.new(".player", "Player 2")
    @best_of = 3
  end

  def reset
    @match = Match.new
  end

  def call_match(method)
    Prism::EventHandler.new(match, method)
  end

  def p1
    return "Player 1" if @player1.value == ""
    @player1.value
  end

  def p2
    return "Player 2" if @player2.value == ""
    @player2.value
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

  def current_player
    case match.current_player
    when 0
      p1
    when 1
      p2
    else
      ""
    end
  end

  def ban_button_text
    case match.bans.size
    when 0
      "Ban two stages"
    when 1
      "Ban one stage"
    when 2
      "Confirm bans"
    else
      "Fuck you and the horse you rode in on"
    end
  end

  def render_state
    case match.state
    when :awaiting_roles
      [
        div(".roles", [
          div(".player-setup", [
            @player1,
            button("#{p1} picks first", onClick: call_match(:set_roles).with(best_of, 1))
          ]),
          div("vs"),
          div(".player-setup", [
            @player2,
            button("#{p2} picks first", onClick: call_match(:set_roles).with(best_of, 0))
          ]),
        ]),
        div(".settings",
          [3, 5, 7].map do |n|
            div([
              div("Best of #{n}"),
              input(
                attrs: {
                  type: :radio,
                  name: 'best_of',
                  value: n,
                },
                props: {
                  checked: best_of == n
                },
                onInput: call(:best_of=).with(n)
              ),
            ])
          end
        )
      ]
    when :banning
      [
        button("#{current_player}: #{ban_button_text}", props: {disabled: match.bans.length < 2}, onClick: call_match(:confirm_bans)),
        div(".stages", [
          *(match.starters + match.counterpicks)
            .map { |stage| render_stage(stage) },
        ]),
      ]
    when :picking
      [
        button("#{current_player}: Pick a stage", props: {disabled: !match.picked_stage}, onClick: call_match(:confirm_pick)),
        div(".stages", [
          *(match.starters + match.counterpicks)
            .map { |stage| render_stage(stage) },
        ]),
      ]
    when :playing
      [
        div(".match-screen", [
          h1("Game ##{match.round + 1}"),
          h2(match.picked_stage.name),
          div([img('.stage-icon', attrs: {src: match.picked_stage.img})]),
          div(".controls", [
            button("#{p1} won", onClick: call_match(:finish_playing).with(0)),
            button("#{p2} won", onClick: call_match(:finish_playing).with(1))
          ])
        ])
      ]
    when :game_over
      [
        if match.p1_won?
          h1("#{p1} won!")
        else
          h1("#{p2} won!")
        end,
        button("Play again", onClick: call(:reset) )
      ]
    else
      [
        div("Make a view for #{match.state}")
      ]
    end
  end

  def header
    div('.header', [
      'smashpick.app'
    ])
  end

  def match_stats
    div('.match-stats', [
      div({class: {active: current_player == p1}}, [
        div(p1),
        div('.scoreboard', match.p1_score.to_s)
      ]),
      div('.info', [
        div("Best of"),
        div('.scoreboard', @best_of.to_s),

        div(
          case match.state
          when :banning
            "Banning"
          when :picking
            "Picking"
          when :playing
            "Playing"
          else
            ""
          end
        )
      ]),
      div({class: {active: current_player == p2}}, [
        div(p2),
        div('.scoreboard', match.p2_score.to_s)
      ])
    ])
  end

  def render
    div(".stage-picker", [
      header,
      match_stats,
      div(".picker-body", render_state)
    ])
  end
end

Prism.mount(StagePicker.new)
