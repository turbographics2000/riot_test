<form-video>
    <label for="video">動画を選択</label>
    <input id="video" type="file" accept="video/*" onchange="{ changed }"></input>
    <div class="video-wrapper" if={ preview }>
        <video preload="auto" ref="video" onloadeddata="{ loaded }" ontimeupdate="{ playing }">
            <source src="{ previewSrc }" type="video/mp4">
        </video>
        <div class="controls">
            <div class="movie-state" onclick="{ clickState }">
                <i class="fa fa-play click_state" aria-hidden="true"></i>
            </div>
            <div class="timeline" ref="timeline"></div>
            <div class="time">
                <div class="now-time">{ playTime }</div>
                <div class="slash">/</div>
                <div class="all-time">{ totalTime }</div>
            </div>
        </div>
    </div>
</form-video>
