class Subject < ApplicationRecord
    belongs_to :post, :optional => true
    serialize :users, Array
end
