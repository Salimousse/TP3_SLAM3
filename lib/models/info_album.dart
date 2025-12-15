class InfoAlbum {
  final String nomAlbum;
  final String description;
  final String nomGroupe;
  final String image;
  final String? linkyoualbum;
  final String? linkArtiste;

  InfoAlbum({
    required this.nomAlbum,
    required this.description,
    required this.nomGroupe,
    required this.image,
    this.linkyoualbum,
    this.linkArtiste,
  });
}
