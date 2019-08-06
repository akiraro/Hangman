require './app/classes/hangman'
include GameHelper

class GameController < ApplicationController


    def index
        @alphabet = "A"
        @game = $game
        @session = $session
        @hangman = Hangman.new($game.id,$session.id)
    end

    def edit

        @game = Game.find_by(id:params[:id])
        @data = Datum.find_by(id:@game.data_id)
        puts @data.data
        @game.guesses << params[:value]
        check_entry(@game,@data.data,params[:value])
        @game.save
        redirect_to game_index_path
    end

    def update
    
    end

end
