import 'package:flutter/material.dart';

enum Filter { glutenFree, lactosFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.activeFilters});

  final Map<Filter, bool> activeFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFiltersSet = false;
  var _lactosFreeFiltersSet = false;
  var _vegetarianFiltersSet = false;
  var _veganFiltersSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFiltersSet = widget.activeFilters[Filter.glutenFree]!;
    _lactosFreeFiltersSet = widget.activeFilters[Filter.lactosFree]!;
    _vegetarianFiltersSet = widget.activeFilters[Filter.vegetarian]!;
    _veganFiltersSet = widget.activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (id) {
      //     Navigator.of(context).pop();
      //     if (id == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFiltersSet,
            Filter.lactosFree: _lactosFreeFiltersSet,
            Filter.vegetarian: _vegetarianFiltersSet,
            Filter.vegan: _veganFiltersSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFiltersSet,
              onChanged: (newVal) {
                setState(() {
                  _glutenFreeFiltersSet = newVal;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 34),
            ),
            SwitchListTile(
              value: _lactosFreeFiltersSet,
              onChanged: (newVal) {
                setState(() {
                  _lactosFreeFiltersSet = newVal;
                });
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactos-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 34),
            ),
            SwitchListTile(
              value: _vegetarianFiltersSet,
              onChanged: (newVal) {
                setState(() {
                  _vegetarianFiltersSet = newVal;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 34),
            ),
            SwitchListTile(
              value: _veganFiltersSet,
              onChanged: (newVal) {
                setState(() {
                  _veganFiltersSet = newVal;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 34),
            ),
          ],
        ),
      ),
    );
  }
}
