import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.15),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.fcai3-1.fna.fbcdn.net/v/t1.6435-9/122668576_3540912739308597_6214632756950452822_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=rgSSySL41f0AX9z14pB&_nc_ht=scontent.fcai3-1.fna&oh=0ff0e7e1daaa41926015118acb56bbc8&oe=60CFCA22'),
                  radius: 50,
                ),
                Text(
                  'Abdul-Rahman Hany',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ],
            ),
            PCard(' abdulrahmanhany93@gmail.com', Icons.mail),
            PCard('*******', Icons.lock),
            PCard('5/5/2001', Icons.calendar_today),
            PCard('English', Icons.language),
            PCard('Sign Out', Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
}

class PCard extends StatefulWidget {
  final String text;
  final IconData icon;

  PCard(this.text, this.icon);

  @override
  _PCardState createState() => _PCardState();
}

class _PCardState extends State<PCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade800.withOpacity(0.3),
      ),
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          leading: Icon(
            widget.icon,
            color: Colors.orange,
          ),
          title: Text(
            widget.text,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(
            Icons.edit,
            color: Colors.grey,
          ),
        ),
      ),

    );
  }
}
