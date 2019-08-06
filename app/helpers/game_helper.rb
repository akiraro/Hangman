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

    def reveal

    end

end
