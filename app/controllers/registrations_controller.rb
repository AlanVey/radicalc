class RegistrationsController < Devise::RegistrationsController
  
  def new
    redirect_to '/'
  end

  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved and create_profile and create_quaestio_user(params[:user][:profile][:first_name], params[:user][:profile][:last_name], resource.email)
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      redirect_to '/', notice: 'Please use a valid email and password (more than 7 characters) to sign up'
    end
  end

  private
    def create_profile
      @profile = Profile.new
      @profile.first_name = params[:user][:profile][:first_name]
      @profile.last_name  = params[:user][:profile][:last_name]
      @profile.user_id    = resource.id
      @profile.save
    end

    def create_quaestio_user(firstname, lastname, email)
      Quaestio.new.createUser(firstname, lastname, email)
    end
end