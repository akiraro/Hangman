class Hangman

    attr_accessor :game, :session, :data
    def initialize(game_id,session_id)

        @game = Game.find_by(id:game_id)
        @session = Sesh.find_by(id:session_id)
        @data = Store.find_by(id:@game.data_id)

    end


end