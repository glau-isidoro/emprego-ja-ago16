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

    expect(page).to have_content 'Não foi possível criar a categoria'
  end

  scenario 'unique categories' do
    category = Category.create(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Categoria',       with: 'Desenvolvedor'

    click_on 'Criar Categoria'

    expect(page).to have_content 'Categoria já existente'
  end

end
