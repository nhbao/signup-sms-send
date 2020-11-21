require 'rails_helper'

RSpec.describe RemindsController, type: :controller do
  let(:user_1) { create(:user) }
  let!(:remind_1) { create(:remind) }
  let!(:remind_2) { create(:remind, name: 'sms_2day', delay_days: 2) }
  before { sign_in user_1 }

  describe 'GET #index' do
    specify do
      get :index
      expect(response).to be_successful
      expect(assigns(:reminds)).to eq([remind_1, remind_2])
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    specify do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    specify do
      get :edit, params: { id: remind_1 }
      expect(assigns(:remind)).to eq(remind_1)
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    let(:params) do
      {
        remind: {
          name: name,
          message_remind: 'hello',
          delay_days: 1, 
        }
      }
    end

    context 'success' do
      let(:name) { 'sms_1day' }

      specify do
        expect do
          post :create, params: params
        end.to change(Remind, :count).by(1)
        remind = Remind.last
        expect(remind.name).to eq 'sms_1day'
        expect(remind.message_remind).to eq 'hello'
        expect(flash[:success]).to eq 'Create successful'
      end
    end

    context 'failure' do
      let(:name) { nil }
      
      specify do
        expect do
          post :create, params: params
        end.to change(Remind, :count).by(0)
        expect(response).to render_template :new
        expect(flash[:error]).to eq 'Can not create'
      end
    end
  end

  describe 'PATCH #update' do
    let(:params) do
      {
        id: remind_2.to_param,
        remind: {
          name: name,
          message_remind: 'Hi',
          delay_days: 2,
          remind_by: 'sms'
        }
      }
    end

    context 'success' do
      let(:name) { 'sms_2day' }

      specify do
        put :update, params: params
        remind = remind_2.reload
        expect(remind.name).to eq 'sms_2day'
        expect(remind.message_remind).to eq 'Hi'
        expect(remind.delay_days).to eq 2
        expect(flash[:success]).to eq 'Update successful'
      end
    end

    context 'failure' do
      let(:name) { nil }
      
      specify do 
        put :update, params: params
        remind = remind_2.reload
        expect(response).to render_template :edit
        expect(flash[:error]).to eq 'Can not update'
      end
    end
  end
end
