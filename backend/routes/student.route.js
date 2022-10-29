const express = require('express')
const Student = require('../models/student.model')
const router = express.Router()


router.post('/add',(req,res)=>{
    Student.findOne({student_id:req.body.student_id},(err,student)=>{
        if(err){
            console.log(err)
            res.json(err)
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
                        res.json(err)
                    }else{
                        console.log(student)
                        res.json(student)
                    }
                    
                })
            }else{
              res.json({
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
})

module.exports = router