class CompaniesController < Refinery::ApplicationController
  def index
    @companies = Company.all.paginate
    @meta = Page.find_by_title('Companies')
    render 'index'
  end
  
  def summary
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

end
