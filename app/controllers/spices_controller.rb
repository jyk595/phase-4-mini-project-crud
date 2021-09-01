class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def index
    spices = Spice.all
    render json: spirces
  end

  def create
    spice = Sprice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = spice_id
    render json: spice, status: :accepted
    
  end

  def destroy
    spice = spice_id
    head :no_content
  end

  private
  
  def spice_params
    params.permit(:title, :image, :description)
  end

  def spice_id
    Spice.find_by!(id: params[:id])
  end

  def render_record_not_found(invalid)
    render json: { errors: invalid.record.errors }, status: :not_found
  end

end
