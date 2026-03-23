class Employee {
  String name;
  String position;
  double salary;

  Employee(this.name, this.position, this.salary);

  void showInfo() {
    print('Name: $name, Position: $position, Salary: \$${salary.toStringAsFixed(2)}');
  }
}