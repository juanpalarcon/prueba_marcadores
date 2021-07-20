class Type < ApplicationRecord
    has_many :markers, dependent: :destroy
end
