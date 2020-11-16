import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:yibe_final_ui/pages/PostImage.dart';

class Gallery extends StatefulWidget {
  Gallery({Key key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  static List categoryList = ["Media", "Muse", "Stories"];
  static const MethodChannel _channel = const MethodChannel('photo_gallery');
  bool getList = true;
  List<Medium> photos;
  int activeCategory = 0;
  bool selected = false;
  String selectImageId = '';
  @override
  void initState() {
    super.initState();

    getListOfImages();
  }

  Future<void> getListOfImages() async {
    if (await _promptPermissionSetting()) {
      List<Album> photoalbum =
          await PhotoGallery.listAlbums(mediumType: MediumType.image);
      MediaPage _photos = await photoalbum[1].listMedia(take: 10);
      setState(() {
        photos = _photos.items;
        getList = false;
      });
    }
    setState(() {
      getList = false;
    });
  }

  static Future<MediaPage> listMedia({
    @required Album album,
    @required int total,
    int skip,
    int take,
  }) async {
    assert(album.id != null);
    final json = await _channel.invokeMethod('listMedia', {
      'albumId': album.id,
      'mediumType': mediumTypeToJson(album.mediumType),
      'total': total,
      'skip': skip,
      'take': take,
    });
    return MediaPage.fromJson(album, json);
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.0),
          child: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/back_btn.svg",
                        width: 30,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () async {
                          final File file = await PhotoGallery.getFile(
                              mediumId: selectImageId);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PostImage(
                              selectedImage: file,
                            );
                          }));
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                        )),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                height: 40.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          changeCategory(index);
                        },
                        child: Container(
                          padding: index == 0
                              ? EdgeInsets.only(top: 6.0, bottom: 6.0, left: 20)
                              : index == 1
                                  ? EdgeInsets.only(
                                      top: 6.0,
                                      bottom: 6.0,
                                      left: 100.0,
                                      right: 100.0)
                                  : EdgeInsets.only(
                                      top: 6.0, bottom: 6.0, right: 20.0),
                          child: Text(
                            categoryList[index],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: activeCategory == index
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      );
                    }),
              ),
              activeCategory == 0
                  ? getList
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : gridImage()
                  : Container()
            ]),
          ),
        ));
  }

  void changeCategory(int index) {
    activeCategory = index;
    setState(() {});
  }

  Widget gridImage() {
    selectImageId = photos[0].id;
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridWidth = (constraints.maxWidth - 20) / 3;
        double gridHeight = gridWidth + 33;
        double ratio = gridWidth / gridHeight;
        return Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    color: Colors.grey[300],
                    height: gridWidth,
                    width: gridWidth,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage(
                          'assets/images/photo-placeholder-icon-7.jpg'),
                      image: PhotoProvider(
                          mediumId: selected ? selectImageId : photos[0].id),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: ratio,
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: <Widget>[
                  ...?photos?.map(
                    (photo) => GestureDetector(
                      onTap: () {
                        changeSelectedImage(photo.id);
                      },
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              color: Colors.grey[300],
                              height: gridWidth,
                              width: gridWidth,
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: AssetImage(
                                    'assets/images/photo-placeholder-icon-7.jpg'),
                                image: PhotoProvider(mediumId: photo.id),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void changeSelectedImage(String imageId) {
    selected = true;
    selectImageId = imageId;
    print(imageId);
    setState(() {});
  }
}