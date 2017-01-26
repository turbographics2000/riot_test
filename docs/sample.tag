<form-video>
    <div id="form-video">
        <label for="video">動画を選択</label>
        <div class="video-wrapper" show={ preview }>
            <video preload="auto">
                <source src="{ previewSrc }" type="video/mp4">
            </video>
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
        var fileBool = false
        var target = this
        this.changed = function(e) {
            var fileData = e.target.files[0]
            var fileType = fileData.type
            var reader = new FileReader()

            if ('' !== e.value) {
            // ファイルが選択されている場合

                reader.onerror = () => {
                // ファイル読み込み失敗時
                    alert('ファイル読み取りに失敗しました')
                }

                reader.onload = function() {
                // ファイル読み込み完了時
                    target.preview = true;
                    target.previewSrc = reader.result;
                    target.update()
                }
            }

            // 動画読み込み実行
            reader.readAsDataURL(fileData)
        }
    </script>
</form-video>
