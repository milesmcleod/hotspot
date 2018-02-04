class Api::ConnectionsController < ApplicationController

  def create
    @connection = Connection.new(connection_params)
    @connection.requester_id = current_user.id
    if @connection.save
      render :show
    else
      render json: @connection.errors.full_messages, status: 422
    end
  end

  def update
    @connection = current_user.connections.find(params[:id])
    if @connection
      if @connection.update_attributes(connection_params)
        render :show
      else
        render json: ['Failed to update connection.'], status: 422
      end
    else
      render json: ['Could not find connection.'], status: 404
    end
  end

  def destroy
    @connection = current_user.connections.find(params[:id])
    if @connection
      @connection.delete
      render :show
    else
      render json: ['Could not find connection.'], status: 404
    end
  end

  private

  def connection_params
    params.require(:connection).permit(
      :requested_id,
      :pending_boolean
    )
  end
end
