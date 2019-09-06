class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def my_total_likes
        total = []
        self.posts.each do |post|
            total << post.likes
        end
        #byebug
        total.sum
    end

    def my_featured_post
        self.posts.max_by do |post|
        post.likes
        end
    end

end