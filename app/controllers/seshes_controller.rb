class SeshesController < ApplicationController
    before_action :require_login

    def new
        @session = current_user.seshes.new
        @game = Game.new
    end

    def create
        @game = Game.new(diff_id:params[:sesh][:diff_id])
        @game.save
        @session = current_user.seshes.new
        @session.game_id = @game.id
        @session.save
        redirect_to controller: "game"
    end

end
