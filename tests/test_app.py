import pytest
from src.app import find_rooms

def test_filter_by_building_and_capacity():
    rooms = find_rooms(building="Library", min_capacity=4)
    assert [r["id"] for r in rooms] == ["LIB-204"]

def test_filter_by_feature():
    rooms = find_rooms(feature="display")
    assert [r["id"] for r in rooms] == ["LIB-204"]

def test_capacity_boundary_one_is_valid():
    assert len(find_rooms(min_capacity=1)) == 3

def test_invalid_capacity_rejected():
    with pytest.raises(ValueError):
        find_rooms(min_capacity=0)
