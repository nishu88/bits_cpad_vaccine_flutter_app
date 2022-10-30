const express = require('express')
const Vaccine = require('../models/vaccine.model')
const Student = require('../models/student.model')
const router = express.Router()


router.post('/add',(req,res)=>{
    Student.findOne({student_id:req.body.student_id},(err,student)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(student==null){
                res.json({
                    message:'studentID is not avilable'
                }) 
            }else{
                const vaccine = Vaccine({
                    student_id:req.body.student_id,
                    vaccination_status:true,
                    date:req.body.date,
                    name:req.body.name
                })
                vaccine.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(vaccine)
                        res.json(vaccine)
                    }
                    
                })
            }
        }
    })
    
})

/*router.post('/delete',(req,res)=>{
    Student.findOne({student_id:req.body.student_id},(err,student)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(student != null){
            student.delete()
            res.json({
                message:'student record deleted'
            }) 
        } else {
            res.json({
                message:'studentID does not exist'
            })
        }
        }
    })
})

router.post('/report',(req,res)=>{
    Student.find({coordinator_email:req.body.coordinator_email},(err,students)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(students != null){
            res.json({ students }) 
        } else {
            res.json({
                message:'No student found under coordinator'
            })
            res.status(500)
        }
        }
    })
})*/

module.exports = router