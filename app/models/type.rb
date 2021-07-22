class Type < ApplicationRecord
    has_many :markers, dependent: :destroy


    validates :name, presence: true,  uniqueness: { case_sensitive: false }
end
