class Hangman

    attr_accessor :game, :session
    def initialize(game_id,session_id)

        @game = Game.find_by(id:game_id)
        @session = Sesh.find_by(id:session_id)


    end

    def find_word

    end

end