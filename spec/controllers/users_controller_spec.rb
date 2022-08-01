require 'rails_helper'

describe UsersController, type: :controller do
  
  describe 'PUT #change_locale' do     
    let(:user) { create(:user) }

    before(:each) do        
      sign_in user
    end

    context 'with valid atributes' do
      
      it "should change locale" do        
        put :change_locale, params: {id: user, locale: 'ru'}
        user.reload        
        expect(user.locale).to eq 'ru'
      end
    end

    context 'with invalid atributes' do      

      it "returns root path" do
        put :change_locale, params: {id: user, locale: ''}             
        expect(response).to redirect_to root_path
      end
    end
  end
end