require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Big", "Denver", 1905, "Get Big")
c2 = Cult.new("Small", "Chattanooga", 1978, "That aways")
c3 = Cult.new("Medium", "Denver", 1945, "J")

f1 = Follower.new("John", 25, "Yup")
f2 = Follower.new("Kris", 37, "Alright then")
f3 = Follower.new("James", 19, "Go")
f4 = Follower.new("Beth", 29, "K")

c1.recruit_follower(f1)
c1.recruit_follower(f2)

f1.join_cult(c2)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
