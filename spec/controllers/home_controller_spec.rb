require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }
  let!(:remind) { create(:remind) }

  before { sign_in user }
  
  describe 'GET #index' do
    specify do
      get :index
      expect(response).to be_successful
    end
  end
end