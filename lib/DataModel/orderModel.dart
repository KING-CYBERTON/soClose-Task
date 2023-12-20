class Orders {
  final String contactname;
  final String contactphone;
  final String total;
  final String? mpesaname;
  final String? mpesnumber;
  final String? mpesacode;
  final String? currentUserEemail;
  final List orderlist;
  final List deliverdetails;

  const Orders({
    required this.contactname,
    required this.contactphone,
    required this.total,
    required this.mpesaname,
    required this.mpesnumber,
    required this.mpesacode,
    required this.currentUserEemail,
    required this.orderlist,
    required this.deliverdetails,
  });
}
