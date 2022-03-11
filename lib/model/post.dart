class Post {
  String personName;
  String personImage;
  String address;
  String message;
  String? messageImage;
  int likesCount;
  int commentsCount;
  String postTime;
  List<String>? photos;

  Post({
    required this.personName,
    required this.personImage,
    required this.address,
    required this.message,
    required this.commentsCount,
    required this.likesCount,
    this.messageImage,
    required this.postTime,
    this.photos,
  });
}
