class Cliente {
  final String fechaNac;
  final String nombre;
  final String direccion;
  final String dni;
  final String email;
  final bool bip;
  final String genero;
  final String id;

  Cliente({
    required this.fechaNac,
    required this.nombre,
    required this.direccion,
    required this.dni,
    required this.email,
    required this.bip,
    required this.genero,
    required this.id,
  });

  // Método para crear un Cliente desde un JSON
  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      fechaNac: json['fechaNac'],
      nombre: json['nombre'],
      direccion: json['direccion'],
      dni: json['dni'],
      email: json['email'],
      bip: json['bip'],
      genero: json['Genero'],
      id: json['id'],
    );
  }

  // Método para crear una lista de Cliente desde un JSON
  static List<Cliente> listFromJson(Map<String, dynamic> json) {
    return List<Cliente>.from(
        json['data'].map((cliente) => Cliente.fromJson(cliente)));
  }

  // Método para convertir un Cliente a JSON
  Map<String, dynamic> toJson() {
    return {
      'fechaNac': fechaNac,
      'nombre': nombre,
      'direccion': direccion,
      'dni': dni,
      'email': email,
      'bip': bip,
      'Genero': genero,
      'id': id,
    };
  }
}
