
class App
        def self.main
            puts "\nWelcome Marvel Fan!. Please chose an option\n 1 View all superheroes\n 2 Search by\n 3 Exit"
            input = gets.to_i
            #  while input != 3                
                if input == 1
                    App.all_superheroes
                    App.main
                elsif input == 2
                    App.search_by
                    App.main
                elsif input == 3
                    exit
                else
                    puts "Invalid entry, try again"
                    App.main
                end
            #  end
        end

        def self.all_superheroes
            Superhero.all.each{|chr|puts "\n#{chr.character_name}\n#{chr.full_name}\n#{chr.about}\n" }             
        end

        def self.search_by 
        puts "\nPlease choose search type\n 1 search by character name\n 2 Search by full name\n 3 Exit"
            input = gets.to_i
            if input == 1
                puts  "\nPlease type character name"
                hero_input = gets.chomp.split.map(&:capitalize).join(' ')
                hero = App.search_character(hero_input)          
                puts "==================================\n"
                if hero == nil 
                    puts "No Match Found!"
                else

                puts "#{hero.character_name}\n#{hero.full_name}\n#{hero.about}"
                end
            elsif input == 2
                puts  "\nPlease type full name"
                hero_input = gets.chomp.split.map(&:capitalize).join(' ')
                hero = App.search_full_name(hero_input)          
                puts "==================================\n"
                if hero == nil 
                    puts "No Match Found!"
                else
                puts "#{hero.character_name}\n#{hero.full_name}\n#{hero.about}"
                end
            elsif input == 3
                exit
            else
                puts "Invalid entry, try again"
            end            
        end

        def self.search_character(name)        
            Superhero.all.find {|chr| chr.character_name == name}     
        end

        def self.search_full_name(name)        
            Superhero.all.find {|chr| chr.full_name == name}     
        end
end
