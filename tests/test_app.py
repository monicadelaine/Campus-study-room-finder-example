import pytest
from src.app import find_rooms,format_room,get_room

def test_filter_by_building_and_capacity():
    rooms=find_rooms(building="Library", min_capacity=4)
    assert [r["id"] for r in rooms] == ["LIB-204"]

def test_filter_by_feature():
    rooms=find_rooms(feature="display")
    assert [r["id"] for r in rooms] == ["LIB-204"]

def test_capacity_boundary_one_is_valid():
    assert len(find_rooms(min_capacity=1)) == 4

def test_invalid_capacity_rejected():
    with pytest.raises(ValueError):
        find_rooms(min_capacity=0)

def test_room_includes_floor():
    room = get_room("LIB-204")
    assert room["floor"] == 2

def test_filter_no_floor():
    rooms=find_rooms(building="Library", min_capacity=3)
    assert [r["id"] for r in rooms] == ["LIB-204","LIB-310"]


def test_filter_by_floor():
    rooms=find_rooms(floor=2)
    assert [r["id"] for r in rooms] == ["LIB-204"]

def test_filter_by_floor_string():
    rooms=find_rooms(floor="Main")
    assert [r["id"] for r in rooms] == ["LOBBY"]


def test_room_without_floor_is_supported():
    room = {
        "id": "TEMP-101",
        "building": "Temporary Building",
        "capacity": 4,
        "features": []
    }

    result = format_room(room)

    assert "Floor" not in result
