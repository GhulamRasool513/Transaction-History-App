class User{
  String? date;
  String? amount;
  String? email;

  User({this.date, this.amount, this.email});

  static User fromjson(json) => User(
    date: json['date'],
    amount: json['amount'],
    email: json['email'],
  );
}