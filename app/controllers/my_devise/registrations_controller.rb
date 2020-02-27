class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    super
    resource.role_id = Role.find_by(name: 'guest').id
    binding.pry
    if resource.save
      rooms_path
    else
      errors_path
    end
  end
end