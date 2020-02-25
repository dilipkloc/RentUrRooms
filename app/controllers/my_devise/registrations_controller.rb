class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      @user = User.find(resource.id)
      @user.role_id = Role.find_by(name: 'guest').id
      if @user.save
        rooms_path
      else
        errors_path
      end
      # @permission = Permission.new
      # @permission.user_id = resource.id
      # @permission.role_id = Role.find_by(name: 'guest').id
      # if @permission.save
      #   rooms_path
      # else
      #   errors_path
      # end

    else
      errors_path
    end
  end
end