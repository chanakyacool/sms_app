class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render text: "Thank you! You will receive an SMS shortly with verification instructions."
      
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @user.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      )

	
	
	@account = client.account
	
	
	@call = @account.calls.create({:from => '+17542273900', :to => '+917207443989', :url => 'https://demo.twilio.com/welcome/voice/'})
    else
      render :new
    end
  end

end
