import 'models.dart';


class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: [
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
  ],
);

// USERS
final User greg = User(
  id: 1,
  name: 'Test1, Test2, Test3',
  imageUrl: [
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
  ],
);
final User james = User(
  id: 2,
  name: 'Test1',
  imageUrl: [
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ],
);
final User john = User(
  id: 3,
  name: 'Test2',
  imageUrl: [
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ],
);
final User olivia = User(
  id: 4,
  name: 'Test3',
  imageUrl: [
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ],
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: [
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ],
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: [
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ],
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: [
    'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
  ],
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: greg,
    time: '',
    text: 'Test3 has swiped',
    isLiked: false,
    unread: true,
  ),

];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  // Message(
  //   sender: james,
  //   time: '5:30 PM',
  //   text: 'Hey, how\'s it going? What did you do today?',
  //   isLiked: true,
  //   unread: true,
  // ),
  Message(
    sender: currentUser,
    time: '',
    text: 'bestievibes has swiped',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '',
    text: 'Test1 has swiped',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '',
    text: 'Test2 has swiped',
    isLiked: true,
    unread: true,
  ),

  Message(
    sender: olivia,
    time: '',
    text: 'Test3 has swiped',
    isLiked: false,
    unread: true,
  ),
  //   Message(
  //   sender: currentUser,
  //   time: '',
  //   text: 'New Outing Created',
  //   isLiked: false,
  //   unread: true,
  // ),
  //     Message(
  //   sender: currentUser,
  //   time: '',
  //   text: 'bestievibes has swiped',
  //   isLiked: false,
  //   unread: true,
  // ),
];
