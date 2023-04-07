// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelPokemon {
  String name;
  // List<String> abilities;
  ModelPokemon({
    required this.name,
    // required this.abilities,
  });

  factory ModelPokemon.parsing(Map<String, dynamic> json) {
    List<String> changeToList(Map<String, dynamic> json) {
      return [];
    }

    return ModelPokemon(
      name: json['name'],
    );
  }
}
