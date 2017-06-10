class PropsController < ApplicationController
  before_action :set_prop, only: [:show, :update, :destroy]

  def url

    p params

    key = 'SEM3770FE56767FEDC920DD0DE5EA0480975'
    secret = 'Y2VkNzlkODQwYTI5NjAxMjAxOTEwYTdhMmQwN2I5ODQ'

    sem3 = Semantics3::Products.new(key,secret)

    sem3.products_field("url", params[:url])
    productsHash = sem3.get_products()
    bigJson = productsHash.to_json
    p "-------------------------------------"
    theprice = productsHash["results"][0]["price"]

    name = productsHash["results"][0]["name"]
    bucketprice = theprice.to_i / 8

    priceString = theprice.to_s
    bucketPriceString = bucketprice.to_s
    p name



    p "-------------------------------------"


    account_sid = "AC73e582be2582353535dc5a45da68b72d"

    auth_token = "553c4cd8a6a61ab103419abd1cd25ebd"
    client = Twilio::REST::Client.new(account_sid, auth_token)

     client.messages.create(
      to: "8023094153",
      from: "5189074976",
      body: "Emmet: Looks like you're intereseted in buying a #{name}. The best current market price for this item is $ " + priceString + ".00 via Amazon.  You can finance this purchase today with a bucket for " +  bucketPriceString + ".00 / month.  Item is delivered in 2 business days" 
      )


  end


  # GET /props
  def index
    @props = Prop.all

    render json: @props
  end

  # GET /props/1
  def show
    render json: @prop
  end

  # POST /props
  def create
    @prop = Prop.new(prop_params)

    if @prop.save
      render json: @prop, status: :created, location: @prop
    else
      render json: @prop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /props/1
  def update
    if @prop.update(prop_params)
      render json: @prop
    else
      render json: @prop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /props/1
  def destroy
    @prop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prop
      @prop = Prop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prop_params
      params.require(:prop).permit(:item, :user_id)
    end
end
