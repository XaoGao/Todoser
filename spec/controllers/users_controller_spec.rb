require 'rails_helper'

describe UsersController, type: :controller do
  
  describe 'PUT #change_locale' do     
    let(:user) { create(:user) }
    let(:header) {{ 'HTTP_REFERER' => root_path }}

    before(:each) do        
      sign_in user
    end

    context 'with valid atributes' do
      
      it "should change locale" do  
        request.headers.merge!(header)        
        put :change_locale, params: {locale: 'ru'}
        user.reload        
        expect(user.locale).to eq 'ru'
        expect(response).to redirect_to request.referer
      end
    end

    context 'with invalid atributes' do      

      it "returns root path with emty locale" do
        put :change_locale, params: {locale: ''}
        expect(response).to redirect_to root_path
      end

      it "returns root path with not included locale in I18n" do
        put :change_locale, params: {locale: 'us'}
        expect(response).to redirect_to root_path
      end
    end
  end
end