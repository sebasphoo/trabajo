void main() {
  List<Vehiculo> vehiculos = [];

  vehiculos.add(
    Carro("Toyota", "Corolla", anio: 2012, numeroPuertas: 5),
  );

  vehiculos.add(
    Carro(
      "Chevrolet",
      "Spark",
      anio: 2020,
      estado: "inactivo",
      numeroPuertas: 4,
    ),
  );

  vehiculos.add(
    Motocicleta("Yamaha", "FZ250", anio: 2018, cilindraje: 250),
  );

  vehiculos.add(
    Motocicleta(
      "AKT",
      "NKD 125",
      anio: 2024,
      estado: "inactivo",
      cilindraje: 125,
    ),
  );

  for (Vehiculo v in vehiculos) {
    print("\n----------------------");
    v.mostrarInfo();
    print("Costo del servicio: \$${v.calcularCostoServicio()}");
  }
}

class Vehiculo {
  String marca;
  String modelo;
  int anio;
  String _estado;

  Vehiculo(this.marca, this.modelo,
      {required this.anio, String estado = "activo"})
      : _estado = estado;

  String get estado => _estado;

  set estado(String nuevoEstado) {
    _estado = nuevoEstado;
  }

  void mostrarInfo() {
    print("Marca: $marca");
    print("Modelo: $modelo");
    print("Año: $anio");
    print("Estado: $_estado");
  }

  double calcularCostoServicio() {
    return 0;
  }
}

class Carro extends Vehiculo {
  int numeroPuertas;

  Carro(
    String marca,
    String modelo, {
    required int anio,
    String estado = "activo",
    required this.numeroPuertas,
  }) : super(marca, modelo, anio: anio, estado: estado);

  @override
  double calcularCostoServicio() {
    if (estado == "inactivo") {
      print("Vehículo no disponible para servicio");
      return 0;
    }

    double costo = 500000;

    if (numeroPuertas > 4) {
      costo += 20000;
    } else {
      costo += 10000;
    }

    int edad = DateTime.now().year - anio;

    if (edad > 10) {
      costo += 15000;
    }

    return costo;
  }

  bool esFamiliar() {
    return numeroPuertas > 4;
  }

  @override
  void mostrarInfo() {
    super.mostrarInfo();
    print("Número de puertas: $numeroPuertas");
  }
}

class Motocicleta extends Vehiculo {
  int cilindraje;

  Motocicleta(
    String marca,
    String modelo, {
    required int anio,
    String estado = "activo",
    required this.cilindraje,
  }) : super(marca, modelo, anio: anio, estado: estado);

  @override
  double calcularCostoServicio() {
    if (estado == "inactivo") {
      print("Motocicleta no disponible para servicio");
      return 0;
    }

    double costo = 30000;

    if (cilindraje > 200) {
      costo += 25000;
    } else {
      costo += 10000;
    }

    int edad = DateTime.now().year - anio;

    if (edad > 5) {
      costo += 10000;
    }

    return costo;
  }

  bool esAltaCilindraje() {
    return cilindraje > 200;
  }

  @override
  void mostrarInfo() {
    super.mostrarInfo();
    print("Cilindraje: $cilindraje cc");
  }
}

