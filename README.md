# matchaapplication
## Terjawab 

## list of todo doubts and question
1. chat notification

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