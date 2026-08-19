"""Tiny example domain logic for a fictional study-room finder."""

ROOMS = [
    {"id":"ENG-101","building":"Engineering","floor":1, "capacity":4,"features":["whiteboard"]},
    {"id":"LIB-204","building":"Library","floor":2, "capacity":8,"features":["whiteboard","display"]},
    {"id":"LIB-310","building":"Library","capacity":3,"features":[]},
    {"id":"LOBBY","building":"Library","floor":"Main","capacity":2,"features":[]},
]

def find_rooms(building=None, min_capacity=1, feature=None, floor=None):
    if min_capacity < 1:
        raise ValueError("min_capacity must be at least 1")
    result=[]
    for room in ROOMS:
        if building and room["building"].lower()!=building.lower():
            continue
        if floor is not None and (room.get("floor") != None and room["floor"] != floor): #we want a floor, there is afloor but they do not match
            continue
        if floor is not None and room.get("floor") == None: #we want a floor but there is no floor
            continue
        if room["capacity"] < min_capacity:
            continue
        if feature and feature not in room["features"]:
            continue
        result.append(room)
    return result

def format_room(room=None):
    if room is None:
        return ""
    if "floor" in room.keys():
        return "{}: Building {} Floor {} Capacity {}".format(room["id"],room["building"],room["floor"],room["capacity"])
    return "{}: Building {} Capacity {}".format(room["id"],room["building"],room["capacity"])

def get_room(id):
    for room in ROOMS:
        if room["id"]==id:
            return room
    return None

if __name__ == "__main__":
    for room in find_rooms(building="Library", min_capacity=4):
        print(room)
