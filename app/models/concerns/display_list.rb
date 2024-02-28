module DisplayList
  
  PER = 16
  
  def display_list(page)
    page(page).per(PER)
  end
end