require 'rails_helper'

feature "When a user visits the snack show page" do
  scenario "they see a information for that snack" do
    sam = Owner.create(name: "Sam's Snacks")
    sam.machines.create(location: "Don's Mixed Drinks")
    sam.machines.create(location: "Turing Basement")
    cheetos = Snack.create(name: "Cheetos", price: 1, machine_id: 1)


    visit snack_path(cheetos)

    expect(page).to have_content("Cheetos")
    expect(page).to have_content("$1")
  end
end
