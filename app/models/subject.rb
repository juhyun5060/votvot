class Subject < ApplicationRecord
    belongs_to :post, :optional => true
end
