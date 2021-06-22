require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "GET /index" do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context "GET #show" do
    it 'returns a success response' do
      user = User.create!(first_name: 'Le Thanh', last_name: 'Viet', email: 'test@example.com')
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end

  context "GET #create" do
    it 'checks that an user can be created' do
      user = User.create!(first_name: 'Le Thanh', last_name: 'Viet', email: 'test@example.com')
      expect(user).to be_valid
    end
  end

  context "GET #update" do
    it 'checks that an user can be updated' do
      user = User.create!(first_name: 'Le Thanh', last_name: 'Viet', email: 'test@example.com')
      user.update(email: 'viet@example.com')
      expect(User.find_by_email('viet@example.com')).to eq(user)
    end
  end

  context "GET #destroy" do
    it 'checks that an user can be destroyed' do
      user = User.create!(first_name: 'Le Thanh', last_name: 'Viet', email: 'test@example.com')
      user.destroy
      expect(User.count).to eq(0)
    end
  end
end
