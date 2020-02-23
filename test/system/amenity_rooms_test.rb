require "application_system_test_case"

class AmenityRoomsTest < ApplicationSystemTestCase
  setup do
    @amenity_room = amenity_rooms(:one)
  end

  test "visiting the index" do
    visit amenity_rooms_url
    assert_selector "h1", text: "Amenity Rooms"
  end

  test "creating a Amenity room" do
    visit amenity_rooms_url
    click_on "New Amenity Room"

    fill_in "Amenity", with: @amenity_room.amenity_id
    fill_in "Room", with: @amenity_room.room_id
    click_on "Create Amenity room"

    assert_text "Amenity room was successfully created"
    click_on "Back"
  end

  test "updating a Amenity room" do
    visit amenity_rooms_url
    click_on "Edit", match: :first

    fill_in "Amenity", with: @amenity_room.amenity_id
    fill_in "Room", with: @amenity_room.room_id
    click_on "Update Amenity room"

    assert_text "Amenity room was successfully updated"
    click_on "Back"
  end

  test "destroying a Amenity room" do
    visit amenity_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Amenity room was successfully destroyed"
  end
end
