require "rails_helper"

RSpec.describe Api::UserInformationController, type: :controller do 

    describe 'index' do
        let (:user) { User.create!(email: 'jamesbond@007.com', password: 'admin123', name: 'Little Mess Mike.') }
        
        it 'returns 200 status' do
            authenticated_header(request, user)
            
            get :index

            expect(response.status).to eq(200)  
        end

        it 'returns logged information' do
            authenticated_header(request, user)
            get :index

            expect(response_json[:id]).to eq(user.id)
            expect(response_json[:email]).to eq(user.email)
            expect(response_json[:name]).to eq(user.name)
            expect(response_json[:jti]).to eq(user.jti)
        end
    end

    context 'when the user is not logged' do
       it 'returns 401 status' do
            get :index

            expect(response.status).to eq(401)
       end 
    end

end