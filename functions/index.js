const functions = require('firebase-functions');
// Import and initialize the Firebase Admin SDK.
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendEventNotification = functions.database.ref('/bvpieee/{activityType}/{activityName}')
    .onWrite(async (change, context) => {
      var activityType=context.params.activityType;
      if(activityType==='Chapter')
      console.log('Chapters updated');
      else {
        if(activityType === 'OurEvent')
        activityType='Events';
        const activityName=context.params.activityName; 
        const payload = {
          notification: {
          title: `${activityType} Update`,
          body: `checkout the update in ${activityType} regarding ${activityName} `,
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
        }
    });


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
