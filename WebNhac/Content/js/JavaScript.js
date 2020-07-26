//<![CDATA[
$(document).ready(function () {

    new jPlayerPlaylist({
        jPlayer: "#jquery_jplayer_2",
        cssSelectorAncestor: "#jp_container_2"
    }, [

        {
            title: "Your Face",
            mp3: "http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
        },
        {
            title: "Cyber Sonnet",
            mp3: "http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
        },


        {
            title: "Lismore",
            mp3: "http://www.jplayer.org/audio/mp3/Miaow-04-Lismore.mp3",
        },
    ], {
        swfPath: "../../dist/jplayer",
        supplied: "oga, mp3",
        wmode: "window",
        useStateClassSkin: true,
        autoBlur: false,
        smoothPlayBar: true,
        keyEnabled: true
    });
});
//]]>