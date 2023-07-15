require 'test_helper'

class LibraryZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_zone = library_zones(:one)
  end

  test "should get index" do
    get library_zones_url
    assert_response :success
  end

  test "should get new" do
    get new_library_zone_url
    assert_response :success
  end

  test "should create library_zone" do
    assert_difference('LibraryZone.count') do
      post library_zones_url, params: { library_zone: { name: @library_zone.name } }
    end

    assert_redirected_to library_zone_url(LibraryZone.last)
  end

  test "should show library_zone" do
    get library_zone_url(@library_zone)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_zone_url(@library_zone)
    assert_response :success
  end

  test "should update library_zone" do
    patch library_zone_url(@library_zone), params: { library_zone: { name: @library_zone.name } }
    assert_redirected_to library_zone_url(@library_zone)
  end

  test "should destroy library_zone" do
    assert_difference('LibraryZone.count', -1) do
      delete library_zone_url(@library_zone)
    end

    assert_redirected_to library_zones_url
  end
end
