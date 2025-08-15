import 'package:equatable/equatable.dart';

class CustomImage extends Equatable {
  const CustomImage({
    required this.id,
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
  });

  final int id;
  final String name;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final dynamic formats;
  final String? previewUrl;
  final String? provider;
  final dynamic providerMetadata;

  factory CustomImage.initial() => const CustomImage(
    id: 0,
    name: '',
    hash: '',
    ext: '',
    mime: '',
    size: 0,
    url: '',
    createdAt: null,
    updatedAt: null,
    alternativeText: null,
    caption: null,
    width: null,
    height: null,
    formats: null,
    previewUrl: null,
    provider: null,
    providerMetadata: null,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    hash,
    ext,
    mime,
    size,
    url,
    createdAt,
    updatedAt,
    alternativeText,
    caption,
    width,
    height,
    formats,
    previewUrl,
    provider,
    providerMetadata,
  ];
}
