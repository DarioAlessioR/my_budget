require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, @user = assign(:user, User.create!(
      name: 'MyString',
      email: 'darioa@mail.com',
      password: '123456'
    )))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
