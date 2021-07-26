class Type < ApplicationRecord
    has_many :markers, dependent: :destroy




    def self.type_grafico
        marker = Marker.all.group(:type).count
        hash = {}
        marker.each do |type|
          hash[type[0].name] = Marker.where(type_id: type[0].id).count
        end
        hash
      end
end
