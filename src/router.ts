import { Router } from "express";
import { weaponById } from "./controllers/weapons.controller";

const router = Router();

router.post("/all-skins-by-weaponid", weaponById);

export default router;
