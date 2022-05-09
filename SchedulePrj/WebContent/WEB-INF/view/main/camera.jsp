<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camera Web App</title>

<style>
        html, body{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        #header{
            position: absolute;
            top: 50px;
            left: 50%;
            z-index: 999;
            color: white;
            text-align: center;
            transform: translate(-50%, -50%);
        }

        #header > p {
            font-size: 0.9em;
        }

        #camera, #camera--view, #camera--sensor, #camera--output{
            position: fixed;
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        #camera--view, #camera--sensor, #camera--output{
            transform: scaleX(-1);
            filter: FlipH;
        }

        #camera--trigger{
            width: 180px;
            color: white;
            background-color: black;
            font-size: 16px;
            border-radius: 30px;
            border: none;
            padding: 15px 20px;
            text-align: center;
            box-shadow: 0 5px 10px 0 rgba(0,0,0,0, 0.2);
            position: fixed;
            bottom: 30px;
            left: calc(50% - 90px);
        }

        .taken {
            height: 140px!important;
            width: 220px!important;
            border: solid 2px rgb(121, 200, 253);
        }
    </style>


</head>
<body>

	<div id="header">
        <h3>Simple Web Camera</h3>
        <p>버튼을 클릭 하세요.</p>
    </div>
	

	<main id="camera">
        
        <canvas id="camera--sensor"></canvas>

        <!-- 기기의 카메라에 접근하여 영상을 페이지에 재생한다. -->
        <video id="camera--view" autoplay playsinline></video>
        
        <img src="//:0" alt="" id="camera--output">

        <button id="camera--trigger">사진촬영</button>

    </main>


 <script>

        let constraints = { video: { facingMode: "user"}, audio: false};
        const cameraView = document.querySelector("#camera--view");
        const cameraOutput = document.querySelector("#camera--output");
        const cameraSensor = document.querySelector("#camera--sensor");
        const cameraTrigger = document.querySelector("#camera--trigger");


        function cameraStart(){
            navigator.mediaDevices.getUserMedia(constraints)
                .then(function(stream){
                    track = stream.getTracks()[0];
                    cameraView.srcObject = stream;

                })
                .catch(function(error){
                    console.error("카메라에 문제가 있습니다.", error);
                })
        }

        //촬영 버튼 클릭 리스너
        cameraTrigger.addEventListener("click", function(){
            
            cameraSensor.width = cameraView.videoWidth; //640으로 정해져서 나오네?
            cameraSensor.height = cameraView.videoHeight;
            cameraSensor.getContext("2d").drawImage(cameraView, 0, 0);
            cameraOutput.src = cameraSensor.toDataURL("image/webp");
            cameraOutput.classList.add("taken");
            console.log(cameraSensor.height);
        });
    
        // 페이지가 로드되면 함수 실행
        window.addEventListener("load", cameraStart, false);
    </script>


</body>
</html>