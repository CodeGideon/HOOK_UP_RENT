import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> defaultImages = [
  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fqqpublic.qpic.cn%2Fqq_public%2F0%2F0-2853798464-B9EE4E422150E24D6BC9D2629DE7B7A3%2F0%3Ffmt%3Djpg%26size%3D68%26h%3D424%26w%3D750%26ppv%3D1.jpg&refer=http%3A%2F%2Fqqpublic.qpic.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640855307&t=9fa3c8c010a5bcc2d6bc23d804335fe0',
  'https://img1.baidu.com/it/u=891538416,3926533336&fm=26&fmt=auto',
  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190928%2Fb748d77e19094f0684e3ca72ab65e972.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640855307&t=83f493a7556e41cfba4c886147788a01',
  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.gxqzrd.gov.cn%2Fuploads%2Fimages%2F20171023103332642.jpg&refer=http%3A%2F%2Fwww.gxqzrd.gov.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640855307&t=247ff1fe13dc002590cf72d070ce306c'
];
var imageWidth = 424;
var imageHeight = 750;

class CommonSwiper extends StatelessWidget {
  final List<String> images;

  const CommonSwiper({Key? key, this.images = defaultImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width * imageWidth / imageHeight;
    return Container(
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
