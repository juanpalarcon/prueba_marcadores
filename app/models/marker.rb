class Marker < ApplicationRecord
    belongs_to :category
    belongs_to :type



    def to_s
        name
    end
end
