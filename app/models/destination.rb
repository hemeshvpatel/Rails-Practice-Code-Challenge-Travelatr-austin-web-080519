class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def my_featured_post
        self.posts.max_by do |post|
        post.likes
        end
    end

    def avg_age
        ages_array = []

        ages = self.bloggers.uniq.each do |blogger|
                ages_array << blogger.age
        end
    
        avg_ages = ages.inject(0.0) {|sum, blogger| sum + blogger.age}.to_f / ages.size
    end

end
