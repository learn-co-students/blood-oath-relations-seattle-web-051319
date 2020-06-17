class BloodOath
    attr_reader :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower)
        # Initialize with current date
        date_stamp = Time.new
        year = date_stamp.year.to_s
        month = date_stamp.month.to_s
        day = date_stamp.day.to_s
        date = "#{year}-#{month}-#{day}"

        @cult = cult
        @follower = follower
        @initiation_date = date

        @@all << self
    end

    def self.all
        @@all 
    end

    def self.first_oath
        @@all.first.follower
    end
end
