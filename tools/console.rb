require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Big Iron", "Agua Fria", 1905, "The stranger there among them had a big iron on his hip")
c2 = Cult.new("Lil Copper", "Agua Fria", 1945, "K, bud")

f1 = Follower.new("Curtis", 21, "Get rich or die tryin'")
f2 = Follower.new("John", 27, "Go")
f3 = Follower.new("Kate", 34, "Alrighy then")
f4 = Follower.new("Sarah", 29, "Yuuuuup")

c1.recruit_follower(f1)
c1.recruit_follower(f2)
c1.recruit_follower(f3)
c1.recruit_follower(f4)

f1.join_cult(c2)
c2.recruit_follower(f2)
f3.join_cult(c2)
f4.join_cult(c2)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
