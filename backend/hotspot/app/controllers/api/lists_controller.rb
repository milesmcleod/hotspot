class Api::ListsController < ApplicationController

  def index

  end

  def create
    @list = List.new(list_params)
    @list.owner_id = current_user.id
    @list.queue_boolean = false
    if @list.save
      render :show
    else
      render json: @list.errors.full_messages, status: 422
    end
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list
      if @list.update_attributes(list_params)
        render :show
      else
        render json: @list.errors.full_messages, status: 422
      end
    else
      render json: ['Could not find list.'], status: 404
    end
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    if @list
      @list.delete
      render :show
    else
      render json: ['Could not find list.'], status: 404
    end
  end

  private

  def list_params
    params.require(:list).permit(
      :title,
      :public_boolean
    )
  end

end
