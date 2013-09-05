class Articulo < ActiveRecord::Base



def self.search(search)


  if search
    find(:all, :conditions => ['palabras_claves LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end


	
end
