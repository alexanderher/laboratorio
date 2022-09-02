import { getConnection } from "./../databases/database";

const getBloods= async (request,response)=>{
    try {
        const connection = await getConnection();
        const result = await connection.query("select  a1.id, a1.name, a1.type,sugar, fat, oxygen,( case when riesgo_sugar = riesgo_fat and riesgo_sugar = riesgo_oxygen then riesgo_sugar else 'UNDEFINED' end ) as 'status' from(select  hemograma.*, ( select  risk_level from    config_riesgo where   hemograma.sugar >= config_riesgo.sugar_min and     hemograma.sugar <  config_riesgo.sugar_max) as riesgo_sugar, ( select  risk_level from    config_riesgo where   hemograma.fat >= config_riesgo.fat_min and     hemograma.fat <  config_riesgo.fat_max ) as riesgo_fat, ( select  risk_level from    config_riesgo where   hemograma.oxygen > config_riesgo.oxygen_min and     hemograma.oxygen <= config_riesgo.oxygen_max ) as riesgo_oxygen from    hemograma ) a1");
        console.log(result);
        ///const {id,name,type,sugar,fat, oxygen} = result;
        return response.json(result);
    } catch (error) {
        response.status(500);
        return response.send(error.message);
    }
    
}

const getBlood= async (request,response)=>{
    try {
        const {id} = request.params;
        const connection = await getConnection();
        const result = await connection.query("select  a1.id, a1.name, a1.type,sugar, fat, oxygen,( case when riesgo_sugar = riesgo_fat and riesgo_sugar = riesgo_oxygen then riesgo_sugar else 'UNDEFINED' end ) as 'status' from(select  hemograma.*, ( select  risk_level from    config_riesgo where   hemograma.sugar >= config_riesgo.sugar_min and     hemograma.sugar <  config_riesgo.sugar_max) as riesgo_sugar, ( select  risk_level from    config_riesgo where   hemograma.fat >= config_riesgo.fat_min and     hemograma.fat <  config_riesgo.fat_max ) as riesgo_fat, ( select  risk_level from    config_riesgo where   hemograma.oxygen > config_riesgo.oxygen_min and     hemograma.oxygen <= config_riesgo.oxygen_max ) as riesgo_oxygen from    hemograma ) a1 where id= ?", id);
        console.log(result);
        response.json(result[0]);
    } catch (error) {
        response.status(500);
        response.send(error.message);
    }
    
}

const delBloods= async (request,response)=>{
    try {
        const {id} = request.params;
        const connection = await getConnection();
        const result = await connection.query("DELETE FROM hemograma WHERE id= ?", id);
        console.log(result);
        response.json(result);
    } catch (error) {
        response.status(500);
        response.send(error.message);
    }
    
}

const putBloods= async (request,response)=>{
    try {
        const {id} = request.params;
        console.log(request.body); 
        const {name,type,sugar,fat,oxygen}=request.body;
        if(id===undefined || name===undefined || type===undefined || sugar===undefined || fat===undefined || oxygen===undefined){
            response.status(400).json({message:"bad request.fill all field"});
        }
        console.log(name); 
        const connection = await getConnection();
        const hemogram = {name,type,sugar,fat,oxygen};
        const result = await connection.query("UPDATE HEMOGRAMA SET ? WHERE id=?", [hemogram,id]);
        response.json(result);
    } catch (error) {
        response.status(500);
        response.send(error.message);
    }
    
}

const addBloods= async (request,response)=>{
    try {
        console.log(request.body); 
        const {id,name,type,sugar,fat,oxygen}=request.body;
        if(id===undefined || name===undefined || type===undefined || sugar===undefined || fat===undefined || oxygen===undefined){
            response.status(400).json({message:"bad request.fill all field"});
        }
        console.log(name); 
        const connection = await getConnection();
        const hemogram = {id,name,type,sugar,fat,oxygen};
        const result = await connection.query("INSERT INTO hemograma SET ?", hemogram);
        response.json(result);
    } catch (error) {
        response.status(500);
        response.send(error.message);
    }
    
}

export const methods={
    getBloods,
    getBlood,
    delBloods,
    putBloods,
    addBloods
}