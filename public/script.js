const socket = io('/')
const videoGrid = document.getElementById('video-grid')
const guestvideoGrid = document.getElementById('guest-grid')

const myVideo = document.createElement('video')

myVideo.muted = true

const myPeer = new Peer()
const peers = {}
let myMediaStream;


if (member_grade == 'H') {
    navigator.mediaDevices.getUserMedia({
        video: true,
        audio: true
    }).then(stream => {  
        myMediaStream = stream;
        addVideoStream(myVideo, stream)
        myPeer.on('call', call => {
            call.answer(stream)
            const video = document.createElement('video')
            call.on('stream', userVideoStream => {
                addVideoStream(video, userVideoStream)
            })
        })
    
        
        socket.on('user-connected', userId => {
            setTimeout(() => {
                connectToNewUser(userId, stream)
            }, 1000)
        })
        
    })
} else {
    navigator.mediaDevices.getUserMedia({
        video: false,
        audio: true
    }).then(stream => {  
        myMediaStream = stream;
        addAudioStream(myVideo, stream)
        myPeer.on('call', call => {
            call.answer(stream)
            const video = document.createElement('video')
            call.on('stream', userVideoStream => {
                addAudioStream(video, userVideoStream)
            })
        })
    
        
        socket.on('user-connected', userId => {
            setTimeout(() => {
                connectToNewUser(userId, stream)
            }, 1000)
        })
        
    })
}


socket.on('user-disconnected', userId => {
    if (peers[userId]) {
        setTimeout(() => {
            peers[userId].close()
        }, 1000)
    }
})

myPeer.on('open', id => {
    socket.emit('join-room', ROOM_ID, id)
})


function addVideoStream(video, stream) {
    video.srcObject = stream
    video.addEventListener('loadedmetadata', () => {
        video.play()
    })
        videoGrid.append(video)
}



// 새로운 게스트
function connectToNewUser(userId, stream){
    const call = myPeer.call(userId, stream)
    const video = document.createElement('video')
    call.on('stream', userVideoStream => {
        addVideoStream(video, userVideoStream)
    })
    call.on('close', () => {
        video.remove()
    })
    peers[userId] = call
}



// 버튼 control (비디오, 오디오 on/off)
const playStop = () => {
    let enabled = myMediaStream.getVideoTracks()[0].enabled;
    if (enabled) {
        myMediaStream.getVideoTracks()[0].enabled = false;
      setPlayVideo();
    } else {
      setStopVideo();
      myMediaStream.getVideoTracks()[0].enabled = true;
    }
};
  
const muteUnmute = () => {
    const enabled = myMediaStream.getAudioTracks()[0].enabled;
    if (enabled) {
        myMediaStream.getAudioTracks()[0].enabled = false;
        setUnmuteButton();
    } else {
      setMuteButton();
      myMediaStream.getAudioTracks()[0].enabled = true;
    }
};
  
const setPlayVideo = () => {
    const html = `<i class="unmute fa fa-pause-circle"></i>
    <span class="unmute">Start Video</span>`;
    document.getElementById("playPauseVideo").innerHTML = html;
};
  
const setStopVideo = () => {
    const html = `<i class=" fa fa-video-camera"></i>
    <span class="">Pause Video</span>`;
    document.getElementById("playPauseVideo").innerHTML = html;
};
  
const setUnmuteButton = () => {
    const html = `<i class="unmute fa fa-microphone-slash"></i>
    <span class="unmute">Unmute</span>`;
    document.getElementById("muteButton").innerHTML = html;
};

const setMuteButton = () => {
    const html = `<i class="fa fa-microphone"></i>
    <span>Mute</span>`;
    document.getElementById("muteButton").innerHTML = html;
};

