require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

doggist = Cult.new("Doggist", "Seattle", 2019, "Let's play")
cat_com = Cult.new("Cat Communion", "New York", 2018, "Me-ow")
fish_fan = Cult.new("Fish Fanatics", "Austin", 2017, "Bloop")
antologist = Cult.new("Antologists", "Austin", 2008, "Ants Elope")

jenny = Follower.new("Jenny", 32, "Seize Everything")
peanut = Follower.new("Peanut", 11, "Eat Everything")
tella = Follower.new("Tella", 4, "Question Everything")
teddy = Follower.new("Teddy", 10, "Paws Off")
preston = Follower.new("Preston", 10, "Blah")
garfield = Follower.new("Garfield", 50, "I hate Mondays")
odie = Follower.new("Odie", 35, "Wuf")
maru = Follower.new("Maru", 8, "Mao")
rosa = Follower.new("Rosa", 12, "Tripods Unite")
souffie = Follower.new("Souffie", 8, "whine")
grumpy_cat = Follower.new("Grumpy Cat", 7, "Get out of my face")

grumpy_cat.join_cult(cat_com)
souffie.join_cult(fish_fan)
souffie.join_cult(doggist)
rosa.join_cult(doggist)
odie.join_cult(doggist)
garfield.join_cult(cat_com)
peanut.join_cult(doggist)
peanut.join_cult(cat_com)
tella.join_cult(doggist)
jenny.join_cult(doggist)
jenny.join_cult(antologist)
jenny.join_cult(cat_com)
teddy.join_cult(cat_com)
preston.join_cult(cat_com)








binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
