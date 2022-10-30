const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    student_id:String,
    vaccination_status:Boolean,
    date:String,
    vac_type:String
})

module.exports = mongoose.model('Vaccine',newSchema)