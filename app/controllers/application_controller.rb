class ApplicationController < ActionController::API
  before_action :set_resource, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    resources = resource_class.all
    plural_resource_name = resource_name.pluralize
    instance_variable_set("@#{plural_resource_name}", resources)
    render json: {plural_resource_name => resources}
  end

  def show
    render json: get_resource
  end

  def create
    new_resource = resource_class.new(permitted_params[resource_name])
    if new_resource.save
      set_resource(new_resource)
      render json: new_resource, status: :created
    else
      render json: new_resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if get_resource.destroy
      render json: :no_content, status: :ok
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end

  def update
    if get_resource.update(permitted_params[resource_name])
      render json: :no_content, status: :ok
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end


  private

  def get_resource
    instance_variable_get("@#{resource_name}")
  end

  def record_not_found
    render json: {message: "Record not found"}, status: :not_found
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  def set_resource(resource = nil)
    resource ||= resource_class.find(params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

end
