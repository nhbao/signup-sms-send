require 'rails_helper'
 
RSpec.describe Users::RegistrationsController, type: :controller do
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#create' do
    let(:params) do
      {
        user: 
        {
          phone: '349397207',
          email: email,
          password: 'AbCdEfGh9876',
          password_confirmation: 'AbCdEfGh9876'
        }
      }
    end

    context 'success' do
      let(:email) { 'usermail@gmail.com' }
      specify do
        expect do
          post :create, params: params
        end.to change(User, :count).by(1)
        user = User.last
        expect(user.phone).to eq '349397207'
        expect(user.email).to eq 'usermail@gmail.com'
      end
    end
 
    context "false" do
      let(:email) { '' }
      
      specify do
        expect do
          post :create, params: params
        end.to change(User, :count).by(0)
      end
    end
  end
end