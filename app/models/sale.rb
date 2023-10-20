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
end
