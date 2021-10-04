import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trobify/domain/entities/user.dart';

void main() {
  test('Proving Singleton propierty', () {
    var userData1 = User();
    var userData2 = User();

    expect(userData1.hashCode == userData2.hashCode, true);
  });

  test('Proving setters', () {
    var userData = User();

    userData.setID('NumeroID');
    userData.setEmail('elarenas10@gmail.com');
    userData.setName('Alejandro');
    userData.setSurname('Arenas');
    userData.setPhone('662247308');
    userData.setImage(Image.network(
      'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/nopisito.jpg?alt=media&token=3820c455-d754-444a-b956-ba32cc35322e',
      fit: BoxFit.cover,
    ));
    userData.setImageRef('imageRef');

    expect(userData.getID(), 'NumeroID');
    expect(userData.getEmail(), 'elarenas10@gmail.com');
    expect(userData.getName(), 'Alejandro');
    expect(userData.getSurname(), 'Arenas');
    expect(userData.getPhone(), '662247308');
    expect(
        userData.getImage()!.image,
        Image.network(
          'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/nopisito.jpg?alt=media&token=3820c455-d754-444a-b956-ba32cc35322e',
          fit: BoxFit.cover,
        ).image);
    expect(userData.getImageRef(), 'imageRef');
  });
}
