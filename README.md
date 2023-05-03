# RickAndMortyApp

![RickAndMortyApp](https://user-images.githubusercontent.com/98701769/236050302-e5f87027-ec08-4e8c-afaa-b0d947489d48.jpg)

Kullanıcının Rick and Morty lokasyonlarını, lokasyondaki karakterleri listeleyebileceği ve karakterlerin detaylarını görüntüleyebileceği bir Swift dilinde yazılmış iOS uygulamadır.

Rick and Morty: Bir yetişkin animasyon televizyon dizisidir. Detay için: https://tr.wikipedia.org/wiki/Rick_and_Morty

Kullanıcı uygulamayı açtığında bir splash (karşılama) sayfasıyla karşılaşır. Sonrasında ana sayfa açılır. Kullanıcı bu sayfada Rick and Morty lokasyonlarını ve lokasyonlardaki karakterleri listeleyebilir. Ayrıca, karakterlerin detay sayfalarına da gidilebilmektedir.

Uygulama toplamda 3 sayfadan oluşmaktadır. Bu sayfalar; splash, ana sayfa ve karakter detay sayfalarıdır.

## Splash / Açılış Sayfası
Bu sayfa sadece açılışta gösterilir. Sayfada bir karşılama metni bulunmaktadır. Kullanıcı uygulamayı ilk kez açtığında “Welcome!” yazmaktadır. Sonraki açılışlarda “Hello!” yazmaktadır.

## Ana Sayfa
Sayfa; başlık/logo, kayan yatay liste ve dikey listeden oluşmaktadır.

- Kayan Yatay Liste
  
  + Yatay listede Rick and Morty lokasyonları bulunmaktadır.
  + İçerik buradan çekilmektedir: https://rickandmortyapi.com/documentation/#location-schema
  + Seçili lokasyon ile seçili olmayan lokasyonların tasarımları farklıdır.

- Dikey Liste

  + Yatay listeden çekilen lokasyona ait karakterler listelenmektedir.
  + Lokasyon cevabında karakterlere (residents) ait url’ler gelmektedir. Bu url’lerdeki id’ler ayıklanarak bu kaynaktan karakter detayları çekilmektedir. Kaynak: https:// rickandmortyapi.com/documentation/#get-multiple-characters
  + Item tasarımları listenen karakterlerin cinsiyetlerine göre farklılık göstermektedir. Male, female, genderless veya unknown.
  
## Detay Sayfası
Ana sayfadaki dikey listeden item’a tıklandığında bu sayfa açılmaktadır.
