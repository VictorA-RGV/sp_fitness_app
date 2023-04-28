// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


// Function for sending the poking notif

// const functions = require("firebase-functions");
// const admin = require("firebase-admin");
// admin.initializeApp();

// exports.pokeFriend = functions.https.onCall(async (data, context) => {
//   const friendId = data.friendId;
//   const senderId = context.auth.uid;

//   // Get the sender's name (optional)
//   const senderDoc = await admin
//       .firestore()
//       .collection("Users")
//       .doc(senderId)
//       .get();
//   const senderName = senderDoc.data().name;

//   // Retrieve the friend's device tokens
//   const tokensSnap = await admin
//       .firestore()
//       .collection("Users")
//       .doc(friendId)
//       .collection("tokens")
//       .get();

//   const tokens = [];
//   tokensSnap.forEach((doc) => {
//     tokens.push(doc.data().token);
//   });

//   // Send a push notification to the friend's devices
//   const payload = {
//     notification: {
//       title: "Workout Reminder",
//       body: `${senderName} has poked you to work out!`,
//       click_action: "FLUTTER_NOTIFICATION_CLICK",
//     },
//   };
//   return admin.messaging().sendToDevice(tokens, payload);
// });
