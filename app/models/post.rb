class Post < ApplicationRecord
    belongs_to :user
    has_many :subjects
    has_one_attached :photo
    has_many :likes
end
