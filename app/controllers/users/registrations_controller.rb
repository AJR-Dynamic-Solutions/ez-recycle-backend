class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    puts "Signup action triggered"
    puts "Params received: #{params.inspect}" # This will log our parameters we receive
    build_resource(sign_up_params)
    resource.save
    sign_in(resource_name, resource)
    render json: resource
  end
end