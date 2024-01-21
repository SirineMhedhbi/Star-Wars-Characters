class Character
    attr_accessor :name, :mass, :homeworld, :films

    def initialize(name, mass, homeworld, films)
        @name = name
        @mass = mass
        @homeworld = homeworld
        @films = films
    end
end
