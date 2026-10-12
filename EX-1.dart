enum Skill { FLUTTER, DART, OTHER }

// Q1 add new attributes.
class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearOfExperience;

  // Q2. Update the constructor.
  Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skills,
    required Address address,
    required int yearOfExperience,
  }) : _name = name,
       _baseSalary = baseSalary,
       _skills = skills,
       _address = address,
       _yearOfExperience = yearOfExperience;

  // Named constructor
  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearsOfExperience,
  }) : this(
         name: name,
         baseSalary: baseSalary,
         skills: const [Skill.FLUTTER, Skill.DART],
         address: address,
         yearOfExperience: yearsOfExperience,
       );

  // Q3. provide getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get adress => _address;
  int get yearOfExperience => _yearOfExperience;

  // Q4. Calculate salary
  double get salary {
    double total = _baseSalary + (_yearOfExperience * 2000);

    for (var i in _skills) {
      if (i == Skill.FLUTTER) {
        total += 5000;
      } else if (i == Skill.DART) {
        total += 3000;
      } else {
        total += 1000;
      }
    }
    return total;
  }

  void printDetails() {
    print(
      'Employee: $name, Base Salary: \$${baseSalary} \n${_skills} \nCity: ${_address.city} \nExperience: ${_yearOfExperience} \nTotal Salary : \$${salary} \n ',
    );
  }
}

void main() {
  // var emp = Employee('Sokea', 40000);
  var emp1 = Employee.mobileDeveloper(
    name: "Sokea",
    baseSalary: 40000,
    address: const Address('street 1', 'Pnhom Penh', '1200'),
    yearsOfExperience: 3,
  );
  emp1.printDetails();

  // var emp2 = Employee('Ronan', 45000);
  var emp2 = Employee.mobileDeveloper(
    name: 'Ronan',
    baseSalary: 45000,
    address: const Address('street 2', 'CADT', '2004'),
    yearsOfExperience: 5,
  );
  emp2.printDetails();
}
