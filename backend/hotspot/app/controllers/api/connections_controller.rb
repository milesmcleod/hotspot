class Api::ConnectionsController < ApplicationController

  def index
    @connections = current_user.connections
    render :index
  end

  def create
    @connection = Connection.new(connection_params)
    @connection.user1_id = current_user.id
    if @connection.save
      render :show
    else
      render json: @connection.errors.full_messages, status: 422
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
      :user2_id
    )
  end
end
