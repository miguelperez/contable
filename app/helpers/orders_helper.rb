module OrdersHelper
  #returns a class name for a row of a table. It depends on the 
  #expiration date of the order
  def order_class(order)

    now = Date.new(Time.now.year, Time.now.month, Time.now.day)
    expiration_date = order.expiration_date
    old = Date.new(expiration_date.year, expiration_date.month, expiration_date.day)

    return 'expired' if old <= now
    return ""
  end
end
