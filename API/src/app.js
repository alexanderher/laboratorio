import express from "express";
import morgan from "morgan";
// routers
import languajeroutes from "./routes/languajeroutes";

const app= express();
//settings
app.set("port",3002);
// middlewares
app.use(morgan("dev"));
app.use(express.json());
//routes
app.use("/api",languajeroutes);

app.get('/', (request,response) =>{
    console.log("me jodi");
    response.json({'app':'Laboratorio  grupo G'})
});
export default app;