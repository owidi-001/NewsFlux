String dateConverter(String date) {
  var dateConveted = DateTime.parse(date);
  return dateConveted.toLocal().toString();
}
