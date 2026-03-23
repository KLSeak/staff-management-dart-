import 'employee.dart';

abstract class StaffOperations {
  void add(Employee emp);
  void del(int index);
  void update(int index, String name, String position, double salary);
  void search(String name);
  void list();
  void showMenu();
}