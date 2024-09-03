require "test_helper"

class ResinProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resin_program = resin_programs(:one)
  end

  test "should get index" do
    get resin_programs_url
    assert_response :success
  end

  test "should get new" do
    get new_resin_program_url
    assert_response :success
  end

  test "should create resin_program" do
    assert_difference("ResinProgram.count") do
      post resin_programs_url, params: { resin_program: { date: @resin_program.date, line: @resin_program.line, mf_1010: @resin_program.mf_1010, mf_1014: @resin_program.mf_1014, mf_837: @resin_program.mf_837, mf_es501: @resin_program.mf_es501, mf_es700: @resin_program.mf_es700, mf_tank_num: @resin_program.mf_tank_num, mixing_1: @resin_program.mixing_1, mixing_2: @resin_program.mixing_2, shift: @resin_program.shift, time: @resin_program.time, uf_1448: @resin_program.uf_1448, uf_837: @resin_program.uf_837, uf_tank_num: @resin_program.uf_tank_num, uf_wlf: @resin_program.uf_wlf } }
    end

    assert_redirected_to resin_program_url(ResinProgram.last)
  end

  test "should show resin_program" do
    get resin_program_url(@resin_program)
    assert_response :success
  end

  test "should get edit" do
    get edit_resin_program_url(@resin_program)
    assert_response :success
  end

  test "should update resin_program" do
    patch resin_program_url(@resin_program), params: { resin_program: { date: @resin_program.date, line: @resin_program.line, mf_1010: @resin_program.mf_1010, mf_1014: @resin_program.mf_1014, mf_837: @resin_program.mf_837, mf_es501: @resin_program.mf_es501, mf_es700: @resin_program.mf_es700, mf_tank_num: @resin_program.mf_tank_num, mixing_1: @resin_program.mixing_1, mixing_2: @resin_program.mixing_2, shift: @resin_program.shift, time: @resin_program.time, uf_1448: @resin_program.uf_1448, uf_837: @resin_program.uf_837, uf_tank_num: @resin_program.uf_tank_num, uf_wlf: @resin_program.uf_wlf } }
    assert_redirected_to resin_program_url(@resin_program)
  end

  test "should destroy resin_program" do
    assert_difference("ResinProgram.count", -1) do
      delete resin_program_url(@resin_program)
    end

    assert_redirected_to resin_programs_url
  end
end
