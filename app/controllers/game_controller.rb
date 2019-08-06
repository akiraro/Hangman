require './app/classes/hangman'

class GameController < ApplicationController

    def index

        @hangman = Hangman.new
    end
end
