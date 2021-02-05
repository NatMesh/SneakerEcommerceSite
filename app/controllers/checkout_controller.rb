class CheckoutController < ApplicationController
  # POST /checkout/create
  # A product id will be in the params hash: params[:product_id]
  def create
    #confirm if user is signed in before being able to make purchase
    if  !(customer_signed_in?)
      flash[:danger] = 'Must be signed in to go to checkout menu!'
      redirect_to root_path
    else
      #Load up the product the user wishes to purchases from the Sneaker model

      session[:shopping_cart].each do |item|
        sneaker = Sneaker.find(item["id"])
        #checks to make sure we arent being given bad data if shoe doesnt exist we dont proceed with payment process
        if sneaker.nil?
          redirect_to root_path
        end
      end

      #our array that will store the hash with key value pairs for our item
      sneaker_line_items = []

      #user our user info to find out tax rate based on where they live
      signed_in_customer = Customer.where(email: current_customer.email).first

      gst = (signed_in_customer.province.goods_and_services_tax).to_f / 100

      pst = (signed_in_customer.province.provincial_sales_tax).to_f / 100

      hst = (signed_in_customer.province.harmonized_sales_tax).to_f / 100

      #produces our hash with key value pairs for our array of line items to be sent to Stripe for processing below
      session[:shopping_cart].each do |item|
        sneaker = Sneaker.find(item["id"])

        sneaker_line_items << {
          name: sneaker.name,
          description: sneaker.shoe_story,
          amount: sneaker.price_cents,
          currency: "cad",
          quantity: item["quantity"]
        }

        if gst != 0
          sneaker_line_items << {
            name: "GST",
            description: "Goods and Services Tax",
            amount: (sneaker.price_cents * gst).to_i,
            currency: "cad",
            quantity: 1
          }
        end

        if pst != 0
          sneaker_line_items << {
            name: "PST",
            description: "Provincial Sales Tax",
            amount: (sneaker.price_cents * pst).to_i,
            currency: "cad",
            quantity: 1
          }
        end

        if hst != 0
          sneaker_line_items << {
            name: "HST",
            description: "Harmonized Sales Tax",
            amount: (sneaker.price_cents * hst).to_i,
            currency: "cad",
            quantity: 1
          }
        end
      end


      # Establish a connection with Stripe
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ["card"],
        success_url:          checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url:           checkout_cancel_url,
        line_items:           sneaker_line_items
      )


      #then redirect the user to the payment screen via a javascript view.
      respond_to do |format|
        format.js #render app/view/checkout/create.js.erb
      end
    end
  end

  def success
    # We tooke the customers money!
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @customer = Customer.where(email: current_customer.email).first
  end

  def cancel
    # Something went wrong with the payment!
  end
end
