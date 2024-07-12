const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendNotification = functions.firestore
  .document('chatMessage/{message}')
  .onCreate(async (snap, context) => {
    console.log('----------------start function--------------------');

    const doc = snap.data();
    console.log(doc);

    const chatRoomId = doc.chatRoomId;
    const chatMessage = doc.chatMessage;
    const senderPhoneNumber = doc.senderPhoneNumber;

    try {
      const chatRoomSnapshot = await admin.firestore().collection('chatRoom').doc(chatRoomId).get();

      if (!chatRoomSnapshot.exists) {
        console.log(`Chat room ${chatRoomId} not found.`);
        return null;
      }

      const chatRoomData = chatRoomSnapshot.data();
      const participantsNumber = chatRoomData.participantsNumber;

      let receiverPhoneNumber = '';

      for (const number of participantsNumber) {
        if (number !== senderPhoneNumber) {
          receiverPhoneNumber = number;
          break; // Assuming only one other participant should receive the message
        }
      }

      if (!receiverPhoneNumber) {
        console.log('Receiver phone number not found.');
        return null;
      }

      const senderSnapshot = await admin.firestore().collection('userData').where('userPhoneNumber', '==', senderPhoneNumber).get();

      if (senderSnapshot.empty) {
        console.log(`Sender with phone number ${senderPhoneNumber} not found.`);
        return null;
      }

      const senderName = senderSnapshot.docs[0].data().userName;

      const receiverSnapshot = await admin.firestore().collection('userData').where('userPhoneNumber', '==', receiverPhoneNumber).get();

      if (receiverSnapshot.empty) {
        console.log(`Receiver with phone number ${receiverPhoneNumber} not found.`);
        return null;
      }

      receiverSnapshot.forEach(receiverDoc => {
        console.log(`Found user to: ${receiverDoc.data().userName}`);

        const userToken = receiverDoc.data().userToken;

        const message = {
          data: {
            title: `You have a message from "${senderName}"`,
            body: chatMessage,
            badge: '1',
            sound: 'default',
            chatRoomID: chatRoomId,
            senderPhoneNumber: senderPhoneNumber,
            senderName: senderName,
            receiverPhoneNumber: receiverDoc.data().userPhoneNumber,
            receiverName: receiverDoc.data().userName,
          },
          token: userToken
        };

        admin.messaging().send(message)
          .then((response) => {
            console.log('Successfully sent message:', response);
          })
          .catch((error) => {
            console.error('Error sending message:', error);
          });
      });

    } catch (error) {
      console.error('Error in sendNotification function:', error);
    }

    return null;
  });
