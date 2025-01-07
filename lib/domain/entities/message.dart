
enum FromWho {me, hers}

class Message {
  final String text;
  final String? imageUl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageUl,
    required this.fromWho

  });
}