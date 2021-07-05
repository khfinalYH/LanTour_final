const session = require('express-session')
const express = require('express')
const app = express()
const fs = require('fs')
const { v4: uuidV4 } = require('uuid')

const options = { 
    key: fs.readFileSync('./keys/cert.key'),
    cert: fs.readFileSync('./keys/cert.crt')
}
const server = require('https').createServer(options, app)
const io = require('socket.io')(server)

app.use(session({ 
    secret: 'keyboard cat', 
    resave: false, 
    saveUninitialized: true 
}))


app.set('view engine', 'ejs')
app.use(express.static('public'))
app.use(express.json());
app.use(express.urlencoded({ extended: false }))

app.get('/', (req, res) => {
    res.redirect(`/${uuidV4()}`)
})

app.get('/:room', (req, res) => {
    res.render('room', {
        roomId: req.params.room,
        member_grade: req.session.member_grade,
        member_no: req.session.member_no,
        lantour_no: req.session.lantour_no
    })
})

app.post('/',(req, res)=>{
    req.session.member_grade = req.body.member_grade
    req.session.member_no = req.body.member_no
    req.session.lantour_no = req.body.lantour_no
    console.log(req.session.member_grade)
    console.log(req.session.member_no)
    console.log(req.session.lantour_no)
    res.redirect(`/${uuidV4()}`)
 })

io.on('connection', socket => {
    socket.on('join-room', (roomId, userId) => {
        socket.join(roomId)
        socket.broadcast.to(roomId).emit('user-connected', userId)

        socket.on('disconnect', () => {
            socket.broadcast.to(roomId).emit('user-disconnected', userId)
        })
    })
})

server.listen(3000)