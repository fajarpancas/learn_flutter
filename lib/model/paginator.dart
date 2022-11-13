class Paginator {
  final String page;
  final String totalPages;

  Paginator({this.page = "", this.totalPages = ""});

  factory Paginator.fromJson(Map<String, dynamic> json) {
    return Paginator(
        page: json['page'].toString(),
        totalPages: json['total_pages'].toString());
  }
}
