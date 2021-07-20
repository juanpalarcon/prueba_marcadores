class Category < ApplicationRecord
    has_many :markers, dependent: :destroy
    has_many :children, class_name: 'Category', dependent: :destroy
    belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true 

    enum status: [:privado, :publico] 
end
