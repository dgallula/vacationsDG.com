import mysql from "mysql2";

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Aa123456!",
  database: "vacation",
});

export default connection;
