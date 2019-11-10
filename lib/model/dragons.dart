import 'dart:convert';

List<Dragons> dragonsFromJson(String str) =>
    List<Dragons>.from(json.decode(str).map((x) => Dragons.fromJson(x)));

String dragonsToJson(List<Dragons> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dragons {
  String id;
  String name;
  String type;
  bool active;
  int crewCapacity;
  int sidewallAngleDeg;
  int orbitDurationYr;
  int dryMassKg;
  int dryMassLb;
  DateTime firstFlight;
  HeatShield heatShield;
  List<Thruster> thrusters;
  PayloadMass launchPayloadMass;
  LaunchPayloadVol launchPayloadVol;
  PayloadMass returnPayloadMass;
  LaunchPayloadVol returnPayloadVol;
  PressurizedCapsule pressurizedCapsule;
  Trunk trunk;
  Diameter heightWTrunk;
  Diameter diameter;
  List<String> flickrImages;
  String wikipedia;
  String description;

  Dragons({
    this.id,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.sidewallAngleDeg,
    this.orbitDurationYr,
    this.dryMassKg,
    this.dryMassLb,
    this.firstFlight,
    this.heatShield,
    this.thrusters,
    this.launchPayloadMass,
    this.launchPayloadVol,
    this.returnPayloadMass,
    this.returnPayloadVol,
    this.pressurizedCapsule,
    this.trunk,
    this.heightWTrunk,
    this.diameter,
    this.flickrImages,
    this.wikipedia,
    this.description,
  });

  factory Dragons.fromJson(Map<String, dynamic> json) => Dragons(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    active: json["active"],
    crewCapacity: json["crew_capacity"],
    sidewallAngleDeg: json["sidewall_angle_deg"],
    orbitDurationYr: json["orbit_duration_yr"],
    dryMassKg: json["dry_mass_kg"],
    dryMassLb: json["dry_mass_lb"],
    firstFlight: DateTime.parse(json["first_flight"]),
    heatShield: HeatShield.fromJson(json["heat_shield"]),
    thrusters: List<Thruster>.from(
        json["thrusters"].map((x) => Thruster.fromJson(x))),
    launchPayloadMass: PayloadMass.fromJson(json["launch_payload_mass"]),
    launchPayloadVol: LaunchPayloadVol.fromJson(json["launch_payload_vol"]),
    returnPayloadMass: PayloadMass.fromJson(json["return_payload_mass"]),
    returnPayloadVol: LaunchPayloadVol.fromJson(json["return_payload_vol"]),
    pressurizedCapsule:
    PressurizedCapsule.fromJson(json["pressurized_capsule"]),
    trunk: Trunk.fromJson(json["trunk"]),
    heightWTrunk: Diameter.fromJson(json["height_w_trunk"]),
    diameter: Diameter.fromJson(json["diameter"]),
    flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
    wikipedia: json["wikipedia"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "active": active,
    "crew_capacity": crewCapacity,
    "sidewall_angle_deg": sidewallAngleDeg,
    "orbit_duration_yr": orbitDurationYr,
    "dry_mass_kg": dryMassKg,
    "dry_mass_lb": dryMassLb,
    "first_flight":
    "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
    "heat_shield": heatShield.toJson(),
    "thrusters": List<dynamic>.from(thrusters.map((x) => x.toJson())),
    "launch_payload_mass": launchPayloadMass.toJson(),
    "launch_payload_vol": launchPayloadVol.toJson(),
    "return_payload_mass": returnPayloadMass.toJson(),
    "return_payload_vol": returnPayloadVol.toJson(),
    "pressurized_capsule": pressurizedCapsule.toJson(),
    "trunk": trunk.toJson(),
    "height_w_trunk": heightWTrunk.toJson(),
    "diameter": diameter.toJson(),
    "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
    "wikipedia": wikipedia,
    "description": description,
  };
}

class Diameter {
  double meters;
  double feet;

  Diameter({
    this.meters,
    this.feet,
  });

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
    meters: json["meters"].toDouble(),
    feet: json["feet"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "meters": meters,
    "feet": feet,
  };
}

class HeatShield {
  String material;
  double sizeMeters;
  int tempDegrees;
  String devPartner;

  HeatShield({
    this.material,
    this.sizeMeters,
    this.tempDegrees,
    this.devPartner,
  });

  factory HeatShield.fromJson(Map<String, dynamic> json) => HeatShield(
    material: json["material"],
    sizeMeters: json["size_meters"].toDouble(),
    tempDegrees: json["temp_degrees"],
    devPartner: json["dev_partner"],
  );

  Map<String, dynamic> toJson() => {
    "material": material,
    "size_meters": sizeMeters,
    "temp_degrees": tempDegrees,
    "dev_partner": devPartner,
  };
}

class PayloadMass {
  int kg;
  int lb;

  PayloadMass({
    this.kg,
    this.lb,
  });

  factory PayloadMass.fromJson(Map<String, dynamic> json) => PayloadMass(
    kg: json["kg"],
    lb: json["lb"],
  );

  Map<String, dynamic> toJson() => {
    "kg": kg,
    "lb": lb,
  };
}

class LaunchPayloadVol {
  int cubicMeters;
  int cubicFeet;

  LaunchPayloadVol({
    this.cubicMeters,
    this.cubicFeet,
  });

  factory LaunchPayloadVol.fromJson(Map<String, dynamic> json) =>
      LaunchPayloadVol(
        cubicMeters: json["cubic_meters"],
        cubicFeet: json["cubic_feet"],
      );

  Map<String, dynamic> toJson() => {
    "cubic_meters": cubicMeters,
    "cubic_feet": cubicFeet,
  };
}

class PressurizedCapsule {
  LaunchPayloadVol payloadVolume;

  PressurizedCapsule({
    this.payloadVolume,
  });

  factory PressurizedCapsule.fromJson(Map<String, dynamic> json) =>
      PressurizedCapsule(
        payloadVolume: LaunchPayloadVol.fromJson(json["payload_volume"]),
      );

  Map<String, dynamic> toJson() => {
    "payload_volume": payloadVolume.toJson(),
  };
}

class Thruster {
  String type;
  int amount;
  int pods;
  String fuel1;
  String fuel2;
  int isp;
  Thrust thrust;

  Thruster({
    this.type,
    this.amount,
    this.pods,
    this.fuel1,
    this.fuel2,
    this.isp,
    this.thrust,
  });

  factory Thruster.fromJson(Map<String, dynamic> json) => Thruster(
    type: json["type"],
    amount: json["amount"],
    pods: json["pods"],
    fuel1: json["fuel_1"],
    fuel2: json["fuel_2"],
    isp: json["isp"],
    thrust: Thrust.fromJson(json["thrust"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "amount": amount,
    "pods": pods,
    "fuel_1": fuel1,
    "fuel_2": fuel2,
    "isp": isp,
    "thrust": thrust.toJson(),
  };
}

class Thrust {
  double kN;
  int lbf;

  Thrust({
    this.kN,
    this.lbf,
  });

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
    kN: json["kN"].toDouble(),
    lbf: json["lbf"],
  );

  Map<String, dynamic> toJson() => {
    "kN": kN,
    "lbf": lbf,
  };
}

class Trunk {
  LaunchPayloadVol trunkVolume;
  Cargo cargo;

  Trunk({
    this.trunkVolume,
    this.cargo,
  });

  factory Trunk.fromJson(Map<String, dynamic> json) => Trunk(
    trunkVolume: LaunchPayloadVol.fromJson(json["trunk_volume"]),
    cargo: Cargo.fromJson(json["cargo"]),
  );

  Map<String, dynamic> toJson() => {
    "trunk_volume": trunkVolume.toJson(),
    "cargo": cargo.toJson(),
  };
}

class Cargo {
  int solarArray;
  bool unpressurizedCargo;

  Cargo({
    this.solarArray,
    this.unpressurizedCargo,
  });

  factory Cargo.fromJson(Map<String, dynamic> json) => Cargo(
    solarArray: json["solar_array"],
    unpressurizedCargo: json["unpressurized_cargo"],
  );

  Map<String, dynamic> toJson() => {
    "solar_array": solarArray,
    "unpressurized_cargo": unpressurizedCargo,
  };
}
