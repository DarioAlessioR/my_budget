require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  before(:each) do
    @user = User.new(name: 'Dario', email: 'darioa@mail.com', password: '123456')
    @user.save
    assign(:category, Category.new(
                        name: 'MyString',
                        icon: 'MyString',
                        user: @user
                      ))
  end

  it 'renders new category form' do
    render

    assert_select 'form[action=?][method=?]', categories_path, 'post' do
      assert_select 'input[name=?]', 'category[name]'

      assert_select 'input[name=?]', 'category[icon]'

    
    end
  end
end
