class Cult

  attr_reader :name, :location, :founding_year, :slogan
  attr_accessor :minimum_age
  @@cults = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@cults << self
  end

  def recruit_follower(follower)
    if self.minimum_age.class == Integer
      if follower.age >= self.minimum_age
        BloodOath.new(self, follower)
      else
        "I am sorry but the follower you are trying to recruit is too young to join this religious movement at this time."
      end
    else
      BloodOath.new(self, follower)
    end
  end

  def cult_population
    total = BloodOath.all.select{|oath|oath.cult == self}
    total.count
  end

  def followers
    oaths = BloodOath.all.select{|oath|oath.cult == self}
    oaths.map {|oath|oath.follower}
  end

  def self.all
    @@cults
  end

  def self.find_by_name(name)
    self.all.find{|cult|cult.name == name}
  end

  def self.find_by_location(location)
    self.all.select{|cult|cult.location == location}
  end

  def self.find_by_founding_year(year)
    self.all.select{|cult|cult.founding_year == year}
  end

  def average_age
    total_age = 0.0
    followers.each do |follower|
      total_age += follower.age
    end
    total_age / followers.count
  end

  def my_followers_mottos
    followers.each do |follower|
      puts follower.life_motto
    end
  end

  def self.least_popular
    min_followers = 10000000000
    self.all.each do |cult|
      if cult.cult_population < min_followers
        min_followers = cult.cult_population
      end
    end
    self.all.select do |cult|
      cult.cult_population == min_followers
    end
  end

  def self.most_common_location
    all_locations = self.all.map do |cult|
      cult.location
    end
    location_count = Hash.new(0)
    all_locations.each do|location|
      location_count[location] += 1
    end
    location_count.max_by do |k, v|
    k
    end[0]
  end

end
