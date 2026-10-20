import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final int followers;

  const Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.followers = 0,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, followers];
}
