import db from "../database/connection";

export const getWeaponById = (weaponid: number) => {
  console.log(weaponid);
  return db
    .query(`SELECT * FROM guns WHERE gunid=$1`, [weaponid])
    .then(({ rows }) => rows[0]);
};
