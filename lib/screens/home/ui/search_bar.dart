import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        decoration:  InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search for Products, Brands and Latest Launched', 
          prefixIcon: const Icon(Icons.search,color: Colors.blue,),
          suffixIcon: InkWell(
            onTap: () {
              
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2)
              ),
              child: const Center(
                child: Icon(Icons.mic,color: Colors.blueAccent,),
              ),
            ),
          )
        ),
      ),
    );
  }
}