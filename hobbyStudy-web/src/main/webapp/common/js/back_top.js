window.onload = function() {
    //返回顶部
    var backtop = document.getElementById('backtop');
    var timer = null;
    var isTop = true;
    var clientHeight = document.documentElement.clientHeight;

    window.onscroll = function () {
        var topHeight = document.body.scrollTop || document.documentElement.scrollTop;
        if (topHeight >= clientHeight) {
            backtop.style.display = 'block';
        } else {
            backtop.style.display = 'none';
        }
        if (!isTop) {
            clearInterval(timer);
        }
        isTop = false;
    }

    backtop.onclick = function () {
        timer = setInterval(function () {
            var topHeight = document.body.scrollTop || document.documentElement.scrollTop;
            var upspeed = Math.floor(-topHeight / 5);
            document.documentElement.scrollTop = document.body.scrollTop = topHeight + upspeed;
            isTop = true;
            if (topHeight == 0) {
                clearInterval(timer);
            }
        }, 30);
    }
}