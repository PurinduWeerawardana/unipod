import 'package:flutter/material.dart';
import '../../../../../constants/image_string.dart';
import '../models/message.dart';
import '../models/user.dart';

class MessageService {
  User user1 = User(
    name: 'Sithum Raveesha',
    image: "assets/images/chat_images/emoji1.png",
    color: const Color(0xFFFFE0EC),
  );

  User user2 = User(
    name: 'Purindu Thamash',
    image: 'assets/images/chat_images/emoji9.png',
    color: const Color(0xFFBFE9F2),
  );

  User user3 = User(
    name: 'Ginura Ransika',
    image: 'assets/images/chat_images/emoji3.png',
    color: const Color(0xFFFFD6C4),
  );

  User user4 = User(
    name: 'Sandaru Vithanage',
    image: 'assets/images/chat_images/emoji4.png',
    color: const Color(0xFFC3C1E6),
  );

  User user5 = User(
    name: 'Manthi Perera',
    image: 'assets/images/chat_images/emoji5.png',
    color: const Color(0xFFFFE0EC),
  );

  User user6 = User(
    name: 'Anne Vanhoff',
    image: 'assets/images/chat_images/emoji6.png',
    color: const Color(0xFFFFE5A6),
  );

  User user7 = User(
    name: 'Alissia Shah',
    image: 'assets/images/chat_images/emoji7.png',
    color: const Color(0xFFFFE0EC),
  );

  User user8 = User(
    name: 'Antoni Whitney',
    image: 'assets/images/chat_images/emoji8.png',
    color: const Color(0xFFFFE0EC),
  );

  User user9 = User(
    name: 'Jaime Zuniga',
    image: 'assets/images/chat_images/emoji9.png',
    color: const Color(0xFFC3C1E6),
  );

  User user10 = User(
    name: 'Barbara Cherry',
    image: 'assets/images/chat_images/emoji10.png',
    color: const Color(0xFFFF95A2),
  );

  // Users
  List<User> getUsers() {
    return [
      user1,
      user2,
      user3,
      user4,
      user5,
      user6,
      user7,
      user8,
      user9,
      user10
    ];
  }

  // Chats
  List<Message> getChats() {
    return [
      Message(
        sender: user1,
        time: '18:32',
        text: 'Hey there! What\'s up? Is everything ok?',
      ),
      Message(
        sender: user2,
        time: '14:05',
        text: 'Can I call you back later?, I\'m in a meeting.',
      ),
      Message(
        sender: user3,
        time: '14:00',
        text: 'Yeah. Do you have any good song to recommend?',
      ),
      Message(
        sender: user4,
        time: '13:35',
        text: 'Hi! I went shopping today and found a nice t-shirt.',
      ),
      Message(
        sender: user5,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
    ];
  }

  // Chat messages
  List<Message> getMessages(User sender) {
    return [
      Message(
        sender: null,
        time: '18:42',
        text: 'Yeah I know. I\'m in the same position 😂',
      ),
      Message(
        sender: sender,
        time: '18:39',
        text: 'It\'s hard to be productive, man 😞',
      ),
      Message(
        sender: sender,
        time: '18:39',
        text:
            'Same here! Been watching YouTube for the past 5 hours despite of having so much to do! 😅',
      ),
      Message(
        sender: null,
        time: '18:36',
        text: 'Nothing. Just chilling and watching YouTube. What about you?',
      ),
      Message(
        sender: sender,
        time: '18:35',
        text: 'Hey there! What\'s up?',
      ),
    ];
  }
}
