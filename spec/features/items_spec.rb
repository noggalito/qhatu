require "rails_helper"

RSpec.describe "items",
               type: :feature do
  scenario "Create new item" do
    visit new_item_path

    fill_in "Titulo", with: "Some title"

    click_button I18n.t("items.create")

    expect(page).to have_text(
      I18n.t("items.created")
    )
  end
end
