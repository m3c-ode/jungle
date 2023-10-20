class Sale < ApplicationRecord
  def finished?
    # self is not needed, it's implicit
    self.ends_on < Date.current
  end
  def upcoming? ()
    self.starts_on > Date.current
  end
  def active? ()
    !upcoming? && !finished?
  end

  # AR scope, query the model easily. With self, we define a class method, to eb done on classes. So that in our helper, we can call Sales.active
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
  
end
