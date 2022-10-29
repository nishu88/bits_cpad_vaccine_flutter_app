const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    student_id:String,
    student_name:String,
    coordinator_email:String
})

module.exports = mongoose.model('Student',newSchema)