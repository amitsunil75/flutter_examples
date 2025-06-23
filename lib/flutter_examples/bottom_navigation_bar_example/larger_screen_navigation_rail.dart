import 'package:flutter/material.dart';

class LargerScreenNavigationRail extends StatefulWidget {
  const LargerScreenNavigationRail({super.key});

  @override
  State<LargerScreenNavigationRail> createState() =>
      _LargerScreenNavigationRailState();
}

class _LargerScreenNavigationRailState
    extends State<LargerScreenNavigationRail> {
  int _selectedIndex = 0;
 c
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              groupAlignment: groupAlignment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              destinations: [
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.favorite),
                  icon: Icon(Icons.favorite_outline),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.book),
                  icon: Icon(Icons.bookmark_add),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  selectedIcon: Icon(Icons.star),
                  icon: Badge(label: Text('4'), child: Icon(Icons.star_border)),
                  label: Text(''),
                ),
              ],
              selectedIndex: _selectedIndex,

              leading:
                  showLeaading
                      ? FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      )
                      : SizedBox(),
              trailing:
                  showTrailing
                      ? IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_horiz_rounded),
                      )
                      : SizedBox(),
            ),
            VerticalDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('selected index: $_selectedIndex'),
                  const SizedBox(height: 20),
                  Text('Label Type: ${labelType.name}'),
                  SizedBox(height: 10),
                  SegmentedButton(
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        labelType = newSelection.first;
                      });
                    },
                    segments: [
                      ButtonSegment(
                        label: Text('None'),
                        value: NavigationRailLabelType.none,
                      ),
                      ButtonSegment(
                        label: Text('Selected'),
                        value: NavigationRailLabelType.selected,
                      ),
                      ButtonSegment(
                        label: Text('All'),
                        value: NavigationRailLabelType.all,
                      ),
                    ],
                    selected: {labelType},
                  ),
                  SizedBox(height: 20),
                  Text('Group Alignment: $groupAlignment'),
                  SizedBox(height: 10),
                  SegmentedButton(
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        groupAlignment = newSelection.first;
                      });
                    },
                    segments: [
                      ButtonSegment(value: -1.0, label: Text('top')),
                      ButtonSegment(value: 0.0, label: Text('center')),
                      ButtonSegment(value: 1.0, label: Text('bottom')),
                    ],
                    selected: {groupAlignment},
                  ),
                  SizedBox(height: 20),
                  SwitchListTile(
                    value: showLeaading,
                    onChanged: (v) {
                      setState(() {
                        showLeaading = v;
                      });
                    },
                  ),
                  SwitchListTile(value: showTrailing, onChanged: (v){
                    setState(() {
                       showTrailing = v;
                    });
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
