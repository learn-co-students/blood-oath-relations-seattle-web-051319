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
    total = BloodOath.all.select{|oath|oath.cult.name == self.name}
    total.count
  end

  def followers
    oaths = BloodOath.all.select{|oath|oath.cult.name == self.name}
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

end
