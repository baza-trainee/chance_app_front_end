const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const db = admin.firestore();

exports.changeLastMessage = functions.firestore
    .document("rooms/{roomId}/messages/{messageId}")
    .onWrite((change, context) => {
      const message = change.after.data();
      if (message) {
        return db.doc("rooms/" + context.params.roomId).update({
          lastMessages: [message],
        });
      } else {
        return null;
      }
    });

exports.changeMessageStatus = functions.firestore
    .document("rooms/{roomId}/messages/{messageId}")
    .onWrite((change) => {
      const message = change.after.data();
      if (message) {
        if (["delivered", "seen", "sent"].includes(message.status)) {
          return null;
        } else {
          return change.after.ref.update({
            status: "delivered",
          });
        }
      } else {
        return null;
      }
    });

exports.updateMessagesToSeen = functions.https.onRequest(async (req, res) => {
  const roomId = req.query.roomId;
  const uid = req.headers.uid;

  try {
    const messagesRef = db
        .collection(`rooms/${roomId}/messages`);
    const querySnapshot = await messagesRef
        .where("authorId", "!=", uid)
        .where("status", "==", "delivered")
        .orderBy("createdAt", "desc")
        .limit(1)
        .get();
    const latestMessage = querySnapshot.docs[0];
    if (latestMessage) {
      await latestMessage.ref.update({[`metadata.seen.${uid}`]: true});

      console.log("Latest message updated to seen status.");
      res.status(200).send("Latest message updated to seen status.");
    } else {
      console.log("No messages found to update.");
      res.status(404).send("No messages found to update.");
    }
  } catch (error) {
    console.error("Error updating messages:", error);
    res.status(500).send("Error updating messages.");
  }
});
