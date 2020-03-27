const functions = require('firebase-functions');
// Import and initialize the Firebase Admin SDK.
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendEventNotification = functions.database.ref('/bvpieee/OurEvent/{eventName}')
    .onWrite(async (change, context) => {
      const eventName=context.params.eventName; 
      const payload = {
        notification: {
          title: 'Events Update',
          body: `Event ${eventName} info has been updated, go check it out`,
        },
        topic: 'news',
      };

      admin.messaging().send(payload)
      .then((response) =>{
             return console.log('successfully sent message: ',response);
          })
      .catch((error)=> {
          console.log('error sending message: ',error);
          });
    });


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
