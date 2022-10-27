require 'rails_helper'

RSpec.describe 'categories/edit', type: :view do
  before(:each) do
    @user = User.new(name: 'Dario', email: 'darioa@mail.com', password: '123456')
    @user.save
    @category = assign(:category, Category.create!(
                                    name: 'MyString',
                                    icon: 'MyString',
                                    user: @user
                                  ))
  end

  it 'renders the edit category form' do
    render

    assert_select 'form[action=?][method=?]', category_path(@category), 'post' do
      assert_select 'input[name=?]', 'category[name]'

      assert_select 'input[name=?]', 'category[icon]'
    end
  end
end
