class Category < ApplicationRecord
    has_many :products, dependent: :destroy
    belongs_to :major_category
    
    extend DisplayList
    scope :major_categories, -> { pluck(:major_category_name).uniq }
    scope :request_category, -> (category) { find(category.to_i) }
end