require './app/classes/hangman'
include GameHelper

class GameController < ApplicationController
    before_action :require_login, only: [:new,:show,:edit]
    before_action :authenticate_via_token, only: [:rnedit, :getList]
    skip_before_action :verify_authenticity_token

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

    def rnedit
        @game = Game.find_by(id:params[:id])
        @data = Store.find_by(id:@game.data_id)
        puts @data.data
        @game.guesses << params[:value]
        check_entry(@game,@data.data,params[:value])
        @game.save
        render json: {status: 'SUCCESS', message:'Session created', game:@game}, status: :ok
    end

    def update
    
    end

    def getList
        @seshs = current_user.seshes
        @games = Game.where(id: @seshs.map{ |sesh| sesh.game_id })
        render json: {status: 'SUCCESS', message:'Game list', game:@games}, status: :ok
    end

    def getData
        @data = Store.find_by(id:params[:id])
        render json: {status: 'SUCCESS', message:'Data of pinpoint', data:@data}, status: :ok

    end

end
