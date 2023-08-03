class Orders {
  final String contactname;
  final String contactphone;
  final String total;
  final String? mpesaname;
  final String? mpesnumber;
  final String? mpesacode;
  final List orderlist;

  const Orders( {
    required this.contactname,
    required this.contactphone,
    required this.total,
    required this.mpesaname,
    required this.mpesnumber,
    required this.mpesacode,
    required this.orderlist, 
  });


}
