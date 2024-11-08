class Order {
  final String serviceName;
  final String status;
  final String freelancerName;
  final DateTime deliveryDate;
  final String details;

  Order({
    required this.serviceName,
    required this.freelancerName,
    required this.status,
    required this.deliveryDate,
    required this.details,
  });
}
