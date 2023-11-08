import 'package:flutter/foundation.dart';
import 'package:foody/data/api/api_endpoints.dart';
import 'package:foody/data/api/helper_methods.dart';
import 'package:foody/models/chat_message_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final gottenMessagesList = <MessageModel>[].obs;

  // var c = types.Message(
  @override
  void onReady() {
    fetchChatMessages();
    super.onReady();
  }

  // Send Message to Admin
  Future<void> sendMessageToAdmin(String messageBody) async {
    Map<String, dynamic> validationBody = {
      "from_user": true,
      "message": messageBody,
    };

    Response response = await HelperAPIMethods.postData(
      uri: FoodyAPI.BASE_URL + FoodyAPI.sendMessageChatEndpoint,
      withHeader: true,
      body: validationBody,
    );

    if (kDebugMode) print(response.statusCode);
    if (kDebugMode) print(response.body);

    if (response.statusCode == 201) {
      if (kDebugMode) print("MESSAGE SENT TO ADMIN :::::: Success");
      // when message is sent successfully, we fetch messages
      await fetchChatMessages();
    } else {
      if (kDebugMode) print("MESSAGE NOT SENT TO ADMIN :::::: Failed");
    }
  }

  // Get All Messages Btw Admin and User
  Future<void> fetchChatMessages() async {
    // Getting the Categories
    Response response = await HelperAPIMethods.getDataWithHeader(
        FoodyAPI.BASE_URL + FoodyAPI.getChatMessagesEndpoint);

    if (kDebugMode) print('CHAT MESSAGES: ${response.body}');

    if (response.statusCode == 200) {
      // A helper list variable
      List<MessageModel> returnedList = [];

      // Looping through the response
      for (var d in response.body) {
        if (kDebugMode) print(d['message']);
        if (kDebugMode) print(d['created']);

        // Creating Message Model object
        returnedList.add(
          MessageModel(
            text: d['message'],
            date: DateTime.parse(d['created']),
            isSentByMe: d['from_user'],
            senderID: 'false',
            receiverID: 'true',
          ),
        );
      }

      // populating our reactive list
      gottenMessagesList.assignAll(returnedList);
      if (kDebugMode) print('ALL CHAT MESSAGES RESPONSE: $gottenMessagesList');
    } else {
      if (kDebugMode) print("FAILED TO FETCH CHAT MESSAGES  . . .");
    }
  }

  //
}
