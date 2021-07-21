class Category < ApplicationRecord
    has_many :markers, dependent: :destroy
    has_many :children, class_name: 'Category', dependent: :destroy
    belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true 


    enum status: [:privado, :publico] 

    # def all_children
    #     self.children.flat_map do|child|
    #       child.all_children << child
    #     end
    # end

    def add_categories(cat)
        cat.each do |type_id, category_id|
            if category_id != ''
                temp_marker = self.marker.where(type_id: type_id).first
                temp_marker.category_id = category_id
                temp_marker.save
            end
        end 
    end
    

end
