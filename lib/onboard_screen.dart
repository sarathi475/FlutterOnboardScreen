import 'package:flutter/material.dart';
import 'package:flutter_onboard/Home.dart';
import 'package:flutter_onboard/data.dart';

class OnBaordScreen extends StatefulWidget {
  const OnBaordScreen({Key? key}) : super(key: key);

  @override
  State<OnBaordScreen> createState() => _OnBaordScreenState();
}

class _OnBaordScreenState extends State<OnBaordScreen> {
  int _currentIndex = 0;
  PageController controller = new PageController();

  List<SliderModel> sampleData = [
    SliderModel(
        imageAssetPath: "assets/illustration.png",
        title: "Search",
        desc:
            "Discover Restaurants offering the best fast food food near you on Foodwa"),
    SliderModel(
        imageAssetPath: "assets/illustration2.png",
        title: "Order",
        desc:
            "Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins"),
    SliderModel(
        imageAssetPath: "assets/illustration3.png",
        title: "Eat",
        desc:
            "Food delivery or pickup from local restaurants, Explore restaurants that deliver near you."),
  ];

  void initState() {
    super.initState();
    controller = new PageController();
  }

  void _onPressed(int index) {
    setState(() {
      _currentIndex = index + 1;
    });
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              Expanded(
                child: PageView(
                  // controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    SliderContainer(
                      image: sampleData[0].getImageAssetPath(),
                      title: sampleData[0].getTitle(),
                      desc: sampleData[0].getDesc(),
                    ),
                    SliderContainer(
                      image: sampleData[1].getImageAssetPath(),
                      title: sampleData[1].getTitle(),
                      desc: sampleData[1].getDesc(),
                    ),
                    SliderContainer(
                      image: sampleData[2].getImageAssetPath(),
                      title: sampleData[2].getTitle(),
                      desc: sampleData[2].getDesc(),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      i == _currentIndex
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: _currentIndex != 2
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                print("button click");
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: Text("skip")),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                _onPressed(_currentIndex);
                                print("button click");
                              },
                              child: Text("Next"))
                        ],
                      )
                    : Container(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text("Get Started"),
                        ),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderContainer extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  const SliderContainer(
      {Key? key, required this.title, required this.desc, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(desc),
          ),
        ],
      ),
    );
  }
}
