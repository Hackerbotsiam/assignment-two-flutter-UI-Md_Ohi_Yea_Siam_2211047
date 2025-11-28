import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Text("S",
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back,",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                          Text(
                            "Ohi Yea Siam",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.notifications_none, size: 28),
                ],
              ),

              const SizedBox(height: 20),

              /// MONTHLY REPORT TITLE
              const Text(
                "Monthly Spending Report",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              /// TOTAL EXPENSE CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Total Expenses (Last 30 days)",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "-\$1270.00",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.red, size: 18),
                        SizedBox(width: 4),
                        Text("Up 12% from last month",
                            style: TextStyle(color: Colors.red)),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// SPENDING BREAKDOWN TITLE
              const Text(
                "Spending Breakdown",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              _category("Food & Drink", 450, Colors.red, "35%"),
              _category("Shopping", 320, Colors.blue, "25%"),
              _category("Housing", 280, Colors.amber, "22%"),
              _category("Transport", 150, Colors.green, "12%"),
              _category("Other", 70, Colors.grey, "6%"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _category(String title, double amount, Color color, String percent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 10),

          /// progress bar
          LinearProgressIndicator(
            value: amount / 1300,
            backgroundColor: Colors.grey[300],
            color: color,
            minHeight: 6,
          ),
          const SizedBox(height: 10),

          Text("\$${amount.toStringAsFixed(2)} ($percent)",
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
