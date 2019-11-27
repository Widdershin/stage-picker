class PlayController < ApplicationController
  def index
    @ruleset = Ruleset.find(params[:id])
  end
end
