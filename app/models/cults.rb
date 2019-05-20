class Cult

  attr_reader :name, :location, :founding_year, :slogan
  @@cults = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@cults << self
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def cult_population
    total = BloodOath.all.select{|oath|oath.cult.name == self.name}
    total.count
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
    self.all
  end

end
