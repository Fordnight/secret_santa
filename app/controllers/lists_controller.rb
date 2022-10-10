# frozen_string_literal: true

class ListsController < ApplicationController
  def new
    @list = List.new
    @gift_types_select = GiftType.all.collect { |p| [p.name, p.id] }
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def create
    @list = List.create_list(list_params)
    if @list
      redirect_to @list
    else
      render 'new'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  def play
    @list = List.find(params[:id])
    @list.run_raffle

    redirect_to @list
  end

  private

  def list_params
    params.require(:list).permit(:title, :gift_type_id, players: %i[name  email])
  end
end
