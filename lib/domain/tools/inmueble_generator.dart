// @dart = 2.9
import 'dart:math';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:geocoder/geocoder.dart' as geo;
import 'package:trobify/domain/entities/user.dart';

void inmuebleGenerator() async {
  var _viviendaPhotosURL = [
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-jean-van-der-meulen-1454806.jpg?alt=media&token=032616fc-daa8-41e6-a88c-7ca5838cb3ae',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/z.jpg?alt=media&token=9e0c137d-e117-40ae-bbc1-ffb72780715a',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/y.jpg?alt=media&token=ca9273d4-4ae4-4faf-b6d4-1f25aeb527e2',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/w.jpg?alt=media&token=41ac7417-7d2f-4f2f-b7c7-2c9c89b3b19e',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/v.jpg?alt=media&token=80d73e6e-7949-4faa-a9d6-f81ca234210b',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/u.jpg?alt=media&token=8c136e02-4c00-4114-a788-7a8460275361',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/t.jpg?alt=media&token=0e349673-8444-4e52-9ed8-c975a7a6b331',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/s.jpg?alt=media&token=7a4e2ec9-89de-490e-9ed7-5c7a0afdbc11',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/q.jpg?alt=media&token=19011dfc-7ef2-40b0-b4b6-2cabf936af12',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-vecislavas-popa-813691.jpg?alt=media&token=cbed85bf-204f-483d-831d-ef801a963790',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-terje-sollie-298842.jpg?alt=media&token=e4fcb297-c78e-4122-969a-d0a812e830f9',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-433200.jpg?alt=media&token=eae53f9d-ecf6-4f5b-9513-ce58c0ba6cd1',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-280471.jpg?alt=media&token=02f730dc-0e42-4670-b018-9cbc2f63e7b5',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-279746.jpg?alt=media&token=db1071ab-69b4-4747-9a92-3e25c9965860',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-276534.jpg?alt=media&token=7291f9f1-04c1-4194-bab4-fa89823b6659',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-271743.jpg?alt=media&token=926ce69f-5864-4104-a697-75d1064b410e',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-164595.jpg?alt=media&token=ff3514c3-a9a4-499e-9aba-2e69012af8b6',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-martin-p%C3%A9chy-1866149.jpg?alt=media&token=cfebe4f2-669e-4336-a824-d1b5893a587c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-m%26w-studios-90319.jpg?alt=media&token=38232599-4400-411d-98eb-dff50ce36370',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-m%26w-studios-90317.jpg?alt=media&token=7ed6787e-e66a-4df8-ba27-3fe241cbb6e0',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-lisa-1444424.jpg?alt=media&token=9caec711-53af-4b6b-9f72-4d4735840679',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-karl-solano-2883049.jpg?alt=media&token=116af026-36ff-4c6c-9a15-db558790caa4',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-kaboompics-com-6412.jpg?alt=media&token=aaa5e0fc-e0d8-47b5-8130-f6c83af8e2e8',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-jean-van-der-meulen-1454806.jpg?alt=media&token=032616fc-daa8-41e6-a88c-7ca5838cb3ae',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-ingo-joseph-609768.jpg?alt=media&token=6c64803c-4843-4119-bb71-9954c63543db',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-huseyn-kamaladdin-667838.jpg?alt=media&token=e4a22e15-6f04-4979-9837-aaa462507639',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-home-decor-interiors-1827054.jpg?alt=media&token=2370ef7c-9922-4cf2-a198-13a36d1df6c0',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-format-1029138.jpg?alt=media&token=74bbde8b-8097-472f-8147-4bd47f9d1aef',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-dmitry-zvolskiy-2062431.jpg?alt=media&token=7a6159d1-f12a-48ce-924c-41948782871c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-dmitry-zvolskiy-1879066.jpg?alt=media&token=a940e4fb-24e2-4113-bff7-fb02db1accdb',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-designecologist-975630.jpg?alt=media&token=7dce855e-2660-4082-b13f-4aa610fb5e8d',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-designecologist-1248582.jpg?alt=media&token=dd33d0dd-88c1-4d9e-a37f-82401778ec71',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-cats-coming-707581.jpg?alt=media&token=0ef42c36-21e6-4066-b492-971667c5732a',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-carlos-diaz-709767.jpg?alt=media&token=c5cb7306-0b10-48a1-8320-ccbbe77bae50',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-atbo-245240.jpg?alt=media&token=e7a74c8b-17b4-4504-b241-9bdbcca3bb82',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/p.jpg?alt=media&token=44d80f29-88de-41ff-bcef-20b6d59555f6',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/m.jpg?alt=media&token=a2ad8233-d222-4c73-899a-4c16037238f3',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/l.jpg?alt=media&token=d3588927-6361-477b-b3f4-60c875319d1a',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/k.jpg?alt=media&token=87cc8aef-9b4b-4ffd-9fef-d76ecc95a282',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/j.jpeg?alt=media&token=dc6d410b-cc95-46c1-975b-c2f8c10e3177',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/i.jpg?alt=media&token=6a81637a-09de-4f7b-9db5-58427c387310',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/h.jpg?alt=media&token=92395cab-cece-434c-be1b-cf6406ef1953',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/g.jpg?alt=media&token=25a21ffd-9f9e-4d37-bb03-ab464535a630',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/f.jpg?alt=media&token=086e6634-b011-4d62-b2c2-b982db33c3c8',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/d.jpg?alt=media&token=4ad92f80-8df8-41f3-860f-d80444512425',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/c.jpg?alt=media&token=5c031c2a-df20-4582-9b64-0e0378ac21c4',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/b.jpg?alt=media&token=f6a488b6-95c6-48b5-8007-baecb5762cda',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/a.jpg?alt=media&token=f1091e15-b7ba-4f67-bf2f-e950bbea0462',
  ];
  var _trasteroPhotosURL = [
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/%C3%ADndice.jpg?alt=media&token=eeb6b8cf-939d-4dd4-a8b6-ca7c672cad72',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/storegae-rooms.jpg?alt=media&token=25981a28-d47c-4f70-8664-0eafb513a6d9',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/storage-rooms.jpg?alt=media&token=4ebc4831-461d-4133-8130-113bd693987c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/images.jpg?alt=media&token=f464afd5-9792-41d7-b501-c08dc04afeed',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/Cubicle-dwn-12sqft-20sqft-300x400.jpg?alt=media&token=ef6b1c67-564c-4f2e-abd7-464f30068386',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/3-units_620x413.jpg?alt=media&token=26bba700-e6c4-4625-b93a-7a9b83bc470a',
  ];
  var _parcelaPhotosURL = [
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/plano-estudio-parcela.jpg?alt=media&token=afa3f994-a1d3-4737-b390-e5235d5f4193',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-tom-fisk-2464069.jpg?alt=media&token=a05fc597-e065-4060-91fc-dfe166642576',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-tom-fisk-1573885.jpg?alt=media&token=ee784384-c536-4452-9285-16d469f7cd0d',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pok-rie-4861031.jpg?alt=media&token=4069bf94-1100-4046-8aa5-360d8e14a546',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-289334.jpg?alt=media&token=0dc7fd8b-90f8-4fa1-ba36-ac84265889ea',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-marcin-jozwiak-2845219.jpg?alt=media&token=156d0746-fb12-4c37-b158-bc0c7c393ce8',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-marcin-jozwiak-2843027.jpg?alt=media&token=aae9345c-4961-4384-b5df-991930cb8de9',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-magda-ehlers-636342.jpg?alt=media&token=7a77e237-3701-4731-ad4e-5d5aa10ed38a',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-johannes-str%C3%B6tker-4303919.jpg?alt=media&token=457f5c0d-4dfa-4f50-8b93-04537f9191cb',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-jahoo-clouseau-575576.jpg?alt=media&token=fad442f0-e9ba-4a1c-9626-20d40bdd5286',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/VEr5sSC.jpg?alt=media&token=ad0e611c-2a3a-43fd-974e-b85841e8788c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/Parcela.jpg?alt=media&token=955e8a3c-988c-487a-a916-b55a95aa43c7',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/Imagen9-1.jpg?alt=media&token=8119a330-a339-4f8f-aae3-51c8b4b7c614',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/Figura-1-Parcela-de-estudio-y-estado-fenologico-de-las-plantas-de-girasol-y-de-las-malas.png?alt=media&token=091c9c86-ab28-4cfe-ab74-729e4c482377',
  ];
  var _localPhotosURL = [
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-wilson-vitorino-2191606.jpg?alt=media&token=209f5ed1-3c96-42aa-bf40-ecaf94dbdfb5',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-tranmautritam-225502.jpg?alt=media&token=bfc1c805-51c0-4fb0-bec5-9092cc641e9c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-280471.jpg?alt=media&token=02f730dc-0e42-4670-b018-9cbc2f63e7b5',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-164938.jpg?alt=media&token=4cd1c052-17e0-44c3-88fc-4bc67948ee29',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-159839.jpg?alt=media&token=c56a7ec2-28ed-4bb0-b187-e8490d007221',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-karl-solano-2883049.jpg?alt=media&token=116af026-36ff-4c6c-9a15-db558790caa4',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-ingo-joseph-609768.jpg?alt=media&token=6c64803c-4843-4119-bb71-9954c63543db',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-huseyn-kamaladdin-667838.jpg?alt=media&token=e4a22e15-6f04-4979-9837-aaa462507639',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-format-1029138.jpg?alt=media&token=74bbde8b-8097-472f-8147-4bd47f9d1aef',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-daria-shevtsova-3673755.jpg?alt=media&token=792e32ab-8e26-4158-ac90-8108f2717164',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-alexander-dummer-134469.jpg?alt=media&token=3ed5b1eb-7870-45ec-bb9a-51fdee30b820',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/g.jpg?alt=media&token=25a21ffd-9f9e-4d37-bb03-ab464535a630',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-416320.jpg?alt=media&token=aa4b6cbd-d8cb-459f-8f59-7b29fbaa7fd7',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-221537.jpg?alt=media&token=06538102-5515-41a9-b47e-1735a8bb75c3',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-159839.jpg?alt=media&token=c56a7ec2-28ed-4bb0-b187-e8490d007221',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-marc-mueller-380769.jpg?alt=media&token=e5e73a8a-46a3-4c2d-9bb6-fef1c2495254',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-karl-solano-2883049.jpg?alt=media&token=116af026-36ff-4c6c-9a15-db558790caa4',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-ingo-joseph-609768.jpg?alt=media&token=6c64803c-4843-4119-bb71-9954c63543db',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-huseyn-kamaladdin-667838.jpg?alt=media&token=e4a22e15-6f04-4979-9837-aaa462507639',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-cadeau-maestro-1170412.jpg?alt=media&token=b913a8fd-3a50-4686-b49c-64d46d48cd2b',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-wilson-vitorino-2191606.jpg?alt=media&token=209f5ed1-3c96-42aa-bf40-ecaf94dbdfb5',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-juan-pablo-serrano-arenas-1065650.jpg?alt=media&token=ccdac48d-5c86-42c0-bd3c-acaea2801a8c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-emre-can-2454640.jpg?alt=media&token=6c63a62c-4c86-4890-b6c0-d9f0ab7ea4f3',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-ekrulila-7345374.jpg?alt=media&token=d2ea0b15-0325-4360-9950-f4e7dbe70480'
  ];
  var _habPhotosURL = [
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-jean-van-der-meulen-1454806.jpg?alt=media&token=032616fc-daa8-41e6-a88c-7ca5838cb3ae',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/s.jpg?alt=media&token=7a4e2ec9-89de-490e-9ed7-5c7a0afdbc11',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-tranmautritam-225502.jpg?alt=media&token=bfc1c805-51c0-4fb0-bec5-9092cc641e9c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-280471.jpg?alt=media&token=02f730dc-0e42-4670-b018-9cbc2f63e7b5',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-279746.jpg?alt=media&token=db1071ab-69b4-4747-9a92-3e25c9965860',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-271743.jpg?alt=media&token=926ce69f-5864-4104-a697-75d1064b410e',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-164595.jpg?alt=media&token=ff3514c3-a9a4-499e-9aba-2e69012af8b6',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-pixabay-159839.jpg?alt=media&token=c56a7ec2-28ed-4bb0-b187-e8490d007221',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-patryk-kamenczak-775219.jpg?alt=media&token=252952ed-3de5-48b3-8508-b0c68928ed1d',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-m%26w-studios-90319.jpg?alt=media&token=38232599-4400-411d-98eb-dff50ce36370',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-m%26w-studios-90317.jpg?alt=media&token=7ed6787e-e66a-4df8-ba27-3fe241cbb6e0',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-dmitry-zvolskiy-2062431.jpg?alt=media&token=7a6159d1-f12a-48ce-924c-41948782871c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/g.jpg?alt=media&token=25a21ffd-9f9e-4d37-bb03-ab464535a630',
  ];
  var _garajePhotosURL = [
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-vitaly-vlasov-1383675.jpg?alt=media&token=2430cfdd-93b0-4c45-bfe1-4fe8e8998673',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-julio-nery-1687105.jpg?alt=media&token=28f76a03-df14-490e-9eb8-826dc9ac241f',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-jose-espinal-1000633.jpg?alt=media&token=a0e33e8c-557d-409a-88bd-edb204d8049c',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-francis-desjardins-3095713.jpg?alt=media&token=e97f4396-8638-4aa7-a563-fb3e4fdd01d6',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-emre-can-2454640.jpg?alt=media&token=6c63a62c-4c86-4890-b6c0-d9f0ab7ea4f3',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-carl-newton-2280148.jpg?alt=media&token=8d8cef76-3eda-4e31-89ce-d08d2697dedf',
    'https://firebasestorage.googleapis.com/v0/b/trobify.appspot.com/o/pexels-brett-sayles-1756957.jpg?alt=media&token=ff2e2c77-ff1b-41de-a091-c22a18b4b369',
  ];

  var _minLat = 45.556599;
  var _maxLat = 45.379518;
  var _minLong = 9.032941;
  var _maxLong = 9.332800;
  var _tipoInmuebleOptions = [
    'Vivienda',
    'Trastero',
    'Parcela',
    'Habitación',
    'Local',
    'Garaje',
  ];
  var _tipoOperacionOptions = ['Alquiler', 'Venta'];
  var _randomizer = Random();
  var _tipoFotos = <String, List<String>>{
    'Vivienda': _viviendaPhotosURL,
    'Trastero': _trasteroPhotosURL,
    'Parcela': _parcelaPhotosURL,
    'Habitación': _habPhotosURL,
    'Local': _localPhotosURL,
    'Garaje': _garajePhotosURL
  };

  double generarNumero(num a, num b) => _randomizer.nextDouble() * (a - b) + b;
  var _serviciosOptions = ['ascensor', 'parking', 'patio', 'terraza', 'conserje', 'gym', 'piscina'];
  var _fechaMin = DateTime(2021, 5, 13, 0, 0, 0);
  var _fechaMax = DateTime(2023, 1, 1, 0, 0, 0);
  var _difEnDias = _fechaMax.difference(_fechaMin).inDays;

  for (var i = 0; i < 50; i++) {
    var _lat = generarNumero(_minLat, _maxLat);
    var _long = generarNumero(_minLong, _maxLong);
    var _coords = geo.Coordinates(_lat, _long);
    var _tipoInmuebleSelector = _randomizer.nextInt(100);
    var _tipoInmueble = _tipoInmuebleOptions[0];
    var _tipoOperacion = _tipoOperacionOptions[0];
    if (_tipoInmuebleSelector < 55) {
      _tipoInmueble = _tipoInmuebleOptions[0]; //Vivienda
    } else if (_tipoInmuebleSelector < 65) {
      _tipoInmueble = _tipoInmuebleOptions[3]; //Hab
    } else if (_tipoInmuebleSelector < 80) {
      _tipoInmueble = _tipoInmuebleOptions[4]; //Local
    } else if (_tipoInmuebleSelector < 90) {
      _tipoInmueble = _tipoInmuebleOptions[1]; //trastero
    } else if (_tipoInmuebleSelector < 95) {
      _tipoInmueble = _tipoInmuebleOptions[2]; //parcelo
    } else {
      _tipoInmueble = _tipoInmuebleOptions[5]; //garaje
    }
    if (_randomizer.nextInt(100) >= 70) {
      _tipoOperacion = _tipoOperacionOptions[1];
    }
    var _nFotos = (_randomizer.nextInt(1000000) / 200000).round();
    var _fotos = <String>[];
    var _fotoAdd = _tipoFotos[_tipoInmueble];
    if (_nFotos == 0) {
      _fotos = [
        null,
      ];
    } else {
      for (var j = 0; j < _nFotos; j++) {
        var _foto = _fotoAdd[_randomizer.nextInt(_fotoAdd.length)];
        while (_fotos.contains(_foto)) {
          _foto = _fotoAdd[_randomizer.nextInt(_fotoAdd.length)];
        }
        _fotos.add(_foto);
      }
    }
    var _servicios = <String>[];
    var addresses = await geo.Geocoder.local.findAddressesFromCoordinates(_coords);
    var _locInmueble = addresses.first;
    while (_locInmueble.locality == null || _locInmueble.addressLine.contains('Unnamed')) {
      addresses = await geo.Geocoder.local.findAddressesFromCoordinates(_coords);
      _locInmueble = addresses.first;
    }
    var _split = addresses.first.addressLine.split(',');
    var _direccion = _split[0] + _split[1];
    var _superficie = 0.0;
    var _nDormitorios = 0;
    var _nBanyos = 0;
    var _precio = 0.0;

    switch (_tipoInmueble) {
      case 'Vivienda':
        {
          if (_randomizer.nextInt(100) < 70) {
            //subtipo Casa
            _superficie = generarNumero(30, 200).truncateToDouble();
            if (_superficie < 50) {
              _nDormitorios = 1;
            } else if (_superficie < 65) {
              _nDormitorios = 2;
            } else if (_superficie < 90) {
              _nDormitorios = 3;
            } else if (_superficie < 120) {
              _nDormitorios = 4;
            } else {
              _nDormitorios = 5;
            }
            _nBanyos = (_nDormitorios / 2).truncate() == 0 ? 1 : (_nDormitorios / 2).truncate();
          } else {
            _superficie = generarNumero(100, 500).truncateToDouble();
            if (_superficie < 150) {
              _nDormitorios = 3;
            } else if (_superficie < 300) {
              _nDormitorios = 4;
            } else if (_superficie < 300) {
              _nDormitorios = 5;
            } else {
              _nDormitorios = 6;
            }
            _nBanyos = (_nDormitorios / 2).truncate();
          }
          if (_tipoOperacion == 'Alquiler') {
            _precio = (_superficie * generarNumero(6, 9) / 10).truncateToDouble() * 10;
          } else {
            _precio = (_superficie * generarNumero(1100, 1300) / 100).truncateToDouble() * 100;
          }
          for (var k = _randomizer.nextInt(5); k < 5; k++) {
            var _servicio = _serviciosOptions[_randomizer.nextInt(_serviciosOptions.length)];
            while (_servicios.contains(_servicio)) {
              _servicio = _serviciosOptions[_randomizer.nextInt(_serviciosOptions.length)];
            }
            _servicios.add(_servicio);
          }
        }
        break; //0
      case 'Trastero':
        {
          _superficie = generarNumero(2, 15).truncateToDouble();
          _nDormitorios = 0;
          _nBanyos = 0;
          if (_tipoOperacion == 'Alquiler') {
            _precio = (_superficie * generarNumero(20, 40) / 10).truncateToDouble() * 10;
          } else {
            _precio = (_superficie * generarNumero(700, 2000) / 100).truncateToDouble() * 100;
          }
        }
        break; //1
      case 'Parcela':
        {
          _superficie = generarNumero(800, 3000).truncateToDouble();
          _nDormitorios = 0;
          _nBanyos = 0;
          if (_tipoOperacion == 'Alquiler') {
            _precio = (_superficie * generarNumero(0.15, 0.3) / 10).truncateToDouble() * 10;
          } else {
            _precio = (_superficie * generarNumero(0.5, 4) / 100).truncateToDouble() * 100;
          }
        }
        break; //2 7-15
      case 'Habitación':
        {
          _nDormitorios = 1;
          _superficie = generarNumero(7, 15).truncateToDouble();
          _nBanyos = 1;
          _tipoOperacion = 'Alquiler';
          _precio = (generarNumero(150, 300).truncateToDouble() / 10) * 10;
          for (var k = _randomizer.nextInt(5); k < 5; k++) {
            var _servicio = _serviciosOptions[_randomizer.nextInt(_serviciosOptions.length)];
            while (_servicios.contains(_servicio)) {
              _servicio = _serviciosOptions[_randomizer.nextInt(_serviciosOptions.length)];
            }
            _servicios.add(_servicio);
          }
        }
        break; //3 7-15
      case 'Local':
        {
          _superficie = generarNumero(40, 100).truncateToDouble();
          _nDormitorios = 0;
          _nBanyos = 1;
          if (_tipoOperacion == 'Alquiler') {
            _precio = (_superficie * generarNumero(10, 40) / 10).truncateToDouble() * 10;
          } else {
            _precio = (_superficie * generarNumero(600, 1300) / 100).truncateToDouble() * 100;
          }
        }
        break; //5
      case 'Garaje':
        {
          _superficie = generarNumero(5, 40).truncateToDouble();
          _nDormitorios = 0;
          _nBanyos = 0;
          if (_tipoOperacion == 'Alquiler') {
            _precio = (generarNumero(30, 200) / 10).truncateToDouble() * 10;
          } else {
            _precio = (generarNumero(3000, 10000) / 100).truncateToDouble() * 100;
          }
        }
        break;
      default:
        {}
        break;
    }
    var _descripcion = _tipoInmueble.toString() + ' para ' + _tipoOperacion + ' en ' + _locInmueble.locality.toString();
    if (_servicios.isNotEmpty) {
      _descripcion += ' con ';
      for (var m = _servicios.length - 1; m > -1; m--) {
        if (m > 1) {
          _descripcion += _servicios[m] + ', ';
        } else if (m == 1) {
          _descripcion += _servicios[m] + ' y ';
        } else {
          _descripcion += _servicios[m];
        }
      }
    }
    var userData = User();
    Inmueble.insertInmueble(Inmueble(
        inmuebleID: '',
        ubicacion: GeoFirePoint(_lat, _long),
        ciudad: _locInmueble.locality,
        codigoPostal: int.parse(_locInmueble.postalCode),
        descripcion: _descripcion,
        direccion: _direccion,
        disponibilidad: _fechaMin.add(Duration(days: _randomizer.nextInt(_difEnDias))),
        formatoPrecio: _tipoOperacion == 'Alquiler' ? 30 : 99,
        fotos: _fotos,
        servicios: _servicios,
        superficie: _superficie,
        precio: _precio,
        idPropietario: userData.getID(),
        nBanyos: _nBanyos,
        nDormitorios: _nDormitorios,
        tipoOperacion: _tipoOperacion,
        tipoInmueble: _tipoInmueble));
  }
}
