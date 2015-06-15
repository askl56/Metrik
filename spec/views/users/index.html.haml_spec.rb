require 'rails_helper'

describe 'users/index.html.haml' do
  include Devise::TestHelpers
  context 'when there are 2 users' do
    before(:each) do
      assign(:users, [
        stub_model(User, email: '1@example.com'),
        stub_model(User, email: '2@example.com')
      ])
    end

    it 'displays both users' do
      render
      expect(rendered).to include('1@example.com')
      expect(rendered).to include('2@example.com')
    end
  end
end
