import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(
        title: const Text('Page 1'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: Container(),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            const SizedBox(height: 20),

            _buildBalanceCard(),

            const SizedBox(height: 20),

            _buildActionButtons(context),

            const SizedBox(height: 28),

            const Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            //TRANSACTIONS
            _buildTransactionItem(
              title: "Netflix Subscription",
              category: "Entertainment",
              date: "Today",
              amount: -19.99,
            ),

            _buildTransactionItem(
              title: "Coffee Shop",
              category: "Food & Drink",
              date: "Today",
              amount: -4.50,
            ),

            _buildTransactionItem(
              title: "Salary Deposit",
              category: "Income",
              date: "Yesterday",
              amount: 3500.00,
            ),

            _buildTransactionItem(
              title: "Grocery Store",
              category: "Shopping",
              date: "Yesterday",
              amount: -55.80,
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------
  // Welcome Section
  // ------------------------------
  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff4f46e5),
          child: Text("S", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome back,", style: TextStyle(fontSize: 14)),
            Text("Ohi Yea Siam",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications_none, size: 26),
      ],
    );
  }

  // ------------------------------
  // Balance Card
  // ------------------------------
  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xff6a1b9a),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Total Balance",
              style: TextStyle(color: Colors.white70, fontSize: 15)),
          SizedBox(height: 6),
          Text(
            "\$8,945.32",
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Savings: \$5,500", style: TextStyle(color: Colors.white)),
              Text("Last 30 days: +\$300",
                  style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }

  // ------------------------------
  // Transfer / Pay Bills / Invest Buttons
  // ------------------------------
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionButton(Icons.send, "Transfer", '/transfer', context),
        _buildActionButton(Icons.receipt_long, "Pay Bills", '/paybills', context),
        _buildActionButton(Icons.show_chart, "Invest", '/invest', context),
      ],
    );
  }

  Widget _buildActionButton(
      IconData icon, String text, String route, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 100,
        height: 95,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: const Color(0xff6a1b9a)),
            const SizedBox(height: 7),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------
  // Transaction Item
  // ------------------------------
  Widget _buildTransactionItem({
    required String title,
    required String category,
    required String date,
    required double amount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.shopping_bag_outlined, size: 30),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                Text(
                  "$category • $date",
                  style: TextStyle(
                      fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          Text(
            (amount < 0 ? "-\$${amount.abs()}" : "+\$${amount}"),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: amount < 0 ? Colors.red : Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
