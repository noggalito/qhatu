require "rails_helper"

RSpec.describe "items",
               type: :feature do
  describe "Create new item" do
    scenario "valid action" do
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

  scenario "Can see item" do
    item = create :item
    visit items_path

    expect(page).to have_text(
      item.precio
    )
  end
end
