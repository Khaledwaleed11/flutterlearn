import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(
                  "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX8NczaZ&_nc_ht=scontent-hbe1-1.xx&oh=00_AT--NQWAmzhaI45BHTpHfBGepz6ZtEW6WJmmuZDZzFNa3w&oe=62923362"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Chats",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.white30,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 16,
                    ))),
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.white30,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 16,
                    ))),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white24,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      const Text("Search"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return buildStoryItem();
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                      itemCount: 10),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatIem(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                    itemCount: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => Row(
        children: [
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX8NczaZ&_nc_ht=scontent-hbe1-1.xx&oh=00_AT--NQWAmzhaI45BHTpHfBGepz6ZtEW6WJmmuZDZzFNa3w&oe=62923362"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.5,
                        right: 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Khaled waled helal mahmoud elsayed",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://scontent.fcai21-1.fna.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX9ajXBq&_nc_ht=scontent.fcai21-1.fna&oh=00_AT_lDWpJsg0WsB8FPtGjpbFAarlwoqOYC3WRx3qZRcK30w&oe=62942DA2"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.5,
                        right: 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Khaled waled helal mahmoud elsayed",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://scontent.fcai21-1.fna.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX9ajXBq&_nc_ht=scontent.fcai21-1.fna&oh=00_AT_lDWpJsg0WsB8FPtGjpbFAarlwoqOYC3WRx3qZRcK30w&oe=62942DA2"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.5,
                        right: 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Khaled waled helal mahmoud elsayed",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX8NczaZ&_nc_ht=scontent-hbe1-1.xx&oh=00_AT--NQWAmzhaI45BHTpHfBGepz6ZtEW6WJmmuZDZzFNa3w&oe=62923362"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.5,
                        right: 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Khaled waled helal mahmoud elsayed",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX8NczaZ&_nc_ht=scontent-hbe1-1.xx&oh=00_AT--NQWAmzhaI45BHTpHfBGepz6ZtEW6WJmmuZDZzFNa3w&oe=62923362"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.5,
                        right: 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Khaled waled helal mahmoud elsayed",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 60,
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX8NczaZ&_nc_ht=scontent-hbe1-1.xx&oh=00_AT--NQWAmzhaI45BHTpHfBGepz6ZtEW6WJmmuZDZzFNa3w&oe=62923362"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.5,
                        right: 3.5,
                      ),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Khaled waled helal mahmoud elsayed",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      );

  Widget buildChatIem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/274980843_1595941570772594_3468093547650479590_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_ohc=-XFmHNhkTvYAX8NczaZ&_nc_ht=scontent-hbe1-1.xx&oh=00_AT--NQWAmzhaI45BHTpHfBGepz6ZtEW6WJmmuZDZzFNa3w&oe=62923362"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 3.5,
                  right: 3.5,
                ),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Khaled waled helal mahmoud khaled Khaled waled helal mahmoud khaled  ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "hello my name is khaled waled helal mahmoud hello my name is khaled waled helal mahmoud my name is khaled waled helal mahmoud",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const Text(
                    "02.00 PM",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ]),
          )
        ],
      );
}
