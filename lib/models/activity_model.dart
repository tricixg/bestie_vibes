
import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String opening;
  final String imageUrls;
  final String tag;
  final String description;
  final String address;
  final int price;
  final String type;
  final String postal;
  final String website;

  const Activity({
    required this.id,
    required this.name,
    required this.phone,
    required this.opening,
    required this.imageUrls,
    required this.tag,
    required this.description,
    required this.address,
    required this.postal,
    required this.price,
    required this.type,
    required this.website,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        opening,
        imageUrls,
        tag,
        description,
        address,
        postal,
        website,
        type,
        price,
      ];
}
