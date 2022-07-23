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
      ];

  Activity.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? 0,
        name = map['name'] ?? 'Name',
        phone = map['phone'] ?? 'Phone',
        opening = map['opening'] ?? 'Opening',
        imageUrls = map['image_url'] ?? 'Image Url',
        tag = map['tag'] ?? 'Tag',
        description = map['description'] ?? 'Description',
        address = map['address'] ?? 'Address',
        price = map['price'] ?? 0,
        type = map['type'] ?? 'Type',
        postal = map['postal'] ?? 'Postal',
        website = map['website'] ?? 'Website';
}
