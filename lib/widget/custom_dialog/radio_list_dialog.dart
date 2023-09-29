part of 'custom_dialog.dart';

class _RadioListDialog extends StatefulWidget {
  const _RadioListDialog({super.key, this.title, required this.items});

  final String? title;
  final List<String> items;

  @override
  State<_RadioListDialog> createState() => _RadioListDialogState();
}

class _RadioListDialogState extends State<_RadioListDialog> {
  int? _selectedIndex;

  void _onTap(int? index) {
    if (index == null) return;

    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title ?? "").toEmpty(widget.title.isEmptyOrNull),
      actions: [OKButton(context, val: _selectedIndex)],
      content: SizedBox(
        height: 0.35.toDynamicHeight(context),
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            String item = widget.items[index];
            return ListTile(
              title: Text(item),
              onTap: () => _onTap(index),
              splashColor: Colors.transparent,
              leading: Radio<int>.adaptive(
                value: index,
                groupValue: _selectedIndex,
                onChanged: _onTap,
              ),
            );
          },
        ),
      ),
    );
  }
}
