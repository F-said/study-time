function timer(PassedMinute){
    var minute = 30; //PassedMinute
    var second = 60;

    var active = false;

    function startPause() {
        if(!active) {
            active = true;
            run();
            document.getElementById("Start/Pause").innerHTML = "toggleStart";
        }
        else {
            active = false;
            document.getElementById("Start/Pause").innerHTML = "togglePause";
        }
    }

    function reset() {
        active = false;
        minute = PassedMinute;
        document.getElementById("Start/Pause").innerHTML = "reset";
    }

    function run() {
        if(active) {
            setTimeout(function() {
                second--;
                if(second < 0) {
                    minute--;
                    second = 60;
                }
                if(minute < 0) {
                    clearInterval(timer);
                }
            }, 1000);
        }
    }
    /*
    var timer = setInterval(function(){
        minu = minute;
        sec = second;
        document.getElementById("minute").innerHTML = minu;
        document.getElementById("second").innerHTML =sec;
        sec--;
        if (sec < 0) {
            minu--;
            sec = 60;
        }
        if(minu < 0) {
            clearInterval(timer);
        }
    }, 1000);
    */
}