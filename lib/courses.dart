import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<Category> categories = [
    Category('Ages 5-10', Icons.school_rounded, Color.fromARGB(255, 133, 9, 9)),
    Category(
        'Ages 11-14', Icons.school_rounded, Color.fromARGB(255, 133, 9, 9)),
    Category(
        'Ages 15-18', Icons.school_rounded, Color.fromARGB(255, 133, 9, 9)),
    Category('Ages 18+', Icons.school_rounded, Color.fromARGB(255, 133, 9, 9)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses Offered'),
      ),
      body: Container(
        color: Colors.blue[100],
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                'Courses Offered',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 14),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CoursesPage(category: categories[index]),
                        ),
                      );
                    },
                    child: CategoryTile(category: categories[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData iconData;
  final Color color;

  Category(this.name, this.iconData, this.color);
}

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: category.color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              category.iconData,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class CoursesPage extends StatelessWidget {
  final Category category;

  CoursesPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Center(
        child: Text(
          'Courses for ${category.name} will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
