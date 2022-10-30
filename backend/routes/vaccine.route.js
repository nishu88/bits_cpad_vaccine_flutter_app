const express = require('express')
const Vaccine = require('../models/vaccine.model')
const Student = require('../models/student.model')
const router = express.Router()


<<<<<<< HEAD
router.post('/update',(req,res)=>{
    // Student.
    Vaccine.findOneAndUpdate({student_id:req.body.student_id},{$set:
        {
            student_id:req.body.student_id,
            vaccination_status:"true",
            date:req.body.date,
            vac_type:req.body.vac_type
        }}, {new: true},(err,student)=>{
=======
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
>>>>>>> ae463130d276661bd174e4e318a331604013ae3b

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

module.exports = router