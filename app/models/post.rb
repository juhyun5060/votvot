class Post < ApplicationRecord
    belongs_to :user
<<<<<<< HEAD
    has_many :comments, dependent: :destroy
end
=======
    has_many :subjects
    has_one_attached :photo
end
>>>>>>> 0f47c72c4b4f56c69bf6654722140305dc63e0e2
