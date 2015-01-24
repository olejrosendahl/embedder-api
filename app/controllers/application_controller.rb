class ApplicationController < ActionController::API
  before_action :set_resource, only: [:show, :update, :destroy]

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
    set_resource(resource_class.create(permitted_params[resource_name]))
    render json: get_resource
  end

  def destroy
    get_resource.destroy!
  end

  def update
    get_resource.update(permitted_params[resource_name])
    render json: get_resource
  end


  private

  def get_resource
    instance_variable_get("@#{resource_name}")
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
