require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all snacks in that machine, with prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    cheetos = Snack.create(name: "Cheetos", price: 1, machine_id: 1)
    kind_bars = Snack.create(name: "Kind Bars", price: 2, machine_id: 1)
    visit machine_path(dons)

    expect(page).to have_content("Cheetos $1")
    expect(page).to have_content("Kind Bars $2")

  end

  scenario 'they see the average price of all snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    cheetos = Snack.create(name: "Cheetos", price: 1, machine_id: 1)
    kind_bars = Snack.create(name: "Kind Bars", price: 2, machine_id: 1)
    visit machine_path(dons)

    expect(page).to have_content("Average Price: 1.50$")
  end
end
