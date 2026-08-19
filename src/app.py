"""Tiny baseline application for the Campus Study Room Finder example."""

ROOMS = [
    {"id":"ENG-101","building":"Engineering","capacity":4,"features":["whiteboard"]},
    {"id":"LIB-204","building":"Library","capacity":8,"features":["whiteboard","display"]},
    {"id":"LIB-310","building":"Library","capacity":2,"features":[]},
]

def find_rooms(building=None, min_capacity=1, feature=None):
    if min_capacity < 1:
        raise ValueError("min_capacity must be at least 1")
    result=[]
    for room in ROOMS:
        if building and room["building"].lower()!=building.lower():
            continue
        if room["capacity"] < min_capacity:
            continue
        if feature and feature not in room["features"]:
            continue
        result.append(room)
    return result

if __name__ == "__main__":
    for room in find_rooms(building="Library", min_capacity=1):
        print(room)
