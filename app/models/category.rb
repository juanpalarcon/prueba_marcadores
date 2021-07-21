class Category < ApplicationRecord
    belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true 
    has_many :children, class_name: 'Category', dependent: :destroy
    has_many :markers, dependent: :destroy


    # enum status: [:privado, :publico] 


    def to_s
        name
        
    end

    def status_private
        if status == true
            'Privado'
        else
            'Publico'
        end
    end
end
