import express from "express";
import cors from "cors";
import helmet from "helmet";
import router from "./src/router";

import { errorConverter, errorHandler } from "./src/middlewares/error";

const app = express();
const PORT = process.env.PORT || 4000;

declare global {
  namespace Express {
    interface Request {
      user: any;
      body: any;
    }
  }
}

app.use(cors());
app.use(helmet());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/api/", router);

app.use(errorConverter);
app.use(errorHandler);

app.listen(PORT, () =>
  console.log(`Server running at http://localhost:${PORT}`)
);
