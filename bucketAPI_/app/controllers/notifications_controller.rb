class NotificationsController < ApplicationController
 rescue_from StandardError do |exception|
    trigger_sms_alerts(exception)
  end

  def trigger_sms_alerts(e)
    @alert_message = "
      [This is a test] ALERT! 
      It appears the server is having issues. 
      Exception: #{e}. 
      Go to: http://newrelic.com for more details."
    @image_url = "http://howtodocs.s3.amazonaws.com/new-relic-monitor.png"

    @admin_list = YAML.load_file('config/administrators.yml')
    @admin_list.each do |admin|

      begin
        phone_number = admin['8023094153']
        send_message(phone_number, @alert_message, @image_url)
        flash[:success] = "Exception: #{e}. Administrators will be notified."
      rescue
        flash[:alert] = "Something went wrong."
      end

    end

    redirect_to '/'
  end

  def index
  end

  def server_error
    raise 'A test exception'
  end

  private


  account_sid = "AC73e582be2582353535dc5a45da68b72d"

  auth_token = "553c4cd8a6a61ab103419abd1cd25ebd"
  @client = Twilio::REST::Client.new account_sid, auth_token

    def send_message(phone_number, alert_message, image_url)

      @twilio_number = ENV['5169074976']
      @client = Twilio::REST::Client.new account_sid, auth_token
      
      message = @client.account.messages.create(
        :from => @twilio_number,
        :to => phone_number,
        :body => alert_message,
        # US phone numbers can make use of an image as well.
        # :media_url => image_url 
      )
      puts message.to
    end

end
end
