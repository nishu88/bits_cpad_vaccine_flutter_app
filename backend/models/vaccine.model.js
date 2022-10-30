const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    student_id:String,
    vaccination_status:String,
    date:String,
    vac_type:String,
    coordinator_email:String
})

module.exports = mongoose.model('Vaccine',newSchema)