require 'rails_helper'

RSpec.describe 'IndexCategories', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.new(name: 'Dario', email: 'darioa@mail.com', password: '123456')
    @user.save
    @category = Category.create(user_id: @user.id, name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/3663/3663544.png')
  end

  it 'Takes user to the splash page' do
    visit '/'
    expect(page.body).to include('PayFocus')
  end

  it 'Shows categories button' do
    visit '/'
    expect(page.body).to include('Log-in')
  end

  it 'shows log out btn' do
    visit '/'
    expect(page.body).to include('Dario')
  end
end
