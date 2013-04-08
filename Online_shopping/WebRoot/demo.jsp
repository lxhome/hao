<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'demo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.9.0.js"></script></head>
<script type="text/javascript">
$(document).ready(function() {
$('.carousel').carousel({
	  interval: 2000
});
});
</script>
<body>
	
	
	  <div class="span9 columns">
          <h2>轮播的例子</h2>
          <p>观察下面的幻灯片</p>
          <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
              <div class="item active">
               <img src="images/glyphicons-halflings-white.png"></img>
                <div class="carousel-caption">
                  <h4>即使杀光所有报晓的公鸡，天，还是会亮的</h4>
                  <p>
		    @shifeike: 昨天是李尚平被枪杀10周年，我发的那条纪念微博，成为我的新浪微博账号最后一条微博。这个2010年1月为反对红中抢笔而注册的微博，两年多时间里发了14538条微博，加上被删除的差不多近200万字，积累了96269条粉丝，自此灰飞烟灭。
		  </p>
                </div>
              </div>
              <div class="item">
              <img src="images/glyphicons-halflings.png"></img>
                <div class="carousel-caption">
                  <h4>如果人民不欢迎我们，就该我们下台了</h4>
                  <p>
		    【胡耀邦语录】①历史是混不过去的。②民主、自由、平等、博爱等观念是人类精神的一大解放。③如果人民不欢迎我们，就该我们下台了。④不懂的不要装懂，不通的不要装通，不服的不要装服。⑤中国的出路是民主和科学。⑥一个精神上、组织上被禁锢被压制的不自由民族怎么可能与其他国家进行自由竞争呢？
		  </p>
                </div>
              </div>
              <div class="item">
            <img src="images/glyphicons-halflings-white.png"></img>
                <div class="carousel-caption">
                  <h4>国家像需要空气一样需要变革</h4>
                  <p>
		    据戈尔巴乔夫基金会新闻处通报，俄总统梅德韦杰夫今天向前苏联总统戈尔巴乔夫颁发圣徒安德烈·佩尔沃兹万内勋章。戈尔巴乔夫在受勋时表示感谢，并称很激动。他坦言，对自己做过的事情问心无愧。他强调，他进行改革不是为了赢得敬重和荣誉，而是因为认识到，“国家像需要空气一样需要变革”。他承认犯过错误，并至今还在为这些错误而烦恼。但他认为：“短短几年所走过的路，使专制的过去永远成为了历史。”
		  </p>
                </div>
              </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
          </div>
          <div class="alert alert-info">
            <strong>强调！</strong>
	    实现轮播时，请移除我们提供的图片，替换为你自己的。
          </div>
          <hr>
          <h2>使用 bootstrap-carousel.js</h2>
          <p>通用javascript调用：</p>
          <pre class="prettyprint linenums">$('.carousel').carousel()</pre>
          <h3>选项</h3>
          <table class="table table-bordered table-striped">
            <thead>
             <tr>
               <th style="width: 100px;">名称</th>
               <th style="width: 50px;">类型</th>
               <th style="width: 50px;">默认</th>
               <th>描述</th>
             </tr>
            </thead>
            <tbody>
             <tr>
               <td>interval</td>
               <td>数字</td>
               <td>5000</td>
               <td>The amount of time to delay between automatically cycling an item.</td>
             </tr>
             <tr>
               <td>pause</td>
               <td>字符串</td>
               <td>"hover"</td>
               <td>Pauses the cycling of the carousel on mouseenter and resumes the cycling of the carousel on mouseleave.</td>
             </tr>
            </tbody>
          </table>
          <h3>标记</h3>
          <p>
	    可以使用data-属性提供前后翻页控件，如下：
	  </p>
<pre class="prettyprint linenums">
&lt;div id="myCarousel" class="carousel"&gt;
  &lt;!-- Carousel items --&gt;
  &lt;div class="carousel-inner"&gt;
    &lt;div class="active item"&gt;…&lt;/div&gt;
    &lt;div class="item"&gt;…&lt;/div&gt;
    &lt;div class="item"&gt;…&lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- Carousel nav --&gt;
  &lt;a class="carousel-control left" href="#myCarousel" data-slide="prev"&gt;&amp;lsaquo;&lt;/a&gt;
  &lt;a class="carousel-control right" href="#myCarousel" data-slide="next"&gt;&amp;rsaquo;&lt;/a&gt;
&lt;/div&gt;
</pre>
          <h3>方法</h3>
          <h4>.carousel(options)</h4>
          <p>
	    初始化轮播组件，接受一个 <code>object</code> 做为可选参数并开始循环播环。
	  </p>
<pre class="prettyprint linenums">
$('.carousel').carousel({
  interval: 2000
})
</pre>
          <h4>.carousel('cycle')</h4>
          <p>
	    从左向右循环播放。
	  </p>
          <h4>.carousel('pause')</h4>
          <p>
	    中止播放。
	  </p>
          <h4>.carousel(number)</h4>
          <p>
	    播放到某个特定的帧(与数组类似，从0开始计数)。
	  </p>
          <h4>.carousel('prev')</h4>
          <p>
	    回到上一帧。
	  </p>
          <h4>.carousel('next')</h4>
          <p>
	    回到下一帧。
	  </p>
          <h3>事件</h3>
          <p>
	    Bootstrap的轮播类提供了两个事件以介入轮播功能。
	  </p>
          <table class="table table-bordered table-striped">
            <thead>
             <tr>
               <th style="width: 150px;">事件</th>
               <th>描述</th>
             </tr>
            </thead>
            <tbody>
             <tr>
               <td>slide</td>
               <td>
		 该事件在调用 <code>slide</code> 实例方法时立刻触发。
	       </td>
             </tr>
             <tr>
               <td>slid</td>
               <td>
		 该事件在轮播项切换效果完成之后触发。
	       </td>
             </tr>
            </tbody>
          </table>
        </div>
	
	
</body>
</html>
