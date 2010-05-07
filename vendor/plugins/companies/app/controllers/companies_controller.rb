class CompaniesController < ApplicationController
  def index
    @companies = Company.all.paginate
  end
  
  def summary
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

end
