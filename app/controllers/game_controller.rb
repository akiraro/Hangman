require './app/classes/hangman'
include GameHelper

class GameController < ApplicationController
    before_action :require_login

    def new
    
        @hangman = Hangman.new($game.id,$session.id)
        redirect_to game_path(@hangman.game)
    end

    def show
        @alphabet = "A"
        @game = Game.find_by(id:params[:id])
        @hangman = Hangman.new(@game.id,@game.id)
        @ready_to_play = finished?
    end


    def edit

        @game = Game.find_by(id:params[:id])
        @data = Store.find_by(id:@game.data_id)
        puts @data.data
        @game.guesses << params[:value]
        check_entry(@game,@data.data,params[:value])
        @game.save
        redirect_to game_path(@game)
    end

    def update
    
    end

end
