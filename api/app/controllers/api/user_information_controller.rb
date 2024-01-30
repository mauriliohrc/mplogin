class Api::UserInformationController < Api::BaseController
    
    def index
        render json: current_user, status: :ok
    end
    
end