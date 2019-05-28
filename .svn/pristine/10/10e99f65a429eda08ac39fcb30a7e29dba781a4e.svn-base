function scrollBox(id1,id2,id3,id4)
{var mysw=$(id1).width();
var blw=$(id2).find('li').eq(0).width();
var liArr=$(id2).find('ul').children("li");
var mus=parseInt(mysw/blw);
var length=liArr.length- mus;
var i=0;
if(liArr.length>5){$(id3).click(function(){i++;if(i<length){$(id2).css("left",-(blw*i));}else{i=length;$(id2).css("left",-(blw*length));}});
$(id4).click(function(){i--;if(i>=0
		){$(id2).css("left",-(blw*i));}else{i=0;$(id2).css("left",0);}});}}