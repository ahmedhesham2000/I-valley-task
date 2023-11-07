class CarData {
  int? advertismentID;
  double? price;
  dynamic count;
  dynamic carModel;
  DateTime? createdDate;
  DateTime? lastModifiedDate;
  dynamic isDeleted;
  int? advertTypeID;
  int? carBrandID;
  int? carTypeID;
  int? exhibitionProfileID;
  String? note;
  String? MainTitle;
  String? model;
  int? advertCityID;
  int? transmissionTypeId;
  int? categoryTypeId;
  int? colorId;
  int? whatsappCounter;
  int? callCounter;
  String? description;
  String? keyWords;
  bool? isOnline;
  bool? isFinance;
  int? numberOfCars;
  double? registrationAmont;
  dynamic agencyWarranty;
  bool? isYoutube;
  String? youtubeURL;
  String? youtubeImg;
  dynamic place;
  double? kilometers;
  dynamic gasType;
  bool? isPriceRaise;
  String? mainImagePath;
  String? smallImagePath;
  String? brandName;
  String? typeName;
  String? logoPath;
  String? transmissionTypeName;
  String? color;
  String? categoryType;
  String? city;
  String? cityName;
  String? rate;
  String? advertTypeName;
  String? hours;
  int? minutes;
  int? liked;
  String? providerFullName;
  String? providerMobile;
  String? providerOtherPhone;
  String? providerEmail;
  String? exhibitionLogo;
  String? commercialRegister;

  CarData.fromjson(json) {
    //create from all data
    advertismentID = json['AdvertismentID'];
    price = double.parse(json['Price'].toString());
    count = json['Count'];
    carModel = json['CarModel'];
    createdDate = DateTime.parse(json['CreatedDate']);
    lastModifiedDate = DateTime.parse(json['LastModifiedDate']);
    isDeleted = json['IsDeleted'];
    advertTypeID = json['AdvertTypeID'];
    carBrandID = json['CarBrandID'];
    carTypeID = json['CarTypeID'];
    exhibitionProfileID = json['ExhibitionProfileID'];
    note = json['Note'];
    MainTitle = json['MainTitle'];
    model = json['Model'];
    advertCityID = json['AdvertCityID'];
    transmissionTypeId = json['TransmissionTypeId'];
    categoryTypeId = json['CategoryTypeId'];
    colorId = json['ColorId'];
    whatsappCounter = json['WhatsappCounter'];
    callCounter = json['CallCounter'];
    description = json['Description'];
    keyWords = json['KeyWords'];
    isOnline = json['IsOnline'];
    isFinance = json['IsFinance'];
    numberOfCars = json['NumberOfCars'];
    registrationAmont = json['RegistrationAmont'];
    agencyWarranty = json['AgencyWarranty'];
    isYoutube = json['IsYoutube'];
    youtubeURL = json['YoutubeURL'];
    youtubeImg = json['YoutubeImageURL'];
    place = json['Place'];
    kilometers = json['Kilometers'];
    gasType = json['GasType'];
    isPriceRaise = json['IsPriceRaise'];
    mainImagePath = json['MainImagePath'];
    smallImagePath = json['SmallImagePath'];
    brandName = json['BrandName'];
    typeName = json['TypeName'];
    logoPath = json['LogoPath'];
    transmissionTypeName = json['TransmissionTypeName'];
    color = json['Color'];
    categoryType = json['CategoryType'];
    city = json['City'];
    cityName = json['CityName'];
    rate = json['Rate'];
    advertTypeName = json['AdvertTypeName'];
    hours = hoursDaysMonthsAgo(json['Hours']);
    minutes = json['Minutes'];
    liked = json['Liked'];
    providerFullName = json['FullName'];
    providerMobile = json['Phone'];
    providerOtherPhone = json['OtherPhone'];
    providerEmail = json['Email'];
    exhibitionLogo = json['ExhibitionLogo'];
    commercialRegister = json['CommercialRegister'];
  }
  String hoursDaysMonthsAgo(int hours) {
    if (hours < 1) {
      return "الآن";
    } else if (hours < 24) {
      return " منذ$hours ساعه ";
    } else if (hours < 24 * 30) {
      int days = hours ~/ 24;
      return " منذ $days يوم ";
    } else {
      int months = hours ~/ (24 * 30);
      return " منذ $months شهر ";
    }
  }
}
