require "application_system_test_case"

class ResinProgramsTest < ApplicationSystemTestCase
  setup do
    @resin_program = resin_programs(:one)
  end

  test "visiting the index" do
    visit resin_programs_url
    assert_selector "h1", text: "Resin programs"
  end

  test "should create resin program" do
    visit resin_programs_url
    click_on "New resin program"

    fill_in "Date", with: @resin_program.date
    fill_in "Line", with: @resin_program.line
    fill_in "Mf 1010", with: @resin_program.mf_1010
    fill_in "Mf 1014", with: @resin_program.mf_1014
    fill_in "Mf 837", with: @resin_program.mf_837
    fill_in "Mf es501", with: @resin_program.mf_es501
    fill_in "Mf es700", with: @resin_program.mf_es700
    fill_in "Mf tank num", with: @resin_program.mf_tank_num
    fill_in "Mixing 1", with: @resin_program.mixing_1
    fill_in "Mixing 2", with: @resin_program.mixing_2
    fill_in "Shift", with: @resin_program.shift
    fill_in "Time", with: @resin_program.time
    fill_in "Uf 1448", with: @resin_program.uf_1448
    fill_in "Uf 837", with: @resin_program.uf_837
    fill_in "Uf tank num", with: @resin_program.uf_tank_num
    fill_in "Uf wlf", with: @resin_program.uf_wlf
    click_on "Create Resin program"

    assert_text "Resin program was successfully created"
    click_on "Back"
  end

  test "should update Resin program" do
    visit resin_program_url(@resin_program)
    click_on "Edit this resin program", match: :first

    fill_in "Date", with: @resin_program.date
    fill_in "Line", with: @resin_program.line
    fill_in "Mf 1010", with: @resin_program.mf_1010
    fill_in "Mf 1014", with: @resin_program.mf_1014
    fill_in "Mf 837", with: @resin_program.mf_837
    fill_in "Mf es501", with: @resin_program.mf_es501
    fill_in "Mf es700", with: @resin_program.mf_es700
    fill_in "Mf tank num", with: @resin_program.mf_tank_num
    fill_in "Mixing 1", with: @resin_program.mixing_1
    fill_in "Mixing 2", with: @resin_program.mixing_2
    fill_in "Shift", with: @resin_program.shift
    fill_in "Time", with: @resin_program.time
    fill_in "Uf 1448", with: @resin_program.uf_1448
    fill_in "Uf 837", with: @resin_program.uf_837
    fill_in "Uf tank num", with: @resin_program.uf_tank_num
    fill_in "Uf wlf", with: @resin_program.uf_wlf
    click_on "Update Resin program"

    assert_text "Resin program was successfully updated"
    click_on "Back"
  end

  test "should destroy Resin program" do
    visit resin_program_url(@resin_program)
    click_on "Destroy this resin program", match: :first

    assert_text "Resin program was successfully destroyed"
  end
end
