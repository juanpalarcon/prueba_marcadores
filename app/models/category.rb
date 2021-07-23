class Category < ApplicationRecord
    belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true 
    has_many :children, class_name: 'Category', dependent: :destroy
    has_many :markers, dependent: :destroy


    # enum status: [:privado, :publico] 

    # validates :name, presence: true,  uniqueness: { case_sensitive: false }
    # validates :status, presence: true
    # validates :name, uniqueness: { case_sensitive: false }


    def status_private
        if status == true
            'Privado'
        else
            'Publico'
        end
    end
end
