class Scraper
    def self.scrape
        doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Avengers_members"))
        reject_list= ["", "Character", "", "Real name", "", "Joined in", "", "Notes"]
        mega_array = doc.css(".wikitable tbody tr").map{|td|td.children.text}
        heroes = []
        mega_array.each do |hero|
          r = hero.split("\n")
          r = r-reject_list
          hero_attributes = []
          r.each do |line|
            line.delete('\\"')
            hero_attributes << line
          end
          if hero_attributes.size > 1
            hash = {}
            hash[hero_attributes[0].split(".")[0]] = {}
            hash[hero_attributes[0].split(".")[0]][:name] = hero_attributes[0].split(".")[0]
            hash[hero_attributes[0].split(".")[0]][:full_name] = hero_attributes[1].split(",")[0].delete('\\"')
            if hero_attributes[2]
              hash[hero_attributes[0].split(".")[0]][:notes] = hero_attributes[2]
            else
              hash[hero_attributes[0].split(".")[0]][:notes] = "No details found!"
            end
            heroes << hash
          else
            nil
          end 
        end
    heroes
    end
  end

