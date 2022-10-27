require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
      @user = assign(:user, User.create!(
        name: 'MyString',
        email: 'dario1@mail.com',
        password: '123456'
      )),
      @user = assign(:user, User.create!(
        name: 'MyString',
        email: 'dario2@mail.com',
        password: '123456'
      ))
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 0
  end
end
