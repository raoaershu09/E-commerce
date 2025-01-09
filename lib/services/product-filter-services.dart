// ignore_for_file: file_names

class ProductFilterService {
  List<Map<String, dynamic>> filterByBrand(List<Map<String, dynamic>> products, String brand) {
    return products.where((product) => product['brand'] == brand).toList();
  }

  List<Map<String, dynamic>> sortProducts(List<Map<String, dynamic>> products, String sortBy) {
    if (sortBy == 'Price: Low to High') {
      products.sort((a, b) => a['price'].compareTo(b['price']));
    } else if (sortBy == 'Price: High to Low') {
      products.sort((a, b) => b['price'].compareTo(a['price']));
    } else if (sortBy == 'Rating: High to Low') {
      products.sort((a, b) => b['rating'].compareTo(a['rating']));
    }
    return products;
  }
}
