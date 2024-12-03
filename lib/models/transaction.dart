

class Transaction {
  final String id;
  final String name;
  final String subtitle;
  final int amount;

  const Transaction(
      {required this.id,
      
      required this.name,required this.subtitle,
      this.amount = 100});
}