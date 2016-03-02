require "rails_helper"

RSpec.describe "items",
               type: :feature do
  scenario "Create new item" do
    visit new_item_path

    fill_in "Titulo", with: "Some title"

    click_button "Crear Item"

    expect(page).to have_text("Success")
  end
end
