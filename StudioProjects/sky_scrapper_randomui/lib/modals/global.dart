class global {
  final String firstname;
  final String midname;
  final String lastname;
  final String email;
  final String city;
  final String state;
  final String country;
  final String img;
  final int age;
  final String phone;

  global({
    required this.firstname,
    required this.midname,
    required this.lastname,
    required this.email,
    required this.city,
    required this.country,
    required this.state,
    required this.img,
    required this.age,
    required this.phone,
  });

  factory global.fromMap({required Map data}) {
    return global(
        firstname: data['results'][0]['name']['title'],
        midname: data['results'][0]['name']['first'],
        lastname: data['results'][0]['name']['last'],
        email: data['results'][0]['email'],
        city: data['results'][0]['location']['city'],
        country: data['results'][0]['location']['country'],
        state: data['results'][0]['location']['state'],
        img: data['results'][0]['picture']['large'],
        age: data['results'][0]['dob']['age'],
        phone: data['results'][0]['phone']);
  }
}
