class RulesetsController < ApplicationController
  def index
  end

  def show
    @ruleset = Ruleset.find(params[:id])
  end

  def new
    @ruleset = Ruleset.new
  end

  def create
    ruleset = Ruleset.new(params.require(:ruleset).permit(:name, :description))

    params["ruleset"].each do |key, value|
      if (value == "starter" || value == "counterpick") && key =~ /^include_(\d+)/
        ruleset.ruleset_stages.build(stage_id: $1.to_i, is_starter: value == "starter")
      end
    end

    ruleset.save!

    redirect_to ruleset
  end
end
