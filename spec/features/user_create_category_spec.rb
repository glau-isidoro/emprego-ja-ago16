require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do
    category = Category.new(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Categoria',       with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'and should fill all fields' do
    visit new_category_path

    click_on 'Criar Categoria'

    expect(page).to have_content 'prohibited this category from being saved'
    expect(page).to have_content "Name can't be blank"
  end

  scenario 'unique categories' do
    category = Category.create(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Categoria',       with: 'Desenvolvedor'

    click_on 'Criar Categoria'

    expect(page).to have_content 'prohibited this category from being saved'
    expect(page).to have_content 'Name has already been taken'
  end

end
