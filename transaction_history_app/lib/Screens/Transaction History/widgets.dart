import 'package:flutter/material.dart';

//Widgets Of Transaction History Screen.

//Search bar for Transaction History Screen.
class MyTextField extends StatelessWidget {

  final Function(String val) onChanged;

  const MyTextField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Color(0xff93B7E5),
            filled: true),
      ),
    );
  }
}


//Decoration Of Items Of Transaction History Screen.
class MyCard extends StatelessWidget {
  final String date;
  final String amount;
  final String type;
  final String id;
  final Function()? onTap;

  MyCard(
      {required this.date,
        required this.amount,
        required this.type,
        required this.id,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Making items of the screen Clickable.
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //Transparent Red Container
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:
                  type == 'payment' || type == 'withdrawal' ? const Color(0xFFFBD5D5) : const Color(0xFFBFE9C8),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),

                //Dollar Sign Container
                child: Center(
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: type == 'payment' || type == 'withdrawal' ? Colors.red : Colors.green,
                          borderRadius:
                          BorderRadius.all(const Radius.circular(30.0))),
                      child: Icon(
                        Icons.attach_money,
                        size: 25,
                        color: Colors.white70,
                      )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$type',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date!,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    type == 'payment' || type == 'withdrawal' ? '-\$$amount' : '+\$$amount',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: type == 'payment' || type == 'withdrawal'
                          ? Colors.red.shade500
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text('id-$id',style: const TextStyle( color: Colors.black38,),),
                      const SizedBox(
                        width: 7,
                      ),
                      Icon(
                        type == 'payment' || type == 'withdrawal'
                            ? Icons.arrow_circle_up
                            : Icons.arrow_circle_down,
                        color: type == 'payment' || type == 'withdrawal' ? Colors.red : Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(thickness: 1,)
      ],
    );
  }
}