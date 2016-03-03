require "rails_helper"

RSpec.describe "items",
               type: :feature do
  scenario "Create new item" do
    visit new_item_path

    fill_in "Titulo", with: "Some title"
    fill_in "Imagen", with: "some_image_url.png"
    fill_in "Precio", with: "2.99"
    fill_in "Detalle", with: "Some detail"

    click_button I18n.t("items.create")

    expect(page).to have_text(
      I18n.t("items.created")
    )
  end

  scenario "missing attributes" do
    visit new_item_path

    # do not fill any fields

    click_button I18n.t("items.create")

    expect(page).to have_text(
      I18n.t("notice.error")
    )
  end
end
