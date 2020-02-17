

class Superhero
    attr_accessor :character_name, :full_name, :about
    @@all = []
    def initialize(character_name, full_name, about)
        @character_name = character_name
        @full_name = full_name
        @about = about
         @@all << self
    end

    def self.build(hash)
        hash.each do |hero|
            Superhero.create(hero)
        end
        
    end

    def self.create(hash)
        new_hero = Superhero.new(hash.keys[0], hash[hash.keys[0]][:full_name], hash[hash.keys[0]][:notes])
    end
    
    def self.all
        @@all        
    end
end
