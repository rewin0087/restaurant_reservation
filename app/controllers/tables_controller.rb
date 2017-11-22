class TablesController < ApplicationController
  before_filter :set_table, only: [:edit, :update, :destroy, :show]

  def search_vacant_for_reservation
    @date_time = params[:reservation][:date_time]
    @seats = params[:reservation][:seats]
    @tables = Table.find_vacants(@date_time, @seats)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.valid? && @table.save
      redirect_to tables_path, notice: "Table #{@table.name} Created."
    else
      flash.now[:error] = 'Failed to create table. Please check errors below.'
      render :new
    end
  end

  def edit
  end

  def update
    @table.assign_attributes(table_params)
    if @table.valid? && @table.save
      redirect_to tables_path, notice: "Table #{@table.name} got updated."
    else
      flash.now[:error] = 'Failed to update table. Please check errors below.'
      render :edit
    end
  end

  def destroy
    @table.destroy
    redirect_to tables_path, notice: "Table #{@table.name} got deleted."
  end

  private

  def set_table
    @table = Table.find params[:id]
  end

  def table_params
    params.require(:table).permit(:name, :chairs)
  end
end
