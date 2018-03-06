class OrderMailer < ApplicationMailer
    default from: 'info@visatovietnam.online'
    def order_created(order)
     @order = order
     mail to: @order.email, subject: 'Your order created'

        
    end
end