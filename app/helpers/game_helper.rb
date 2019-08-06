module GameHelper

    def disabledButton?(value,guesses)
       return guesses.include? value
    end

    def check_entry(game,data,value)
        indexArray = []
        hit = false

        for num in 0...data.length
            if data[num].downcase == value
                game.pinpoint[num] = value
                hit = true
            else

            end
        end

        if hit == false
            game.chances -= 1
        end
        # byebug
    end

    def finished?
        ready_to_play = true

        if @hangman.game.chances == 0
            return ready_to_play = false
        else
            ready_to_play = true
        end


        if @hangman.game.pinpoint.include?('*') 
            ready_to_play = true
        else
            return ready_to_play = false
        end

        # byebug
        return ready_to_play

    end

    def render_image

        src = ""

        case @hangman.game.chances
        when 8
            src = "hg0.png"
        when 7
            src = "hg1.png"
        when 6
            src = "hg2.png"
        when 5
            src = "hg3.png"
        when 4
            src = "hg4.png"
        when 3
            src = "hg5.png"        
        when 2
            src = "hg6.png"
        when 1
            src = "hg7.png"
        when 0
            src = "hg8.png"
        end
        
        return image_tag(src, size: "120x120")
    end



end
