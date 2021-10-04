import 'observer.dart';

abstract class Subject {
  void addObserver(Observer obs);

  void removeObserver(Observer obs);

  void notifyObservers();
}
