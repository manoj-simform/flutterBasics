import 'package:flutter/material.dart';

class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            floating: false,
            // stretch: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Scroll view example'),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Sliver List View Header',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(vertical: 2.0),
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9)],
                  child: Text('orange $index'),
                );
              },
              childCount: 9,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Sliver Grid View Header',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.deepOrange[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 30,
            ),
            // gridDelegate:
            //     const SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 200.0,
            //   mainAxisSpacing: 10.0,
            //   crossAxisSpacing: 10.0,
            //   childAspectRatio: 2.0,
            // ),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Nested List View Header',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.center,
                    color: Colors.orange[100 * (index % 9)],
                    child: Text('orange $index'),
                  );
                },
                itemCount: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
