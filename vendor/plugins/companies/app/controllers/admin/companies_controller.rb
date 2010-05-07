class Admin::CompaniesController < Admin::BaseController

  crudify :company, :title_attribute => :name

end
