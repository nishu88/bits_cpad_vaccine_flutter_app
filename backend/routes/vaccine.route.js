const express = require('express')
const Vaccine = require('../models/vaccine.model')
const Student = require('../models/student.model')
const router = express.Router()


router.post('/update',(req,res)=>{
    // Student.
    Vaccine.findOneAndUpdate({student_id:req.body.student_id},{$set:
        {
            student_id:req.body.student_id,
            vaccination_status:"true",
            date:req.body.date,
            vac_type:req.body.vac_type,
            coordinator_email:req.body.coordinator_email

        }}, {new: true},(err,student)=>{

        if(err){
            console.log(err)
            res.json(err)          
        }
        if(student==null){
            res.json({
                message:'studentID is not defined, Add student in /student/add'
            }) 
            }  
            res.json(student)    
    })
    
})

router.get('/get_all_status',(req,res)=>{
    console.log(req.query)
    Vaccine.find(req.query,(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            res.json(user)   
        }
    })
})

module.exports = router