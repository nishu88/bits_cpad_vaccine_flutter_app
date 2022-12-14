const express = require('express')
const app = express()
const port = 8080 || process.env.PORT
const cors = require('cors')
const bodyParser = require('body-parser')

const mongoose = require('mongoose')
//mongoose.connect("mongodb://localhost:27017/mydb",{ useNewUrlParser: true, useUnifiedTopology: true })

mongoose.connect("mongodb+srv://dbUser:nishu123@cluster0.nvgsydq.mongodb.net/user",{ useNewUrlParser: true, useUnifiedTopology: true })

app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/',require('./routes/user.route'))
app.use('/student',require('./routes/student.route'))
app.use('/vaccine',require('./routes/vaccine.route'))
app.use('/vaccine_drive',require('./routes/vaccine_drive.route'))
app.listen(port,()=>{
    console.log('port running on '+port)
})