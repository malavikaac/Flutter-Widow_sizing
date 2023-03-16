class ProductDataModel{
  //data Type
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? price;

// constructor
  ProductDataModel(
      {
       this.id,
      this.name,
      this.category,
      this.imageURL,
      this.price
      }
   );

  //method that assign values to respective datatype vairables
  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    price = json['price'];
  }
}