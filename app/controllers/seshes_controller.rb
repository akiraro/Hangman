class SeshesController < ApplicationController
    before_action :require_login, only: [:new, :create]
    before_action :authenticate_via_token, only: [:rncreate]
    skip_before_action :verify_authenticity_token
    

    def new
        @session = current_user.seshes.new
        @game = Game.new
    end

    def create

        $data = Store.where(diff_id:params[:sesh][:diff_id])
        randNum = rand(1...$data.length)
        $data = $data[randNum]
        @pin_point = pinpoint_generator($data.data.dup) #Issue when fetching data and there is no data available

        $game = Game.new(diff_id:params[:sesh][:diff_id],data_id:$data.id,guesses:"",chances:8,pinpoint:@pin_point)
        $game.save

        $session = current_user.seshes.new
        $session.game_id = $game.id
        $session.status = "ongoing"
        $session.save
    
        redirect_to new_game_path($game)
    end


    def rncreate

        @data = Store.where(diff_id:params[:diff_id])
        randNum = rand(1...@data.length)
        @data = @data[randNum]
        @pin_point = pinpoint_generator(@data.data.dup) #Issue when fetching data and there is no data available

        @game = Game.new(diff_id:params[:diff_id],data_id:@data.id,guesses:"",chances:8,pinpoint:@pin_point)
        @game.save
     
        @session = current_user.seshes.new
        @session.game_id = @game.id
        @session.status = "ongoing"
        @session.save
        render json: {status: 'SUCCESS', message:'Session created', data:@data, game:@game}, status: :ok
    end

    private
    def pinpoint_generator(data)
        randNum = rand(8..(data.length-1))
        @generated_string = data
        while randNum != 0 do
            randIndex = rand(0...data.length)
            if @generated_string[randIndex] == "*" || @generated_string[randIndex] == " "

            else
                @generated_string[randIndex] = "*"
                randNum -= 1
            end
        end

        return @generated_string

    end


end
