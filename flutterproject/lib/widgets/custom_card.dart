class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomCard({
    required this.title,
    required this.description,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title),
            Text(description),
          ],
        ),
      ),
    );
  }
}