module SalesHelper
  def active_sale? ()
    # Are there any sales active?
    # Can look into the log to see if the query goes through
    # @current_sale = Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?

    Sale.active.any?
  end
end