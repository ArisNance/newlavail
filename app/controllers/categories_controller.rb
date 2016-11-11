class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end
  
  def index
    @category = Category.all
    @category = Category.order(created_at: :desc)
    @category = Category.count(:name)
  end
end