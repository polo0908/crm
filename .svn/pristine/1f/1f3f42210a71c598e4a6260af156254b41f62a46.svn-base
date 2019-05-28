
$( document ).ready( function() {
	
			/*获取地址栏参数*/
	        function getParameter(parametername){
			     var reg = new RegExp("(^|&)"+ parametername +"=([^&]*)(&|$)");
			     var r = window.location.search.substr(1).match(reg);
			     if(r!=null)return  unescape(r[2]); return null;
			}
	        
	        
  			var  winWidth=window.innerWidth;
				var scrollList=$("#cooperation");
				window.onresize = function(){
					location.reload()
				}
				var loadCoopration = function(){
					$.ajax({
						url:"server/coopration.json",
						type:"GET",
						async:"ture",
						success:function(data){
							scrollList.html(editHTML(data.coopration));
						},
						error:function(){
							// alert("请求失败")
						}
					});
				}
			
				var insetInto=function(srcollImg){
					if(winWidth<882){
						srots(1,srcollImg)
					}else if(winWidth>882 && winWidth<1318){
						srots(2,srcollImg)
					}else if(winWidth>1319 && winWidth<1800){
						srots(3,srcollImg)
					}else if(winWidth>1800){
						srots(4,srcollImg)
					}
				}
				var srots=function(n,srcollImg){
				var before1='<div class="carousel-item active"><div class="carousel-caption">';
					var before2='<div class="carousel-item"><div class="carousel-caption">';
					var after='</div></div>';
					var html="";
					for(var i=0;i<srcollImg;i++){
						if(i==0){
							html+=(before1+scrollList.children('img').eq(i).prop("outerHTML"));
						}else if(i%n!=0 && i!=srcollImg-1 && i!=0){
							html+=scrollList.children('img').eq(i).prop("outerHTML");
						}else if(i%n==0 && i!=srcollImg-1){
							html+=(after+before2+scrollList.children('img').eq(i).prop("outerHTML"));
						}else if(i==srcollImg-1){
							if(n==1 || n==3){
								html+=after+before2 +scrollList.children('img').eq(i).prop("outerHTML")+after;
							}else{
								html+=scrollList.children('img').eq(i).prop("outerHTML")+after;
							}
						};
					}
					scrollList.html(html)
				}
				var editHTML=function(arr){
					var html="";
					for(var i=0;i<arr.length;i++){
					//console.log(arr[i].url)
						html+="<img src="+arr[i].url+">";
					}
					return html
				}
				
				loadCoopration();
			window.setTimeout(function(){
				srcollImg=scrollList.find("img").length;
				insetInto(srcollImg);
			},100);	
			
			
			

			 $("#banner_box1").slider({
	            containerEl: $(".index-banner-scroll"),
	            silderContainerEl: $("#index-banner ul"),
	            itemEl: $("#index-banner ul li"),
	            btnEl: $('.control span'),
	            btnContainerEl: $('.control'),
	            prev: $("#arrow-left"),
	            next: $("#arrow-right"),
	            index: 0,
	            resizeable: true,
	            showButton: true
       	 	});
			 
			

			
  
});
