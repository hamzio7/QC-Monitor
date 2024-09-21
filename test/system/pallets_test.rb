require "application_system_test_case"

class PalletsTest < ApplicationSystemTestCase
  setup do
    @pallet = pallets(:one)
  end

  test "visiting the index" do
    visit pallets_url
    assert_selector "h1", text: "Pallets"
  end

  test "should create pallet" do
    visit pallets_url
    click_on "New pallet"

    fill_in "Cloudy time", with: @pallet.cloudy_time
    fill_in "Color number", with: @pallet.color_number
    fill_in "Customer", with: @pallet.customer
    fill_in "Final grammage max", with: @pallet.final_grammage_max
    fill_in "Final grammage min", with: @pallet.final_grammage_min
    fill_in "Final info", with: @pallet.final_info
    fill_in "Final status", with: @pallet.final_status
    fill_in "Final stop reason", with: @pallet.final_stop_reason
    fill_in "Final supervisor", with: @pallet.final_supervisor
    fill_in "Gel time", with: @pallet.gel_time
    fill_in "Glossiness", with: @pallet.glossiness
    fill_in "Info", with: @pallet.info
    fill_in "Initial grammage", with: @pallet.initial_grammage
    fill_in "MF tank", with: @pallet.mf_tank
    fill_in "Pallet number", with: @pallet.pallet_number
    fill_in "Production date", with: @pallet.date
    fill_in "Production time", with: @pallet.time
    fill_in "Quantity", with: @pallet.quantity
    fill_in "Status", with: @pallet.status
    fill_in "Stop reason", with: @pallet.stop_reason
    fill_in "Supervisor", with: @pallet.supervisor
    fill_in "Uf tank", with: @pallet.uf_tank
    fill_in "Volatile content max", with: @pallet.volatile_content_max
    fill_in "Volatile content min", with: @pallet.volatile_content_min
    fill_in "Volatile content set max", with: @pallet.volatile_content_set_max
    fill_in "Volatile content set min", with: @pallet.volatile_content_set_min
    click_on "Create Pallet"

    assert_text "Pallet was successfully created"
    click_on "Back"
  end

  test "should update Pallet" do
    visit pallet_url(@pallet)
    click_on "Edit this pallet", match: :first

    fill_in "Cloudy time", with: @pallet.cloudy_time
    fill_in "Color number", with: @pallet.color_number
    fill_in "Customer", with: @pallet.customer
    fill_in "Final grammage max", with: @pallet.final_grammage_max
    fill_in "Final grammage min", with: @pallet.final_grammage_min
    fill_in "Final info", with: @pallet.final_info
    fill_in "Final status", with: @pallet.final_status
    fill_in "Final stop reason", with: @pallet.final_stop_reason
    fill_in "Final supervisor", with: @pallet.final_supervisor
    fill_in "Gel time", with: @pallet.gel_time
    fill_in "Glossiness", with: @pallet.glossiness
    fill_in "Info", with: @pallet.info
    fill_in "Initial grammage", with: @pallet.initial_grammage
    fill_in "MF tank", with: @pallet.mf_tank
    fill_in "Pallet number", with: @pallet.pallet_number
    fill_in "Production date", with: @pallet.production_date
    fill_in "Production time", with: @pallet.production_time
    fill_in "Quantity", with: @pallet.quantity
    fill_in "Status", with: @pallet.status
    fill_in "Stop reason", with: @pallet.stop_reason
    fill_in "Supervisor", with: @pallet.supervisor
    fill_in "Uf tank", with: @pallet.uf_tank
    fill_in "Volatile content max", with: @pallet.volatile_content_max
    fill_in "Volatile content min", with: @pallet.volatile_content_min
    fill_in "Volatile content set max", with: @pallet.volatile_content_set_max
    fill_in "Volatile content set min", with: @pallet.volatile_content_set_min
    click_on "Update Pallet"

    assert_text "Pallet was successfully updated"
    click_on "Back"
  end

  test "should destroy Pallet" do
    visit pallet_url(@pallet)
    click_on "Destroy this pallet", match: :first

    assert_text "Pallet was successfully destroyed"
  end
end
