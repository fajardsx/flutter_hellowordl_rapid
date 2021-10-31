class Personel {
  String _firstName; //_ is private
  String _lastName;
  String _birthdate;
  String _address;
  String _city;
  int _zipcode;
  String _phone;
  String _image;
  bool _isActive;

  // Personel(
  //     [this.firstName = "",
  //     this.lastName = "",
  //     this.birthdate = "",
  //     this.address = "",
  //     this.city = "",
  //     this.zipcode = 0,
  //     this.phone = "",
  //     this.image = "",
  //     this.isActive = false]);

  Personel.constructor1(
    this._firstName,
    this._lastName,
    this._birthdate,
    this._address,
    this._city,
    this._zipcode,
    this._phone,
  )   : this._isActive = false,
        this._image = "";

  String get firstName => _firstName;
  String get lasttime => _lastName;

  set setfirstName(String value) {
    _firstName = value;
  }
}
