class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end
  
  def index
    @category = Category.all
    @category = Category.order(created_at: :desc)
    @category = Category.count(:name)
  end
  
    def presign_upload
    # pass the limit option if you want to limit the file size
    render json: UploadPresigner.presign("/categories/image/", params[:filename], limit: 1.megabyte)
    end
end