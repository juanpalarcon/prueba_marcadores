class Marker < ApplicationRecord
    belongs_to :category
    belongs_to :type


    def add_categories(cat)
        cat.each do |type_id, category_id|
            if category_id != ''
                temp_marker = self.category .where(type_id: type_id).first
                temp_marker.category_id = category_id
                temp_marker.save
            end
        end 
    end
end
