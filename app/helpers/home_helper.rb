module HomeHelper

    def finished?(game)
        ready_to_play = true

        if game.chances == 0
            return "Game is finished"
        else
            ready_to_play = true
        end


        if game.pinpoint.include?('*') 
            ready_to_play = true
        else
            return "Game is finished"
        end

        # byebug

        if ready_to_play
            return link_to "Continue", game_path(game)
        else
            
        end
    end

    def render_difficulty(game)

        case game.diff_id
        when 1
            return "Easy"
        when 2
            return "Intermediate"
        when 3
            return "Hard"
        end
    end
end
