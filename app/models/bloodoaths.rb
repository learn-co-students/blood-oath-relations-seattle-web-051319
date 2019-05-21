class BloodOath

  attr_reader :cult, :follower
  @@bloodoaths = []

  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @date = Time.now.strftime("%Y/%m/%d")
    @@bloodoaths << self
  end

  def initiation_date
    @date
  end

  def self.all
    @@bloodoaths
  end

  def self.first_oath
    @@bloodoaths[0]
  end

end
