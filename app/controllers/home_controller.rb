class HomeController < ApplicationController
    def index
        @seshs = current_user.seshes
        @games = Game.where(id: @seshs.map{ |sesh| sesh.game_id })
    end
end
