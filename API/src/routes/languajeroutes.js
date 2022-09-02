import {Router} from "express";
import {methods as bloodCount} from "./../controller/BloodCount";
import { restart } from "nodemon";

const router = Router();

router.get('/blood',bloodCount.getBloods);
router.get('/blood/:id',bloodCount.getBlood);
router.delete('/blood/:id',bloodCount.delBloods);
router.put('/blood/:id',bloodCount.putBloods);
router.post('/blood',bloodCount.addBloods);

//router.post
 export default router;