class PokemonTypeTranslator {
  static String translateToSpanish(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return 'Fuego';
      case 'water':
        return 'Agua';
      case 'grass':
        return 'Planta';
      case 'electric':
        return 'Eléctrico';
      case 'bug':
        return 'Bicho';
      case 'normal':
        return 'Normal';
      case 'flying':
        return 'Volador';
      case 'psychic':
        return 'Psíquico';
      case 'fairy':
        return 'Hada';
      case 'dark':
        return 'Siniestro';
      case 'dragon':
        return 'Dragón';
      case 'ghost':
        return 'Fantasma';
      case 'steel':
        return 'Acero';
      case 'ice':
        return 'Hielo';
      case 'fighting':
        return 'Lucha';
      case 'poison':
        return 'Veneno';
      case 'ground':
        return 'Tierra';
      case 'rock':
        return 'Roca';
      default:
        return 'Desconocido';
    }
  }
}
