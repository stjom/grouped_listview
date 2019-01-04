import 'package:flutter_test/flutter_test.dart';

import 'package:grouped_listview/grouped_listview.dart';

void main() {
  Grouper<TestClass, String> cut;
  var groupBy = (TestClass c) {
    return c.group;
  };

  List<TestClass> getSampleData() {
    return <TestClass>[
      TestClass(1, "Test1"),
      TestClass(2, "Test1"),
      TestClass(3, "Test3"),
      TestClass(4, "Test2"),
      TestClass(5, "Test1"),
      TestClass(6, "Test3"),
      TestClass(7, "Test1"),
    ];
  }

  setUp(() {
    cut = Grouper<TestClass, String>();
  });

  test('empty list returns empty list', () {
    var collection = List<TestClass>();

    var result = cut.groupList(collection, groupBy);

    expect(result.length, 0);
  });

  test('null list throws argument error', () {
    var collection;

    expect(() => cut.groupList(collection, groupBy), throwsArgumentError);
  });

  test('groupby function is null throws argument error', () {
    var collection = <TestClass>[TestClass(1, "Test")];
    expect(() => cut.groupList(collection, null), throwsArgumentError);
  });

  test('Valid data returns correct amount of elements', () {
    var collection = getSampleData();

    var result = cut.groupList(collection, groupBy);

    expect(result.length, 10); // 7 Elements + 3 Group headers
  });


}

class TestClass {
  int value;
  String group;

  TestClass(this.value, this.group);

}
