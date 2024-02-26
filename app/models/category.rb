class Category < ApplicationRecord
    has_many :products
    
    scope :major_categories, -> { pluck(:major_category_name).uniq }
    
    def self.request_category(category)
      find(category.to_i)
    end
end