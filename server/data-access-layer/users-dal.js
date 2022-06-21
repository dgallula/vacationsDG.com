import connection from "../common/database.js";
import CryptoJS from "crypto-js";
import generalSetting from "../common/config.js";

let result = {
  success: false,
  data: null,
};

const getAll = async () => {
  try {
    let resultFromDB = await connection.promise().query("SELECT * FROM users");
    result.success = true;
    result.data = resultFromDB[0];
  } catch (error) {
    result.data = error;
  }
  return result;
};

const getUserByEmail = async (userEmail) => {
  try {
    let resultUser = await connection.promise().query(`SELECT * FROM users 
                    WHERE email = "${userEmail}"`);
    result.success = true;
    result.data = resultUser[0];
  } catch (error) {
    result.success = false;
    result.data = error;
  }
  return result;
};

const addNewUser = async (newUser) => {
  try {
    const cryptoPassword = CryptoJS.AES.encrypt(
      newUser.password,
      generalSetting.CRYPTOJS_KEY
    ).toString();

    let resultPostToDB = await connection.promise()
      .query(`INSERT INTO users (firstName, familyName, email,userName, password, role)
        VALUES
         ('${newUser.firstName}','${newUser.familyName}','${newUser.email}','${newUser.userName}''${cryptoPassword}','user')`);
    result.success = true;
    result.data = resultPostToDB[0];
  } catch (error) {
    result.success = false;
    result.data = error;
  }
  return result;
};


//  const deleteUser = async (id) => {
//      let result = {
//          success: false,
//          data: null
//     }

//      try {
//          let res = await connection.promise().query(
//              `DELETE FROM vacations WHERE id = ${id};`
//         )

//         result.success = true

//         return result
//     } catch (err) {
//         result.success = false
//          result.data = err

//          return result
//     }

const update = async (id, user) => {
  try {
    const updateUserResult = await connection.promise().query(
      `UPDATE users SET firstName=?, FamilyName=?, email=?, userName=?
      WHERE id = ${id}`,
      [user.firstName, user.familyName, user.email, user.userName]
    );
    result.success = true;
    result.data = updateUserResult[0];
  } catch (error) {
    result.data = error;
  }
  return result;
};

export default {
  getAll,
  addNewUser,
  getUserByEmail,
  update,
};
