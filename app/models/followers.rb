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
    oaths = BloodOath.all.select{|oath|oath.follower.name == self.name}
    oaths.map{|oath|oath.cult}
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
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

end
