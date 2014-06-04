#######
# to read Blueprint API Documentation 
# take a look at API.md file
#
class API < Grape::API
  format :json
  helpers do
    params :pagination do
      optional :offset, type: Integer
      optional :limit, type: Integer, default: 30
    end
  end
  
  # Not yet implemented
  params do
    requires :email, type: String, desc: "User email."
  end
  post :users do
  end

  desc "Return travels"
  params do
    use :pagination
  end
  get :travels do
    (params[:from] && params[:to]) ? Travel.find_by_names(params[:from], params[:to]) : Travel.page(params[:offset]).per(params[:limit])
  end
  
  namespace :statuses do
  end

  post :book do
    params[:user_id]
    travel.dec
  end
end