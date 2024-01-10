
# matchaapplication
## Terjawab 

## list of todo doubts and question
1. rapihin applikasi (error message ketika ada field yang kosong padahal wajib, adjustment tampilan agak lebih mendekati dengan figma)
2. apakah akan ada attribute "liked stuffs yang nyangkut di tiap user nya"
7. kayaknya untuk request access harus dibikin jadi 2 entry point (both login dan register)
10. kalau network error gimana handle nya? apakah bisa ngecek profile tapi gk bisa access kemana2 atau otomatis lempar ke halaman error nya
11. cek permission buat gallery/camera buat photo profile
14. jika belum ada attribute maka akan ada notification untuk lengkapin profile nya, kalau di halaman match di kosongin bener2 di kosongin
15. perlu menjamin format penyimpanan nomor di hp sama semua e.g. 628xxxxxxxxxx
16. cara handle orang yang gk punya temen sama sekali?
17. perlu bikin mekanisme untuk nahan contact list yang ada di hp tapi tidak ada di system
18. perlu bikin mekanisme untuk recheck hal diatas HANYA untuk yang belum ada di contact list user nya
19. di dashboard notice 2, jika pencet skip, maka di chat list user yang terakhir me-like match tersebut akan ada timer untuk match tersebut(24jam) jika tidak chat sampe timer habis maka match akan hangus
20. 

### Table of contents
- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [How to format your code?](#how-you-can-do-code-formatting)
- [How you can improve code readability?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Figma design guidelines for better UI accuracy

Read our guidelines to increase the accuracy of design-to-code conversion by optimizing Figma designs.
https://docs.dhiwise.com/docs/Designguidelines/intro

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes                  
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient               - It contains API calling methods 
    │   ├── models                  - It contains request/response models 
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

### Support

If you have any problems or questions, go to our Discord channel, where we will help you as quickly as possible: https://discord.com/invite/rFMnCG5MZ7
