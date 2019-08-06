class SeshesController < ApplicationController
    before_action :require_login

    def new
        @session = current_user.seshes.new
        @game = Game.new
    end

    def create

        $data = Datum.where(diff_id:params[:sesh][:diff_id])
        randNum = rand(1..$data.length)
        $data = $data[randNum]
        @pin_point = pinpoint_generator($data.data.dup) #Issue when fetching data and there is no data available

        $game = Game.new(diff_id:params[:sesh][:diff_id],data_id:$data.id,guesses:"",chances:8,pinpoint:@pin_point)
        $game.save

        $session = current_user.seshes.new
        $session.game_id = $game.id
        $session.status = "ongoing"
        $session.save

        redirect_to controller: "game"
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
