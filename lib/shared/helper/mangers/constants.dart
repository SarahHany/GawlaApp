class ConstantsManger {
  static const String ON_BOARDING = 'onBoarding';
  static const String IsRemeberUser = 'rember';
  static const String TOKEN = 'TOKEN';
  static const String DEFULT = 'Default';
  static const String ON_BOARDINGText1 = 'Forget about the traditional tour guiding ways';
  static const String ON_BOARDINGText2 = 'Spice Your career with the new genration of guiding application " Gawlah "';
  static const String ON_BOARDINGText3 = 'A chance to have your mark on the tourism experience on people from all around the world';


  static const String BASE_URL = 'http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/';

  //datebase
  static const String DATABASE_NAME = 'Gawlah.db';
  static const int DATABASE_VERSION = 1;
  static const String TABLE_NAME = 'tours';
  static const String CREATE_QUERY = 'CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY, idTour TEXT)';
  static const String GET_ALL_TOOURS = 'SELECT * FROM $TABLE_NAME';

  static const String PYRAMIDES = 'https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/py_map.png?alt=media&token=0635c8f3-3ef1-4aef-9d0f-9d9625be41ad';
  static const String NILE = 'https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/nile_map.png?alt=media&token=6ac5960b-3978-478d-abb2-b411e30824b1';
  static const String SIWA = 'https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/siwa_map.png?alt=media&token=a60d55b1-bbf8-47f2-97da-fddafdf01c8f';
  static const String OPERA = 'https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/opra_map.png?alt=media&token=1b046389-08f2-426a-b7db-f88d30aa45ec';
  static const String KHAN = 'https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/khan_map.png?alt=media&token=b1d3b69c-152c-497a-8d97-e8c60d33d712';




  static const String PyDesc = 'A pyramid is a structure whose outer surfaces are triangular and converge to a single step at the top, making the shape roughly a pyramid in the geometric sense. The base of a pyramid can be trilateral, quadrilateral, or of any polygon shape. As such, a pyramid has at least three outer triangular surfaces (at least four faces including the base). The square pyramid, with a square base and four triangular outer surfaces, is a common version.A pyramids design, with the majority of the weight closer to the ground, and with the pyramidion at the apex, means that less material higher up on the pyramid will be pushing down from above. This distribution of weight allowed early civilizations to create stable monumental structures.';

  static const String NiLeDesc = "The Nile[b] is a major north-flowing river in northeastern Africa. It flows into the Mediterranean Sea. The longest river in Africa, it has historically been considered the longest river in the world, though this has been contested by research suggesting that the Amazon River is slightly longer."
      "Of the world's major rivers, the Nile is one of the smallest, as measured by annual flow in cubic metres of water About 6,650 km (4,130 mi)[a] long, its drainage basin covers eleven countries: the Democratic Republic of the Congo, Tanzania, Burundi, Rwanda, Uganda, Kenya, Ethiopia, Eritrea, South Sudan, Republic of the Sudan, and Egypt. In particular, the Nile is the primary water source of Egypt, Sudan and South Sudan. Additionally, the Nile is an important economic river, supporting agriculture and fishing";

  static const String SiwaDesc = "The Siwa Oasis is an urban oasis in Egypt between the Qattara Depression and the Great Sand Sea in the Western Desert, 50 km (30 mi) east of the Libyan border, and 560 km (348 mi) from Cairo. About 80 km (50 mi) in length and 20 km (12 mi) wide,Siwa Oasis is one of Egypt's most isolated settlements with about 33,000 people, mostly Berbers, who developed a unique and isolated desert culture and a language called Siwi; they are also fluent in the Egyptian dialect of Arabic which is called Masry meaning Egyptian.";

  static const String OperaDesc = "The opera house was inaugurated on 10 October 1988. The funds for the complex were a gift from the nation of Japan to Egypt as a result of President Hosni Mubarak's visit to Japan in April 1983. Construction began in May 1985 and lasted for three yearsIn October 1988, President Mubarak and Prince Tomohito of Mikasa, the younger brother of the Japanese Emperor, inaugurated the National Cultural Centre Cairo Opera House. It was the first time for Japan to stage a Kabuki show, a traditional popular drama with singing and dancing, in Africa or the Arab World.In recognition of the Cairo Opera House, the London Royal Philharmonic Orchestra chose it as a venue for their first performance in the Middle East and Africa in January 2007. The Arabic Oud House was created in its premises before moving to a building in the old town";

  static const String KhanKalilDesc = "Khan el-Khalili is a famous bazaar and souq (or souk) in the historic center of Cairo, Egypt. Established as a center of trade in the Mamluk era and named for one of its several historic caravanserais, the bazaar district has since become one of Cairo's main attractions for tourists and Egyptians alike. It is also home to many Egyptian artisans and workshops involved in the production of traditional crafts and souvenirs. The name Khan el-Khalili historically referred to a single building in the area; today it refers to the entire shopping district";

}
