require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
    it { should render_template('index') }
  end
end
