class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :subjects
    has_one_attached :photo
<<<<<<< HEAD
    has_many :likes
=======

    is_impressionable
    def impression_count
        impressions.size
    end
    
    def unique_impression_count
        impressions.group(:ip_address).size.keys.length
    end
    
>>>>>>> b1da8161c7c0b2615e7aea58d9199eb77690e6fd
end
