const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    student_id:String,
    vaccination_status:Boolean,
    date:String,
    name:String
})

module.exports = mongoose.model('Vaccine',newSchema)