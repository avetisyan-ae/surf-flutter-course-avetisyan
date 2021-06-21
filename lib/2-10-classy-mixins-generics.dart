void main() {
  //Задача 1:
  print('\nЗадача 1:');
  final student = Student(
      yearOfAdmission: 2013, firstName: 'Aleksandr', lastName: 'Kulikov');
  print(student.toString());
  //Задача 2:
  print('\nЗадача 2:');
  final Truck truck = Truck(color: Colors.red);
  print(truck.toString());
  truck.run();
  final Sportcar sportcar = Sportcar(color: Colors.greeen);
  print(sportcar.toString());
  sportcar.run();
  //Задача 3:
  print('\nЗадача 3:');
  final Generics generics = Generics(value: truck.enginePower);
  print(generics.convertToString());
}

/*Задача 1: Реализуйте класс Student (Студент), который будет наследоваться от
класса User. Класс должен иметь следующие свойства:
1)yearOfAdmission:DateTime (год поступления в вуз): инициализируется в
конструкторе
2)currentCourse:int (текущий курс): рассчитывается след. образом - из текущего
года вычесть год поступления. чтобы получить годы из DateTime, воспользуйтесь
свойством DateTime.year
Класс должен иметь метод toString() , с помощью которого можно вывести:
1)имя и фамилию студента - используя родительскую реализацию toString
2)год поступления
3)текущий курс*/
class User {
  const User({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;

  @override
  String toString() => '$firstName $lastName';
}

class Student extends User {
  const Student({ required this.yearOfAdmission, required String firstName, required String lastName}):assert(yearOfAdmission != null && firstName != null && lastName != null),
       super(firstName: firstName, lastName: lastName);

  final int yearOfAdmission;

  int get currentCourse {
    const firstMonthOfStudy = 9;
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    var currentCourse = currentYear - yearOfAdmission;

    if (currentCourse == 0) {
      currentCourse = 1;
    } else if (currentCourse > 0 && currentMonth > firstMonthOfStudy) {
      currentCourse += 1;
    }

    return currentCourse;
  }

  @override
  String toString() {
    var result = super.toString();
    result +=
        '\nГод поступления: $yearOfAdmission; Текущий курс: $currentCourse';
    return result;
  }
}

/*Задача 2: Есть базовый класс Car, с базовыми свойствами для всех машин;
Есть два наследника Грузовик и Спорткар;
И есть велосипед;
Велосипеды и автомобили являются разными видами транспорта, с различными
свойствами. Но, и велосипед и автомобили можно покрасить краской! Необходимо
написать миксин, устанавливающий на выбор один из трех цветов для транспортного
средства:
Создайте enum Colors с цветами red, green, blue
Создайти миксин Painter с свойством colorName:String и методом
setColor(Colors color). В зависимости от значения enum, метод устанавливает
название цвета 'red', 'green', 'blue'
Примените миксин к транспортным средствам и инициализируйте покраску в
конструкторе класса.
Переопределите метод toString, чтобы он выводил "Грузовик color_name цвета"
Транспортные средства, наследуемые от класса Car приходят в движения от
двигателя внутреннего сгорания. На велосипед двигатель установить нельзя.
Напишите миксин, который реализует двигатель только у наследников Car
Задайте свойство enginePower: int  с произвольным значением - мощность
двигателя
Напишите функцию runEngine которая выводит строку "Двигатель работает.
Максимальная скорость = мощности двигателя / вес автомобиля.
В Truck и SportCar в методе run выполните метод runEngine*/
abstract class Car with Painter {
  double weight;

  Car({required this.weight});
  
  void run();
}

class Truck extends Car with Engine {
  Truck({required Colors color}) {
    setColor(color);
  }

  @override
  double get weight => 10;

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return "Грузовик ${colorName} цвета";
  }
}

class Sportcar extends Car with Engine {
  Sportcar({ required Colors color}) {
    setColor(color);
  }
  @override
  double get weight => 2;

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return "Спорткар ${colorName} цвета";
  }
}

class Bike with Painter {
  Bike(Colors color) {
    setColor(color);
  }
}

enum Colors { red, greeen, blue }

mixin Painter {
  String? colorName;
  setColor(Colors color) {
    switch (color) {
      case Colors.red:
        colorName = 'красного';
        break;
      case Colors.greeen:
        colorName = 'зелёного';
        break;
      case Colors.blue:
        colorName = 'синего';
        break;
    }
  }
}

mixin Engine on Car {
  int enginePower = 600;
  runEngine() {
    print(
        'Двигатель работает. Максимальная скорость = ${enginePower / weight}');
  }
}

/*Задача 3: Используя обобщения написать класс с методом, приводящим полученное
значение в строку.*/
class Generics<T> {
  Generics({required this.value});

  final T value;

  String convertToString() {
    return value.toString();
  }
}
