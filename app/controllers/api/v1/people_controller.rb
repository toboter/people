class Api::V1::PeopleController < ActionController::API

  def index
    render json: Person.all, each_serializer: PersonSerializer
  end

  def show
    render json: Person.friendly.find(params[:id]), serializer: PersonSerializer
  end
  
  def search
    render json: Person.search(params[:q]), each_serializer: PersonSerializer
  end
end