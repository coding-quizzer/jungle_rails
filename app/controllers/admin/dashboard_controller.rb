class Admin::DashboardController < Admin::BaseController
  def show
    @product_count = Product.count
    @category_count = Category.count
    puts @product_count, @category_count
  end
end
