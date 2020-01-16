import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:janta/CustomShapeClipper.dart';

void main() => runApp(MaterialApp(
      title: 'Janta',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

List<String> locations = ['Rongai', 'Bomas'];
List<String> services = ['HairDressing', 'Massage'];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[HomeTop(), HomeBottom()],
      ),
    );
  }
}

const TextStyle txtBlue =
    TextStyle(color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.bold);
const TextStyle txtIndigo = TextStyle(
    color: Colors.indigo, fontSize: 16.0, fontWeight: FontWeight.bold);
const TextStyle txtBlack = TextStyle(color: Colors.black, fontSize: 16.0);
const TextStyle txtWhite = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle txtName = TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold);
const TextStyle txtJob = TextStyle(color: Colors.white, fontSize: 14.0);

class HomeTop extends StatefulWidget {
  @override
  _HomeTopState createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  var selectedLocation = 0;
  var searchService = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.indigo, Colors.lightBlue],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                          onSelected: (index) {
                            setState(() {
                              selectedLocation = index;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                locations[selectedLocation],
                                style: txtWhite,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: Text(
                                    locations[selectedLocation],
                                    style: txtBlack,
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: txtBlack,
                                  ),
                                  value: 1,
                                ),
                              ]),
                      Spacer(),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'What Services are you Looking for?',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    child: TextField(
                      controller: TextEditingController(text: services[0]),
                      //todo bottom overflow
                      cursorColor: Colors.indigo,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 13.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black45,
                            ),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Best of Janta", style: txtIndigo),
                Spacer(),
                Text("Filter", style: txtIndigo)
              ],
            ),
          ),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: jobCard,
            ),
          )
        ],
      ),
    );
  }
}

List<JobCard> jobCard = [
  JobCard("assets/images/babbysitter.jpg", "Baby Sitter", "Racheal Green",
      "100 per Day"),
  JobCard("assets/images/carwasher.jpg", "Car Wash", "Joey Down",
      "100 per Day"),
  JobCard(
      "assets/images/maid.jpg", "House Maid", "Monica Grip", "100 per Day"),
  JobCard(
      "assets/images/salon.jpg", "Hair Dresser", "Emmy Doe", "100 per Day"),
];

class JobCard extends StatefulWidget {
  final String imgPath, jobName, userName, price;

  const JobCard(this.imgPath, this.jobName, this.userName, this.price);
  @override
  State<StatefulWidget> createState() =>
      JobCardState(this.imgPath, this.jobName, this.userName, this.price);
}

class JobCardState extends State<JobCard> {
  final String imgPath, jobName, userName, price;

  JobCardState(this.imgPath, this.jobName, this.userName, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 210.0,
              width: 180.0,
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              height: 60.0,
              width: MediaQuery.of(context).size.width * 1.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.indigo, Colors.indigo.withOpacity(0.0)],
                  )
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              right: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(userName, style: txtName),
                      Text(jobName, style: txtJob),

                    ],
                  ),
                  
                  Icon(
                     Icons.account_circle,
                     color: Colors.white,
                     size: 20.0,
                  ),
                  
                ],
        
              ),
            )
          ],
        ),
      ),
    );
  }
}
