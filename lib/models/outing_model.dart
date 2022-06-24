import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Outing extends Equatable {
  final String? id;
  final String name;
  final int phone;
  final String opening;
  final List<dynamic> imageUrls;
  final List<dynamic> tags;
  final String bio;
  final String address;
  final int price;
  final String type;
  final int postal;
  final String website;

  const Outing({
    this.id,
    required this.name,
    required this.phone,
    required this.opening,
    required this.imageUrls,
    required this.tags,
    required this.bio,
    required this.address,
    required this.postal,
    required this.price,
    required this.type,
    required this.website,
  });

  static List<Outing> outings = [
    const Outing(
        id: '1',
        name: 'Crafting',
        phone: 98323325,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['workshop', 'couple', 'fun'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123454,
        price: 2,
        type: 'activity',
        website: 'www.hello.com',
        ),
    const Outing(
        id: '2',
        name: 'climbing',
        phone: 99325232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['sports', 'couple', 'fun'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123454,
        price: 2,
        type: 'activity',
        website: 'www.hello.com',
),
    const Outing(
        id: '3',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',
        ),
    const Outing(
        id: '4',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',        
        website: 'www.hello.com',),
    const Outing(
        id: '5',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '6',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '7',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '8',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '9',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '10',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '11',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),
            const Outing(
        id: '12',
        name: 'din tai fung',
        phone: 99334232,
        opening: '10am-2pm',
        imageUrls: [
          'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        ],
        address: 'Orchard Rd 123 ',
        tags: ['chinese', 'restaurant'],
        bio:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
        postal: 123434,
        price: 2,
        type: 'food',
        website: 'www.hello.com',),

  ];

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        opening,
        imageUrls,
        tags,
        bio,
        address,
        postal,
        website,
        type,
        price,
      ];
}
