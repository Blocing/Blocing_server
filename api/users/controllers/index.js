const { 
  userService
  // sendSMS, 
  // saveHolder, 
  // saveStudentIdCard,
 } = require("../services");

const userController = {
  EmailService: async (req, res, next) => {
    // const {email} = req.body;
    const { phoneNumber } = req.body;
    // const result = await createEmail({ email });
    const result = await userService.sendSMS(phoneNumber);
    // console.log(result);
    // const ret = await authEmail(result);
    res.status(201).json({ success: true, authCode: result });
  },
  registerService: async (req, res, next) => {
    const { name, studentId, university, department } = req.body;
    console.log("?��?��?�� ?���?");
    console.log(name, studentId, university, department);
    const holderId = await userService.saveHolder({
      name,
      studentId,
      university,
      department,
    });
    console.log("holderId" + holderId);
    const result = await userService.saveStudentIdCard(holderId);
    res.status(201).json({ success: "success", HolderId: result });
  },
};

module.exports = userController;
