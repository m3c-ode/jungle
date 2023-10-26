class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    puts '\n Order in order_receipt'
    puts @order.inspect
    mail(to: @order.email, subject: "Receipt for order id #{@order.id}")
  end
end
