import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'local_widgets/circle_avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chistes'),
          ),
          body: Obx(
            () => ListView.builder(
                itemCount: _.jokes.length,
                itemBuilder: (context, index) {
                  final jokeModel = _.jokes[index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CicleAvatar(),
                          title: Column(children: [
                            Text(jokeModel.joke),
                          ]),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.thumb_up),
                                  onPressed: () => _.like(index)),
                              Text(jokeModel.likes.toString()),
                              IconButton(
                                  icon: Icon(Icons.thumb_down),
                                  onPressed: () => _.dislike(index))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _.getJoke(),
          ),
        );
      },
    );
  }
}
