// ignore_for_file: public_member_api_docs, sort_constructors_first

class LocationActivity {
  int id;
  String name;
  PlaceActivity place;

  LocationActivity({required this.id, required this.name, required this.place});
}

class PlaceActivity {
  int id;
  String name;
  Location location;

  PlaceActivity({required this.id, required this.name, required this.location});
}

class Location {
  int id;
  String name;

  Location({required this.id, required this.name});
}
