class User {
  String id_user;
  String nama_lengkap_user;
  String username;
  String gmail_user;
  String password_user;
  String jenis_kelamin;
  String tanggal_lahir;
  String no_handphone;
  String jenis_user;
  String bio_user;
  User({
    required this.id_user,
    required this.nama_lengkap_user,
    required this.username,
    required this.gmail_user,
    required this.password_user,
    required this.jenis_kelamin,
    required this.tanggal_lahir,
    required this.no_handphone,
    required this.jenis_user,
    required this.bio_user,
  });
  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id_user: object['id_user'],
        nama_lengkap_user: object['nama_lengkap_user'],
        username: object['username'],
        gmail_user: object['gmail_user'],
        password_user: object['password_user'],
        jenis_kelamin: object['jenis_kelamin'],
        tanggal_lahir: object['tanggal_lahir'],
        no_handphone: object['no_handphone'],
        jenis_user: object['jenis_user'],
        bio_user: object['bio_user']);
  }
}
