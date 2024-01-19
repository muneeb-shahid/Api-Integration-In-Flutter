import 'package:flutter/material.dart';

import '../../crud_api/get_api/get_photos_api.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Photos Api"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotosModel(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: photosModel_List.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.network(
                            photosModel_List[index].thumbnailUrl.toString(),
                          ),
                          title: Text(
                            photosModel_List[index].id.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          subtitle: Text(
                            photosModel_List[index].title.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
