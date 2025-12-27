import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, _) {
        return Row(
          children: [
            _FilterButton(
              label: 'Semua',
              selected: provider.filter == 'all',
              onTap: () => provider.setFilter('all'),
            ),
            const SizedBox(width: 12),
            _FilterButton(
              label: 'Aktif',
              selected: provider.filter == 'active',
              onTap: () => provider.setFilter('active'),
            ),
            const SizedBox(width: 12),
            _FilterButton(
              label: 'Selesai',
              selected: provider.filter == 'completed',
              onTap: () => provider.setFilter('completed'),
            ),
          ],
        );
      },
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.blue : Colors.grey[200],
        foregroundColor: selected ? Colors.white : Colors.black,
      ),
      child: Text(label),
    );
  }
}
