class VehiclesController < ApplicationController
  def index
    sort_dir = params[:sort_direction] || 'asc'
    sort_on = params[:sort_on] || 'name'

    sort_params = sort_on == 'vehicle_type' ? { vehicle_type: sort_dir } : { last_name: sort_dir, first_name: sort_dir }

    @vehicles = Vehicle.all.order(sort_params)
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

  def file_param
    params.require(:vehicle_data)
  end
end
