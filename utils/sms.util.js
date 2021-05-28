const dotenv = require("dotenv");
dotenv.config();
const accountSid = process.env.TWILIO_SID;
const authToken = process.env.TWILIO_AT;
const client = require("twilio")(accountSid, authToken);
const sendSMS = (to, content) => {
  client.messages
    .create({
      body: content,
      from: process.env.TWILIO_FROM,
      to: to,
    })
    .then((messages) => {
      console.log(messages);
    });
};

const sendVerificationSMS = (to, key) => {
  sendSMS(to, `인증코드 : ${key}`);
};
module.exports = {
  sendVerificationSMS,
};
