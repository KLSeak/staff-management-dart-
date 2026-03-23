import 'employee.dart';
import 'staff_manager.dart';

void main() {
  StaffManager sm = StaffManager();
  
  sm.add(Employee('Sok Dara', 'Manager', 1200.0));
  sm.add(Employee('Keo Pich', 'Developer', 800.0));
  
  sm.showMenu();
}