class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all.order(db_sort_params)

    @link_sort_direction = sort_dir == 'asc' ? 'desc' : 'asc'
  end

  def create
    parser = VehicleTextDataParser.new(text: file_param.read)

    Vehicle.upsert_all(parser.data_for_db, unique_by: :index_vehicles_on_all)

    @vehicles = Vehicle.all

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    Vehicle.destroy_all

    @vehicles = Vehicle.all

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def db_sort_params
     return { vehicle_type: sort_dir } if sort_on == 'vehicle_type'

     { last_name: sort_dir, first_name: sort_dir }
  end

  def sort_dir
    params[:sort_direction] || 'asc'
  end

  def sort_on
    params[:sort_on] || 'name'
  end

  def file_param
    params.require(:vehicle_data)
  end
end
