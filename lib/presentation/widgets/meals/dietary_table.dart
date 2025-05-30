import 'package:flutter/material.dart';
import 'package:spoonie/infrastructure/models/models.dart';

class DietaryTable extends StatelessWidget {
  const DietaryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 220,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 0,
        color: colors.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
              2: IntrinsicColumnWidth(),
            },
            border: TableBorder.symmetric(
              inside: BorderSide(color: colors.errorContainer),
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(color: colors.inversePrimary),
                children: [
                  _BuildHeaderCell(title: 'True'),
                  _BuildHeaderCell(title: 'Description'),
                  _BuildHeaderCell(title: 'False'),
                ],
              ),
              ...dietaryOptions.map((option) {
                return TableRow(
                  children: [
                    _BuildIconCell(icon: option.icon, color: Colors.green),
                    _BuildDescriptionCell(description: option.label),
                    _BuildIconCell(icon: option.icon, color: Colors.red),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildHeaderCell extends StatelessWidget {
  final String title;

  const _BuildHeaderCell({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _BuildDescriptionCell extends StatelessWidget {
  final String description;

  const _BuildDescriptionCell({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text(description)),
    );
  }
}

class _BuildIconCell extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _BuildIconCell({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Icon(icon, color: color, size: 18)),
    );
  }
}
