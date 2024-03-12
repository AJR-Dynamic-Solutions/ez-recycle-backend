class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  # Override the create action to include logging
  def create
    puts "Login action triggered"
    puts "Params received: #{params.inspect}" # Logging the parameters received
    super # Call the original create method
  end

  # Override the destroy action to include logging
  def destroy
    puts "Logout action triggered"
    super # Call the original destroy method
  end

  # Override the respond_with method to render JSON
  private
  def respond_with(resource, _opts = {})
    render json: resource
  end

  # Override the respond_to_on_destroy method to render JSON
  def respond_to_on_destroy
    render json: { message: "Logged out." }
  end
end