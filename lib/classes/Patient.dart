class Patient {
  final String gender;
  final String email;
  final Name name;
  final DateOfBirth dob;
  final Location location;
  final String id;
  final Picture picture;
  final String nat;

  Patient({
    required this.gender,
    required this.email,
    required this.name,
    required this.dob,
    required this.location,
    required this.id,
    required this.picture,
    required this.nat,
  });

  // Método para crear un Patient desde un JSON
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      gender: json['gender'],
      email: json['email'],
      name: Name.fromJson(json['name']),
      dob: DateOfBirth.fromJson(json['dob']),
      location: Location.fromJson(json['location']),
      id: json['id'],
      picture: Picture.fromJson(json['picture']),
      nat: json['nat'],
    );
  }

  static List<Patient> listFromJson(Map<String, dynamic> json) {
    return List<Patient>.from(
        json['data'].map((patient) => Patient.fromJson(patient)));
  }

  // Método para convertir un Patient a JSON
  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'email': email,
      'name': name.toJson(),
      'dob': dob.toJson(),
      'location': location.toJson(),
      'id': id,
      'picture': picture.toJson(),
      'nat': nat,
    };
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }
}

class DateOfBirth {
  final String date;
  final int age;

  DateOfBirth({
    required this.date,
    required this.age,
  });

  factory DateOfBirth.fromJson(Map<String, dynamic> json) {
    return DateOfBirth(
      date: json['date'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'age': age,
    };
  }
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      coordinates: Coordinates.fromJson(json['coordinates']),
      timezone: Timezone.fromJson(json['timezone']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street.toJson(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': coordinates.toJson(),
      'timezone': timezone.toJson(),
    };
  }
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
    };
  }
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class Timezone {
  final String offset;
  final String description;

  Timezone({
    required this.offset,
    required this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'description': description,
    };
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }
}
