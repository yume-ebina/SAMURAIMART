class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  
  PER = 16
 
  def self.display_list(page)
    page(page).per(PER)
  end
  
  def self.on_category(category)
    where(category_id: category)
  end
  
  def self.sort_order(order)
     order(order)
  end
  
  def self.category_products(category, page)
    on_category(category).
    display_list(page)
  end
  
  def self.sort_products(sort_order, page)
    on_category(sort_order[:sort_category]).
    sort_order(sort_order[:sort]).
    display_list(page)
  end

  scope :sort_list, -> { 
    {
      "並び替え" => "", 
      "価格の安い順" => "price asc",
      "価格の高い順" => "price desc", 
      "出品の古い順" => "updated_at asc", 
      "出品の新しい順" => "updated_at desc"
    }
  }
  def reviews_new
    reviews.new
  end
end