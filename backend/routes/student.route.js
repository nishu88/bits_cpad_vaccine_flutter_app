const express = require('express')
const Student = require('../models/student.model')
const Vaccine = require('../models/vaccine.model')
const router = express.Router()


router.post('/add',(req,res)=>{
    Student.findOne({student_id:req.body.student_id},(err,student)=>{
        if(err){
            console.log(err)
            res.status(400).json(err)
        }else{
            if(student==null){

                const student = Student({
                    student_id:req.body.student_id,
                    student_name:req.body.student_name,
                    coordinator_email:req.body.coordinator_email
                })
                student.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.status(200).json(err)
                    }else{
                        console.log(student)
                        res.status(200).json(student)
                    }
                const vaccine = Vaccine({
                    student_id:req.body.student_id,
                    vaccination_status:"false",
                    date:"N/A",
                    vac_type:"N/A",
                    coordinator_email:req.body.coordinator_email,
                })
                vaccine.save()               
                    
                })
            }else{
              res.status(400).json({
                message:'studentID is not avilable'
            })   
            }
        }
    })
    
})

router.post('/delete',(req,res)=>{
    Student.findOne({student_id:req.body.student_id},(err,student)=>{
        if(err){
            console.log(err)
            res.status(400).json(err)
        }else{
            if(student != null){
            student.delete()
            res.status(200).json({
                message:'student record deleted'
            }) 
        } else {
            res.status(200).json({
                message:'studentID does not exist'
            })
        }
        }
    })
})

router.get('/report',(req,res)=>{
    Student.find({coordinator_email:req.body.coordinator_email},(err,students)=>{
        if(err){
            console.log(err)
            res.status(200).json(err)
        }else{
            if(students != null){
            res.status(200).json({ students }) 
        } else {
            res.json({
                message:'No student found under coordinator'
            })
            res.status(500)
        }
        }
    })
})

module.exports = router