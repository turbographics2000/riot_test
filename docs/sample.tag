<form-video>
    <div id="form-video">
        <label for="video">動画を選択</label>
        <div class="video-wrapper" show={ preview }>
            <video id="video" preload="auto">
                <source src="{ previewSrc }" type="video/mp4">
            </video>
        </div>
        <input id="hoge" type="file" accept="video/*" onchange="{ changed }"></input>
    </div>
    <style>
        #form-video {
            position: relative;
            margin-top: 30px;
            width: 100%;
            height: 225px;
            overflow: hidden;
            border-bottom: 2px solid #93CFF4;
        }
        
        label {
            display: block;
            color: #58656F;
            width: 100%;
            font-weight: bold;
            line-height: 225px;
            text-align: center;
        }
        
        .video-wrapper {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 90;
            width: 100%;
            height: 225px;
            vertical-align: bottom;
        }
        
        video {
            width: 100%;
            height: 225px;
        }
        
        #hoge {
            display: none;
        }
    </style>
    <script>
        var fileBool = false
        var target = this;
        this.changed = (e) => {
             target.tags.video.srcObject = e.target.files[0]
             target.tags.video.play();
        }
    </script>
</form-video>
