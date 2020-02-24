
class App
        def self.main
            Superhero.build(Scraper.scrape)
            input = nil
            while input != 3
                puts "\nWelcome Marvel Fan!. Please chose an option\n 1 View all superheroes\n 2 Search by\n 3 Exit"
                input = gets.to_i
                case input
                when 1
                    App.all_superheroes
                when 2
                    App.search_by
                when 3
                    exit
                else
                    puts "Not a valid entry, try again"
                end                
            end
        end

        def self.all_superheroes
            Superhero.all.each{|chr|puts "\n Character name: #{chr.character_name}\n Full Name: #{chr.full_name}\n About: #{chr.about}\n" }             
        end

        def self.search_by
            user_input = nil 
            while user_input !=3
                puts "\nPlease choose search type\n 1 search by character name\n 2 Search by full name\n 3 Main menu"
                    user_input = gets.to_i
              case   user_input 
                when 1
                    puts  "\nPlease type character name"
                    hero_input = gets.chomp.split.map(&:capitalize).join(' ')
                    hero = App.search_character(hero_input)          
                    puts "==================================\n"
                    if hero == nil 
                        puts "No Match Found!"
                    else

                    puts "\n Character name: #{hero.character_name}\n Full Name: #{hero.full_name}\n About: #{hero.about}\n"

                    end
                when 2
                    puts  "\nPlease type full name"
                    hero_input = gets.chomp.split.map(&:capitalize).join(' ')
                    hero = App.search_full_name(hero_input)          
                    puts "==================================\n"
                     if hero == nil 
                        puts "No Match Found!"
                     else
                        puts "\n Character name: #{hero.character_name}\n Full Name: #{hero.full_name}\n About: #{hero.about}\n"
                     end
                when 3
                        return nil
                else
                        puts "Invalid entry, try again"
                end            
            end
        end

        def self.search_character(name)        
            Superhero.all.find {|chr| chr.character_name == name}     
        end

        def self.search_full_name(name)        
            Superhero.all.find {|chr| chr.full_name == name}     
        end
end
