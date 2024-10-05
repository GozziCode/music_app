import 'package:get/get.dart';

class AllSongsViewModel extends GetxController {
  final allList = [
    {
      "id": "csaEsVWV",
      "name": "Kun Faaya Kun",
      "type": "song",
      "year": "2011",
      "releaseDate": null,
      "duration": 473,
      "label": "T-Series",
      "explicitContent": false,
      "playCount": 40280125,
      "language": "hindi",
      "hasLyrics": true,
      "lyricsId": null,
      "url": "https://www.jiosaavn.com/song/kun-faaya-kun/ExsKdAdmYGU",
      "copyright": "©  2011 T-Series",
      "album": "Rockstar",
      "primaryArtists": "A.R. Rahman",
      "primaryArtistsId": "456269",
      "image":
          "https://c.saavncdn.com/446/Kun-Faya-Kun-Bengali-2023-20230621124938-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/446/cff6a721f2dd9651f8054d46b4d0a50e_160.mp4"
    },
    {
      "id": "vQDUtZvr",
      "name": "Kun Faya Kun",
      "type": "song",
      "year": "2021",
      "releaseDate": null,
      "duration": 298,
      "label": "Meem Production",
      "explicitContent": false,
      "playCount": 184,
      "language": "urdu",
      "hasLyrics": false,
      "lyricsId": null,
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/BjkvZABqQUE",
      "copyright": "(P) 2021 Smart Tech",
      "album": "Mujhe Bheek Mil Rahi Hai",
      "primaryArtists": "Faizan Raza Qadri",
      "primaryArtistsId": "889539",
      "image":
          "https://c.saavncdn.com/096/Mujhe-Bheek-Mil-Rahi-Hai-Urdu-2021-20210625181852-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/096/cd265aebfe541a3ebe130b6a2b6ffa0a_320.mp4"
    },
    {
      "id": "v6Q__0ud",
      "name": "Kun Faya Kun",
      "type": "song",
      "year": "2020",
      "releaseDate": null,
      "duration": 525,
      "label": "Zohaib Ashrafi",
      "explicitContent": false,
      "playCount": 110,
      "language": "urdu",
      "hasLyrics": false,
      "lyricsId": null,
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/Bl46bisAQlc",
      "copyright": "(P) 2022 Smart Tech",
      "album": "Tere Rang Rang, Vol. 106",
      "primaryArtists": "Zohaib Ashrafi",
      "primaryArtistsId": "1325393",
      "image":
          "https://c.saavncdn.com/955/Tere-Rang-Rang-Vol-106-Urdu-2020-20221206105208-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/955/7ca62ef4ab6b1904c9628cecbfb30d15_320.mp4"
    },
    {
      "id": "y2Rm0TgR",
      "name": "Kun Faya Kun",
      "type": "song",
      "year": "2024",
      "releaseDate": null,
      "duration": 273,
      "label": "Raza Productions",
      "explicitContent": false,
      "playCount": 2,
      "language": "urdu",
      "hasLyrics": false,
      "lyricsId": null,
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/CVo5XERkUGE",
      "copyright": "℗ 2024 Raza Productions",
      "album": "Kun Faya Kun",
      "primaryArtists": "Mohammed Asjad Raza Qadri",
      "primaryArtistsId": "18458713",
      "image":
          "https://c.saavncdn.com/881/Kun-Faya-Kun-Urdu-2024-20240205143751-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/881/9e88446665f07442710c3cee7ded6358_160.mp4"
    },
    {
      "id": "mMQuNTj8",
      "name": "Kun Faya Kun",
      "type": "song",
      "year": "2024",
      "releaseDate": null,
      "duration": 384,
      "label": "Jalabeeb Qadri",
      "explicitContent": false,
      "playCount": 25,
      "language": "urdu",
      "hasLyrics": false,
      "lyricsId": null,
      "url": "https://www.jiosaavn.com/song/kun-faya-kun/HSU6RDpkXQs",
      "copyright": "℗ 2024 Jalabeeb Qadri",
      "album": "Kun Faya Kun",
      "primaryArtists": "Hafiz Jalabeeb Qadri",
      "primaryArtistsId": "12653034",
      "image":
          "https://c.saavncdn.com/025/Kun-Faya-Kun-Urdu-2024-20240619040051-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/025/437d69c082f47a3a80359f574d0e112f_160.mp4"
    },
    {
      "id": "mvb3_elo",
      "name": "Kun Faya Kun (Hamd Medley)",
      "type": "song",
      "year": "2023",
      "releaseDate": null,
      "duration": 441,
      "label": "Mahmood R Q Production",
      "explicitContent": false,
      "playCount": 32,
      "language": "urdu",
      "hasLyrics": false,
      "lyricsId": null,
      "url":
          "https://www.jiosaavn.com/song/kun-faya-kun-hamd-medley/HR4JAitVW1w",
      "copyright": "℗ 2023 Mahmood R Q Production",
      "album": "Kun Faya Kun (Hamd Medley)",
      "primaryArtists": "Mahmood Raza Qadri",
      "primaryArtistsId": "7376430",
      "image":
          "https://c.saavncdn.com/059/Kun-Faya-Kun-Hamd-Medley-Urdu-2023-20230918165811-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/059/45b96337600dce00782d141adcef83e7_160.mp4"
    },
    {
      "id": "gpAIJb-z",
      "name": "Kun Faya Kun (From &quot;Rockstar&quot;)",
      "type": "song",
      "year": "2020",
      "releaseDate": null,
      "duration": 470,
      "label": "T-Series",
      "explicitContent": false,
      "playCount": 40256248,
      "language": "hindi",
      "hasLyrics": true,
      "lyricsId": null,
      "url":
          "https://www.jiosaavn.com/song/kun-faya-kun-from-rockstar/FxgqeD5SGkk",
      "copyright": "℗ 2020 Super Cassettes Industries Private Limited",
      "album": "Soulful Sufis",
      "primaryArtists": "A.R. Rahman",
      "primaryArtistsId": "456269",
      "image":
          "https://c.saavncdn.com/722/Soulful-Sufis-Hindi-2020-20200420124011-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/722/6e01c978f967fb36be416fb5cccea848_320.mp4"
    },
    {
      "id": "tHCiDwm6",
      "name": "Kun Faya Kun (From &quot;Rockstar&quot;)",
      "type": "song",
      "year": "2019",
      "releaseDate": null,
      "duration": 470,
      "label": "T-Series",
      "explicitContent": false,
      "playCount": 40256182,
      "language": "hindi",
      "hasLyrics": true,
      "lyricsId": null,
      "url":
          "https://www.jiosaavn.com/song/kun-faya-kun-from-rockstar/BCAoWDBHWgU",
      "copyright": "℗ 2019 Super Cassettes Industries Private Limited",
      "album": "Ar Rahman Musique",
      "primaryArtists": "A.R. Rahman",
      "primaryArtistsId": "456269",
      "image":
          "https://c.saavncdn.com/961/Ar-Rahman-Musique-Hindi-2019-20230803205937-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/961/b153c069808643f15765d08f661aa6ce_160.mp4"
    },
    {
      "id": "rvrE6f2J",
      "name": "Kun Faaya Kun",
      "type": "song",
      "year": "2020",
      "releaseDate": null,
      "duration": 471,
      "label": "T-Series",
      "explicitContent": false,
      "playCount": 40259186,
      "language": "hindi",
      "hasLyrics": true,
      "lyricsId": null,
      "url": "https://www.jiosaavn.com/song/kun-faaya-kun/Ah4ZdEJWBXk",
      "copyright": "© 2020 2013 Super Cassettes Industries Ltd",
      "album": "Best Of A.R. Rahman",
      "primaryArtists": "Javed Ali",
      "primaryArtistsId": "456269",
      "featuredArtists": "",
      "featuredArtistsId": "",
      "image":
          "https://c.saavncdn.com/172/Best-Of-A-R-Rahman-Hindi-2020-20200612145045-500x500.jpg",
      "downloadUrl":
          "https://aac.saavncdn.com/241/b65df4835e5b9e6d472f240ebba0cda5_320.mp4"
    }
  ].obs;
}
