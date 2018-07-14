require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  #new, create, show
  describe "GET #new" do
    it 'renders the new user template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET # show" do
    it 'renders show page' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'should log in a user' do
        post :create, params: { user: {username: "rich", password: "123456"} }
        user = User.find_by(username: 'rich')
        expect(session[:session_token]).to eq(user.session_token)
      end
      it 'renders show page after creation' do
        post :create, params: { user: {username: "rich", password: "123456"} }
        user = User.find_by(username: 'rich')
        expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid params' do
      it 'should redirect to sign-up page' do
        post :create, params: { user: {username: "rich", password: "16"} }
        user = User.find_by(username: 'rich')
        expect(response).to redirect_to(new_user_url)
      end
    end
  end
end
