const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    no_of_vaccine:Number,
    date:String,
    name:String
})

module.exports = mongoose.model('Vaccine_Drive',newSchema)