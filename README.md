# matchaapplication
## Terjawab 

## list of todo doubts and question
1. we need a privacy policy website

flutter pub cache repair
flutter pub get
flutter build apk --split-per-abi

### NOTES
untuk error screen, regardless permission, ketika app di boot dia nggak akan pindah ke error screen apapun.
app baru pindah ke error screen, ketika fitur yang bersangkutan akan di akses (onboarding, candidate match, change profile picture)
Untuk case app mengalami error network ketika berada di screen error gallery/contact, app akan memindahkan ke halaman error network, lalu error network screen tersebut ketika resolve akan pindah ke halaman user profile

### TROUBLE
Ternyata perlu cloud function biar push notification nya bisa jalan dan ternyata ini fungsi berbayar by firebase, dan jujur gw agak takut buat proceed.
form paling jelek dari notification nya adalah cuma bisa di foreground doang tapi kalau app nya di kill/keluar nggak bakal receive notification

### Future References
- https://medium.com/@duytq94/flutter-chat-app-extended-push-notification-messages-a26c669f4675
- 

### Release notes
- tutorial for signing the app https://medium.com/@DeyvissonDev/signing-flutter-apps-for-android-and-ios-the-easygoing-guide-dd9d0dc9f65c
- don't push the matcha.keystore to github but will be posted in discord chat

- to sign the apk to abb(application bundle)
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore matcha.keystore D:\project\Matcha\stateManagementTest\matchaapplication-v1.0.7-getx\build\app\outputs\bundle\release\app-release.aab matchaKey