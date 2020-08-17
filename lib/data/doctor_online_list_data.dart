class DoctorOnlineListData {
  DoctorOnlineListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perTime = 180,
    this.tag = 'ทั่วไป|หู|คอ',
    this.startColor = '',
    this.endColor = '',
    });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perTime;
  String tag;
  String startColor;
  String endColor;

  static List<DoctorOnlineListData> doctorList = <DoctorOnlineListData>[
    DoctorOnlineListData(
      imagePath: 'https://firebasestorage.googleapis.com/v0/b/mordekui.appspot.com/o/01.jpg?alt=media',
      titleTxt: 'พญ.สมใจ รักเด็ก',
      subTxt: 'รพ. XXXX ',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perTime: 180,
      tag : 'ทั่วไป|หู|คอ',
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    DoctorOnlineListData(
      imagePath: 'https://firebasestorage.googleapis.com/v0/b/mordekui.appspot.com/o/02.jpg?alt=media',
      titleTxt: 'พญ. เสมอ ใจดี',
      subTxt: 'รพ. XXXX ',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perTime: 200,
      tag : 'ทั่วไป|หู|คอ',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    DoctorOnlineListData(
      imagePath: 'https://firebasestorage.googleapis.com/v0/b/mordekui.appspot.com/o/03.jpg?alt=media',
      titleTxt: 'พญ. สมร เอื้อเฟื้อ',
      subTxt: 'รพ. XXXX ',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perTime: 60,
      tag : 'ทั่วไป|หู|คอ',
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    DoctorOnlineListData(
      imagePath: 'https://firebasestorage.googleapis.com/v0/b/mordekui.appspot.com/o/04.jpg?alt=media',
      titleTxt: 'นพ. บานเย็น สบายดี',
      subTxt: 'รพ. XXXX ',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perTime: 170,
      tag : 'ทั่วไป|หู|คอ',
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    DoctorOnlineListData(
      imagePath: 'https://firebasestorage.googleapis.com/v0/b/mordekui.appspot.com/o/05.jpg?alt=media',
      titleTxt: 'นพ. สมหมาย ใจสะอาด',
      subTxt: 'รพ. XXXX ',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perTime: 200,
      tag : 'ทั่วไป|หู|คอ',
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
  ];
}
