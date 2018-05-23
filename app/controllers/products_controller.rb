class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
  
  def import
    if [".xls", ".xlsx"].include?(File.extname(params[:file].original_filename))
    name = params[:file].original_filename
    directory = "public/data"
    path = File.join(directory, name)
    file = File.open(path,"wb") { |f| f.write(params[:file].read)}
    ImportFileJob.set(wait_until: Time.now + 30.seconds).perform_later(path)
    redirect_to root_url, notice: "Products imported."
   else
    redirect_to root_url, alert: "Only allowed file extension .xls or .xlsx"
   end
  end

end
