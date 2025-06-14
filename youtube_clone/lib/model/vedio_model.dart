class VideoModel {
  final int id;
  final String thumnailImg;
  final String profileImg;
  final String username;
  final String title;
  final String viewCount;
  final String dayAgo;
  final String subscriberCount;
  final String likeCount;
  final String unlikeCount;
  final String videoUrl;
  final String? videoDuration; // optional field for detail videos

  VideoModel({
    required this.id,
    required this.thumnailImg,
    required this.profileImg,
    required this.username,
    required this.title,
    required this.viewCount,
    required this.dayAgo,
    required this.subscriberCount,
    required this.likeCount,
    required this.unlikeCount,
    required this.videoUrl,
    this.videoDuration,
  });


}


final List<VideoModel> videoList = [
  VideoModel(
    id: 1,
    thumnailImg: "assets/images/menu_3.jpg",
    profileImg: "https://i.pinimg.com/564x/07/04/c2/0704c2b3d35f418157cc90d6400ab0f9.jpg",
    username: "Car Smash",
    title: "Car Chase RealEngine 5",
    viewCount: "5,521,419",
    dayAgo: "Jun 29, 2018",
    subscriberCount: "511K",
    likeCount: "37K",
    unlikeCount: "1.1K",
    videoUrl: "assets/videos/video_3.mp4",
  ),
  VideoModel(
    id: 2,
    thumnailImg: "assets/images/menu_1.jpg",
    profileImg: "https://i.pinimg.com/736x/a7/29/30/a72930336b6eba33d9481f78735ab0f8.jpg",
    username: "a day magazine",
    title: "Violette Wautier - I'd Do It Again | Live in a day",
    viewCount: "1,122,707",
    dayAgo: "Jul 2, 2020",
    subscriberCount: "88.6K",
    likeCount: "11K",
    unlikeCount: "88",
    videoUrl: "assets/videos/video_1.mp4",
  ),
  VideoModel(
    id: 3,
    thumnailImg: "assets/images/menu_2.jpg",
    profileImg: "https://yt3.ggpht.com/ytc/AAUvwniJv0lOI9XzTWKHHA5pD04MMZSsGWCT9qWxb1w9Dw=s176-c-k-c0xffffffff-no-nd-rj-mo",
    username: "វណ្ណដា-VannDa Official",
    title: "Vanda Bert BadBoy",
    viewCount: "5,109,116",
    dayAgo: "Nov 25, 2020",
    subscriberCount: "1.45M",
    likeCount: "13K",
    unlikeCount: "69",
    videoUrl: "assets/videos/video_2.mp4",
  ),
  VideoModel(
    id: 4,
    thumnailImg: "assets/images/menu_4.jpg",
    profileImg: "https://i.pinimg.com/564x/f9/63/c3/f963c3caaeba743ece8ab7952db4496d.jpg",
    username: "KlapYaHandz",
    title: "Vin Mission Coffe at 2 am offical Cinematic Video",
    viewCount: "292,288",
    dayAgo: "Sep 25, 2020",
    subscriberCount: "511K",
    likeCount: "5.9K",
    unlikeCount: "65",
    videoUrl: "assets/videos/video_4.mp4",
  ),
 
];

final List<VideoModel> detailVideoList = [
 VideoModel(
    id: 5,
    thumnailImg: "assets/images/menu_5.jpg",
    profileImg: "https://yt3.ggpht.com/ytc/AAUvwnihe-DJ8LqGo-CIKGvJif0xpv_8aWF0UWiDZJSpEQ=s176-c-k-c0xffffffff-no-rj-mo",
    username: "Heng Visal",
    title: "មនុស្សអរូប by Noly Time [Official FULL MV]",
    viewCount: "1,311,740",
    dayAgo: "Dec 10, 2019",
    subscriberCount: "925K",
    likeCount: "37K",
    unlikeCount: "1.1K",
    videoUrl: "assets/videos/video_5.mp4",
    videoDuration: "12:04",
  ),
  VideoModel(
    id: 6,
    thumnailImg: "assets/images/menu_6.jpg",
    profileImg: "https://yt3.ggpht.com/ytc/AAUvwniOFTckqAPsjNIg5zGVZnJqLZ58RTgH0a4RSmFKBQ=s176-c-k-c0xffffffff-no-nd-rj-mo",
    username: "Kmeng Khmer - ក្មេងខ្មែរ Official",
    title: "KmengKhmer - ឆ្ងាយតែកាយ (Far Away) [Official MV]",
    viewCount: "5,388,486",
    dayAgo: "Sep 8, 2018",
    subscriberCount: "562K",
    likeCount: "13K",
    unlikeCount: "69",
    videoUrl: "assets/videos/video_6.mp4",
    videoDuration: "07:05",
  ),
  VideoModel(
    id: 7,
    thumnailImg: "assets/images/menu_2.jpg",
    profileImg: "https://yt3.ggpht.com/ytc/AAUvwniJv0lOI9XzTWKHHA5pD04MMZSsGWCT9qWxb1w9Dw=s176-c-k-c0xffffffff-no-nd-rj-mo",
    username: "វណ្ណដា-VannDa Official",
    title: "VANNDA - HIK HIK (FEAT. BAD BOY BERT) [OFFICIAL MUSIC VIDEO]",
    viewCount: "5,109,116",
    dayAgo: "Nov 25, 2020",
    subscriberCount: "1.45M",
    likeCount: "13K",
    unlikeCount: "69",
    videoUrl: "assets/videos/video_2.mp4",
    videoDuration: "04:30",
  ),
  VideoModel(
    id: 8,
    thumnailImg: "assets/images/menu_4.jpg",
    profileImg: "https://yt3.ggpht.com/ytc/AAUvwnjcXhQ1Tl-tCyXrovuQwBMHrFwE9uMzzclq2SzHjg=s176-c-k-c0xffffffff-no-rj-mo",
    username: "KlapYaHandz",
    title: "Vin Vitou - រាល់ថ្ងៃនេះ (Nowadays) Ft. Ruthko [Official MV]",
    viewCount: "292,288",
    dayAgo: "Sep 25, 2020",
    subscriberCount: "511K",
    likeCount: "5.9K",
    unlikeCount: "65",
    videoUrl: "assets/videos/video_4.mp4",
    videoDuration: "04:30",
  ),
];