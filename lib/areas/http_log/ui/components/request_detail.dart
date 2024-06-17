import "package:flutter/material.dart";

class RequestDetail extends StatelessWidget {
  const RequestDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: Colors.lightBlue),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text("POST api.github.com/users/create"),
              ),
              Text("200 - OK"),
              SizedBox(height: 100),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
          child: const Row(
            children: [
              Expanded(
                child: Text("Request Headers"),
              ),
              Expanded(
                child: Text("Request Body"),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 200, 12, 0),
          child: const Row(
            children: [
              Expanded(
                child: Text("Response Headers"),
              ),
              Expanded(
                child: Text("Response Body"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
