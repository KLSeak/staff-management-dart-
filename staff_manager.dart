import 'dart:io';
import 'employee.dart';
import 'staff_operations.dart';

class StaffManager implements StaffOperations {
  List<Employee> staffList = [];

  @override
  void add(Employee emp) {
    staffList.add(emp);
    print("Staff added successfully...");
  }

  @override
  void del(int index) {
    if (index >= 0 && index < staffList.length) {
      staffList.removeAt(index); 
      print("Staff deleted successfully!");
    } else {
      print("Invalid index!");
    }
  }

  @override
  void update(int index, String name, String position, double salary) {
    if (index >= 0 && index < staffList.length) {
      staffList[index].name = name;
      staffList[index].position = position;
      staffList[index].salary = salary;
      print("\nStaff updated successfully!");
    } else {
      print("Invalid index!");
    }
  }

  @override
  void search(String name) {
    int index = staffList.indexWhere(
      (emp) => emp.name.toLowerCase() == name.toLowerCase(),
    );
    if (index != -1) {
      print("Staff found: ${staffList[index].name} | Position: ${staffList[index].position} | Salary: \$${staffList[index].salary}");
    } else {
      print("Staff member not found.");
    }
  }

  @override
  void list() {
    print("\n--- Employee List ---");
    if (staffList.isEmpty) {
      print("No staff records available.");
    } else {
      for (int i = 0; i < staffList.length; i++) {
        print("${i + 1}. Name: ${staffList[i].name} | Position: ${staffList[i].position} | Salary: \$${staffList[i].salary}");
      }
    }
  }

  @override
  void showMenu() {
    while (true) {
      print("\n======== STAFF MANAGEMENT SYSTEM ========");
      print("1. ❖ List All Staff");
      print("2. ✚ Add New Staff");
      print("3. ⅹ Delete Staff");
      print("4. ✓ Update Staff");
      print("5. 🔍 Search Staff");
      print("0. ➡️ Exit");

      stdout.write("Choose an option: ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          list();
          break;
        case '2':
          stdout.write('Enter Staff Name: ');
          String name = stdin.readLineSync()!;
          stdout.write('Enter Position: ');
          String position = stdin.readLineSync()!;
          stdout.write('Enter Salary: ');
          double salary = double.tryParse(stdin.readLineSync()!) ?? 0.0;
          add(Employee(name, position, salary));
          break;
        case '3':
          list();
          if (staffList.isNotEmpty) {
            stdout.write('Enter number to delete: ');
            int index = (int.tryParse(stdin.readLineSync()!) ?? 0) - 1;
            del(index);
          }
          break;
        case '4':
          list();
          if (staffList.isNotEmpty) {
            stdout.write('Enter number to update: ');
            int index = (int.tryParse(stdin.readLineSync()!) ?? 0) - 1;
            stdout.write('Enter new name: ');
            String name = stdin.readLineSync()!;
            stdout.write('Enter new position: ');
            String position = stdin.readLineSync()!;
            stdout.write('Enter new salary: ');
            double salary = double.tryParse(stdin.readLineSync()!) ?? 0.0;
            update(index, name, position, salary);
          }
          break;
        case '5':
          stdout.write('Enter name to search: ');
          String name = stdin.readLineSync()!;
          search(name);
          break;
        case '0':
          print("Exiting system...");
          return;
        default:
          print('Invalid option. Please try again.');
      }
    }
  }
}