import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final String iconState;
  final Function(String) onIconStateChanged;

  const SearchTextField({
    Key? key,
    required this.iconState,
    required this.onIconStateChanged,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _clearState() {
    _searchController.clear();
    widget.onIconStateChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Add a floating search bar to the app
        SliverAppBar(
          floating: true,
          // Use a Material design search bar
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              // Add a clear button to the search bar
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {
                  _clearState();
                },
              ),
            ),
          ),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) {
        //       return ListTile(
        //         title: Text('Item $index'),
        //       );
        //     },
        //     childCount: 20,
        //   ),
        // ),
      ],
    );
  }
}
