class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        @@all << self
            
    end

    def cults
        BloodOath.all.select {|oath| oath.follower == self}
    end

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(num)
        @@all.select {|follower| follower.age >= num}
    end

    def my_cults_slogans
        my_oaths = cults
        my_oaths.collect {|oath| oath.cult.slogan}
    end

    def self.most_active
        most_active_follower = @@all[0]
        cults_joined = most_active_follower.cults.count
        @@all.each do |follower|
            if follower.cults.count > cults_joined
                cults_joined = follower.cults.count
                most_active_follower = follower
            end
        end
        most_active_follower
    end

    def self.top_ten
        # iterate through all followers
        # sort followers by number of cults 
        followers_by_cult_count = @@all.sort_by {|follower| follower.cults.count}
        followers_by_cult_count.reverse.first(10)
        # return first ten
    end

    
end