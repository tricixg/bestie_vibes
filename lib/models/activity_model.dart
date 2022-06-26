
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

  // List<Activity> activities = [];
  // static List<Activity> activities = [
  //   const Activity(
  //     id: '1',
  //     name: 'Crafting',
  //     phone: 98323325,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['workshop', 'couple', 'fun'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123454,
  //     price: 2,
  //     type: 'activity',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '2',
  //     name: 'climbing',
  //     phone: 99325232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['sports', 'couple', 'fun'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123454,
  //     price: 2,
  //     type: 'activity',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '3',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '4',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '5',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '6',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '7',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '8',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '9',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '10',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '11',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  //   const Activity(
  //     id: '12',
  //     name: 'din tai fung',
  //     phone: 99334232,
  //     opening: '10am-2pm',
  //     imageUrls: [
  //       'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  //     ],
  //     address: 'Orchard Rd 123 ',
  //     tag: ['chinese', 'restaurant'],
  //     description:
  //         'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
  //     postal: 123434,
  //     price: 2,
  //     type: 'food',
  //     website: 'www.hello.com',
  //   ),
  // ];

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
