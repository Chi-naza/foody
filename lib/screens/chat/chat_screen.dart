import 'package:flutter/material.dart';
import 'package:foody/constants/foody_colors.dart';
import 'package:foody/controllers/chat_controller.dart';
import 'package:foody/models/chat_message_model.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ChatBodyScreen extends StatefulWidget {
  const ChatBodyScreen({super.key});

  @override
  State<ChatBodyScreen> createState() => _ChatBodyScreenState();
}

class _ChatBodyScreenState extends State<ChatBodyScreen> {
  final chatController = Get.find<ChatController>();

  var chatTextController = TextEditingController();

  @override
  void initState() {
    chatController.fetchChatMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat With Us Directly',
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return GroupedListView<MessageModel, DateTime>(
                // order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                padding: const EdgeInsets.all(8),
                elements: chatController.gottenMessagesList.value,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (MessageModel message) => SizedBox(
                  height: 8.h,
                  child: Center(
                    child: Card(
                      color: Colors.teal.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, MessageModel message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    color:
                        message.isSentByMe ? FoodyColors.textFoodyGreen : null,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isSentByMe ? Colors.white : null,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.sp),
                topLeft: Radius.circular(20.sp),
              ),
              color: Colors.grey.shade300,
            ),
            child: TextField(
              controller: chatTextController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(11.sp),
                hintText: '  Type your message here . . .',
                suffixIcon: IconButton(
                  onPressed: () async {
                    // Send message function
                    await chatController
                        .sendMessageToAdmin(chatTextController.text.trim());
                    chatTextController.clear();
                  },
                  iconSize: 30.sp,
                  icon: const Icon(Icons.send_outlined),
                ),
                suffixIconColor: FoodyColors.mainColor2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
