class HomeController < ApplicationController
before_action :require_login

    def index
        @seshs = current_user.seshes
        @games = Game.where(id: @seshs.map{ |sesh| sesh.game_id })
    end
end
