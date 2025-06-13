import 'package:flutter/material.dart';

class SearchBarExample extends StatelessWidget {
  const SearchBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample Search Screen')),
      body: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: ()=>controller.openView(),
            onChanged: (_)=>controller.openView(),
            leading: Icon(Icons.search),
            trailing: [
              Tooltip(
                    message: 'Change brightness mode',
                    child: IconButton(
                      //isSelected: isDark,
                      onPressed: () {
                        // setState(() {
                        //   isDark = !isDark;
                        // });
                      },
                      icon: const Icon(Icons.wb_sunny_outlined),
                      selectedIcon: const Icon(Icons.brightness_2_outlined),
                    ),
                  ),
            ],
          );
        },
        suggestionsBuilder: (
          BuildContext context,
          SearchController controller,
        ) {
          return List.generate(8, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () => controller.closeView(item),
            );
          });
        },
      ),
    );
  }
}
