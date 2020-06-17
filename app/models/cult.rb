class Cult
    attr_reader :slogan
    attr_accessor :name, :location, :founding_year
    
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def recruit_follower(name)
        BloodOath.new(self, name)
    end

    def cult_population
        cult_followers = BloodOath.all.select {|oath| oath.cult == self}
        cult_followers.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        @@all.find {|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.find {|cult| cult.founding_year == year}
    end
        
    def average_age
        # Iterate through all blood oaths, 
        # cult_oaths = select all oaths that involve the instance's cult
        # of cult_oaths, collect each follower's age
        # age_sum = sum the array of ages
        # num_of_followers = cult_population
        # age_sum/num_of_followers.to_f
        cult_oaths = BloodOath.all.select {|oath| oath.cult == self}
        ages = cult_oaths.collect {|oath| oath.follower.age}
        age_sum = ages.sum
        num_followers = cult_population
        avg_age = age_sum/num_followers.to_f
    end

    def my_followers_mottos
        cult_oaths = BloodOath.all.select {|oath| oath.cult == self}
        cult_oaths.collect {|oath| oath.follower.life_motto}
    end

    def self.least_popular
        smallest_cult = @@all[0] 
        pop = smallest_cult.cult_population
        
        @@all.each do |cult| 
            if cult.cult_population < pop
                smallest_cult = cult
                pop = cult.cult_population
            end
        end
        smallest_cult
    end
    
    def self.most_common_location
        # create a location/cult hash
        hash = {}        
        # iterate through all cults
        @@all.each do |cult|
        # assign a location key and add 1 to cult_num value
            if hash.has_key?(cult.location)
                hash[cult.location] += 1
            else 
                hash[cult.location] = 1
            end
        end
        # find the location with the highest value of cults
        most_popular_city = hash.max_by{|key, value| value}
        most_popular_city[0]
    end

end
