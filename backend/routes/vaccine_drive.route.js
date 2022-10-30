const express = require('express')
const Vaccine_Drive = require('../models/vaccine_drive.model')
const router = express.Router()


router.post('/reg_new_vac_drive',(req,res)=>{
    Vaccine_Drive.findOne({name:req.body.name,date:req.body.date},(err,vaccine_drive)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(vaccine_drive==null){
                const vaccine_drive = Vaccine_Drive({
                    no_of_vaccine:req.body.no_of_vaccine,
                    date:req.body.date,
                    name:req.body.name
                })
                vaccine_drive.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(vaccine_drive)
                        res.json(vaccine_drive)
                    }
                    
                })
            }else{
              res.json({
                message:'vaccine_drive already exists'
            })   
            }
        }
    })
    
})

router.get('/future_vac_drives',(req,res)=>{
    Vaccine_Drive.find({},(err,vaccine_drive)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(vaccine_drive != null){
                res.json({ vaccine_drive }) 
        } else {
            res.json({
                message:'vaccine_drive does not exist'
            })
        }
        }
    })
})


module.exports = router