// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:laptopharbor/services/product-filter-services.dart';
import 'package:laptopharbor/widgets/filter-sort-widegts.dart';

class FilterSortScreen extends StatefulWidget {
  @override
  _FilterSortScreenState createState() => _FilterSortScreenState();
}

class _FilterSortScreenState extends State<FilterSortScreen> {
  final ProductFilterService _filterService = ProductFilterService();
  List<Map<String, dynamic>> _products = [
    {'name': 'Dell XPS 13', 'brand': 'Dell', 'price': 999, 'rating': 4.5},
    {'name': 'HP Spectre x360', 'brand': 'HP', 'price': 1099, 'rating': 4.7},
    {'name': 'Asus', 'brand': 'ASUS', 'price': 150000, 'rating': 4.7},
    {'name': 'HP Spectre x360', 'brand': 'HP', 'price': 1099, 'rating': 4.7},

    // Add more laptop data here
  ];
  List<Map<String, dynamic>> _displayedProducts = [];
  String _filterBrand = '';
  String _sortBy = '';

  @override
  void initState() {
    super.initState();
    _displayedProducts = _products;
  }

  void _filterProducts(String brand) {
    setState(() {
      _filterBrand = brand;
      _displayedProducts = _filterService.filterByBrand(_products, brand);
    });
  }

  void _sortProducts(String sortBy) {
    setState(() {
      _sortBy = sortBy;
      _displayedProducts = _filterService.sortProducts(_displayedProducts, sortBy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter and Sort Laptops"),
      ),
      body: Column(
        children: [
          // Call the FilterSortWidget
          FilterSortWidget(
            onFilterChanged: _filterProducts,
            onSortChanged: _sortProducts,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _displayedProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_displayedProducts[index]['name']),
                  subtitle: Text('Price: \$${_displayedProducts[index]['price']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
