require 'rails_helper'

feature 'User edit jobs' do
  scenario 'successfully' do
    company = create(:company)

    visit edit_company_path(company)

    fill_in 'Nome',       with: 'Campus Code'
    fill_in 'Local',      with: 'São Caetano'
    fill_in 'Email',      with: 'contato_sao_caetano@campus.com.br'
    fill_in 'Telefone',   with: '2369-3476'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Campus Code')
    expect(page).to have_content 'São Caetano'
    expect(page).to have_content 'contato_sao_caetano@campus.com.br'
    expect(page).to have_content '2369-3476'
 end
end
