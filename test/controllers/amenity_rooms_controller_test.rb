require 'test_helper'

class AmenityRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amenity_room = amenity_rooms(:one)
  end

  test "should get index" do
    get amenity_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_amenity_room_url
    assert_response :success
  end

  test "should create amenity_room" do
    assert_difference('AmenityRoom.count') do
      post amenity_rooms_url, params: { amenity_room: { amenity_id: @amenity_room.amenity_id, room_id: @amenity_room.room_id } }
    end

    assert_redirected_to amenity_room_url(AmenityRoom.last)
  end

  test "should show amenity_room" do
    get amenity_room_url(@amenity_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_amenity_room_url(@amenity_room)
    assert_response :success
  end

  test "should update amenity_room" do
    patch amenity_room_url(@amenity_room), params: { amenity_room: { amenity_id: @amenity_room.amenity_id, room_id: @amenity_room.room_id } }
    assert_redirected_to amenity_room_url(@amenity_room)
  end

  test "should destroy amenity_room" do
    assert_difference('AmenityRoom.count', -1) do
      delete amenity_room_url(@amenity_room)
    end

    assert_redirected_to amenity_rooms_url
  end
end
