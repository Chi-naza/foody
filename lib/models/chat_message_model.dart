class MessageModel {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  final String senderID;
  final String receiverID;

  const MessageModel({
    required this.senderID,
    required this.receiverID,
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
