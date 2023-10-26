# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  # order = Order.first
  def order_receipt
    order = Order.first
    OrderMailer.order_receipt(order)
  end
end
