import { getWeaponById } from "../models/weapons.model";
import { Request, Response } from "express";
import catchAsync from "../utils/catchAsync";

export const weaponById = catchAsync(async (req: Request, res: Response) => {
  const { weaponid } = req.body;
  const weapon = await getWeaponById(+weaponid);
  console.log({ weapon });
  res.send({ weapon, message: "success" });
});
