<form-video>
    <div id="form-video">
        <label for="video">動画を選択</label>
        <div class="video-wrapper" show={ preview }>
            <video preload="auto" src="{ previewSrc }" autoplay></video>
        </div>
        <input id="video" type="file" accept="video/*" onchange="{ changed }"></input>
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
        
        #video {
            display: none;
        }
    </style>
    <script>
        var target = this;
        this.changed = (e) => {
            target.preview = true;
            target.previewSrc = URL.createObjectURL(e.target.files[0])
            target.update()
        }
    </script>
</form-video>
