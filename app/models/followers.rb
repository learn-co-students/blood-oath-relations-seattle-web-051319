class Follower

  attr_reader :name, :age, :life_motto
  @@followers = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@followers << self
  end

  def cults
    oaths = BloodOath.all.select{|oath|oath.follower == self}
    oaths.map{|oath|oath.cult}
  end

  def join_cult(cult)
    if cult.minimum_age.class == Integer
      if self.age >= cult.minimum_age
        BloodOath.new(cult, self)
      else
        "I am sorry but you are too young to join this religious movement at this time."
      end
    else
    BloodOath.new(cult, self)
    end
  end

  def self.all
    @@followers
  end

  def self.of_a_certain_age(age)
    self.all.select{|follower|follower.age >= age}
  end

  def fellow_cult_members
    members = []
    self.cults.each do |cult|
      cult.followers.each do |follower|
        if follower == self
        else
          if members.include?(follower)
          else
          members << follower
          end
        end
      end
    end
    members
  end

  def my_cults_slogans
    cults.each do |cult|
      puts cult.slogan
    end
  end

  def self.cult_count
    cult_count = Hash.new(0)
    self.all.each do |follower|
      cult_count[follower] = follower.cults.count
    end
      sorted = cult_count.to_a.sort_by {|follower, count| !count}
      sorted.map do |follower, count|
        follower
      end
  end

  def self.most_active
    self.cult_count[0]
  end

  def self.top_ten
    self.cult_count[0..9]
  end

end
