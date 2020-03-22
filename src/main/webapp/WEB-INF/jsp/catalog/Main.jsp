<%@ include file="../common/IncludeTop.jsp"%>

<div id="Content">
    <script type="text/javascript">
        //商品展示模块。在首页展示商品的图片上添加AJAX效果，即当鼠标移到某个商品图片上时，用悬浮窗展示该类型商品的信息。
        var completeDiv;
        var nameTable;
        var nameTableBody;
        var point = {
            x:0,
            y:0
        };

        function createXMLHttpRequest() {

            if(window.XMLHttpRequest){//非IE浏览器
                xmlHttpRequest = new XMLHttpRequest();
            }
            else if(window.ActiveXObject){//IE以下版本的IE浏览器
                xmlHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
            }
            else {//IE6及以下版本IE浏览器
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }


        }

        function initVars(){
            nameTable = document.getElementById("name_table");
            completeDiv = document.getElementById("popup");
            nameTableBody = document.getElementById("name_table_body");
        }

        function show(ev){
            ev=ev||window.event;
            point.x += event.clientX;
            point.y += event.clientY;
            initVars();
            var categoryId = event.srcElement.id.replace("1","");
            createXMLHttpRequest();
            xmlHttpRequest.open("GET","showProducts?categoryId="+categoryId,true);
            //创建请求结果处理程序
            xmlHttpRequest.onreadystatechange = callback;
            xmlHttpRequest.send(null);

        }

        function callback() {
            if (xmlHttpRequest.readyState == 4) {
                if (xmlHttpRequest.status == 200) {
                    //var name =xmlHttp.responseXML.getElementsByTagName("name")[0].firstChild.data;

                    setNames( xmlHttpRequest.responseText.split(","));

                } else if (xmlHttpRequest.status == 204){
                    clearNames();
                }
            }
        }

        function setNames(the_names) {
            clearNames();
            var size = the_names.length;
            setOffsets();
            var row, cell, txtNode;
            for (var i = 0; i < size; i++) {
                var nextNode = the_names[i];
                row = document.createElement("tr");
                cell = document.createElement("td");
                cell.onmouseout = function () {
                    this.className = 'mouseOver';
                };
                cell.onmouseover = function () {
                    this.className = 'mouseOut';
                };
                cell.setAttribute("bgcolor", "black");
                cell.setAttribute("border", "0");
                txtNode = document.createTextNode(nextNode);
                cell.appendChild(txtNode);
                row.appendChild(cell);
                nameTableBody.appendChild(row);
            }

        }

        function setOffsets() {

            completeDiv.style.border = "black 1px solid";
            completeDiv.style.left = point.x + 30+"px";
            completeDiv.style.top = point.y+ 30+"px";
        }

        function clearNames() {
            var ind = nameTableBody.childNodes.length;
            for (var i = ind - 1; i >= 0 ; i--) {
                nameTableBody.removeChild(nameTableBody.childNodes[i]);
            }
            completeDiv.style.border = "none";
        }
        function hide(){
            clearNames();
            point.x = 0;
            point.y = 0;
        }



    </script>
    <div id="Welcome">
        <div id="WelcomeContent">
            <s:if test="#session.account!= null }">
                Welcome <s:property value="#session.account.firstName"/>!

            </s:if>
        </div>
    </div>

    <div id="Main">
        <div id="Sidebar">
            <div id="SidebarContent">
                <a href="<s:url action="viewCategory?categoryId=FISH"/>"><img src="images/fish_icon.gif" /></a>
                <br/> Saltwater, Freshwater <br/>
                <a href="<s:url action="viewCategory?categoryId=DOGS"/>"><img src="images/dogs_icon.gif" /></a>
                <br /> Various Breeds <br />
                <a href="<s:url action="viewCategory?categoryId=CATS"/>"><img src="images/cats_icon.gif" /></a>
                <br /> Various Breeds, Exotic Varieties <br />
                <a href="<s:url action="viewCategory?categoryId=REPTILES"/>"><img src="images/reptiles_icon.gif" /></a>
                <br /> Lizards, Turtles, Snakes <br />
                <a href="<s:url action="viewCategory?categoryId=BIRDS"/>"><img src="images/birds_icon.gif" /></a>
                <br /> Exotic Varieties
            </div>
        </div>
        </div>

        <div id="MainImage">
            <div id="MainImageContent">
                <map name="estoremap">
                    <area alt="Birds" id="Birds" coords="72,2,280,250" href="viewCategory?categoryId=BIRDS" shape="RECT" onmouseover="show()" onmouseout="hide()"/>
                    <area alt="Fish" id="Fish" coords="2,180,72,250" href="viewCategory?categoryId=FISH" shape="RECT" onmouseover="show()"onmouseout="hide()"/>
                    <area alt="Dogs" id="Dogs" coords="60,250,130,320" href="viewCategory?categoryId=DOGS" shape="RECT" onmouseover="show()"onmouseout="hide()"/>
                    <area alt="Reptiles" id="Reptiles" coords="140,270,210,340" href="viewCategory?categoryId=REPTILES" shape="RECT" onmouseover="show()"onmouseout="hide()"/>
                    <area alt="Cats" id="Cats" coords="225,240,295,310" href="viewCategory?categoryId=CATS" shape="RECT" onmouseover="show()"onmouseout="hide()"/>
                    <area alt="Birds" id="Birds1" coords="280,180,350,250" href="viewCategory?categoryId=BIRDS" shape="RECT" onmouseover="show()"onmouseout="hide()"/>
                </map>
                <img height="355" src="images/splash.gif" align="middle" usemap="#estoremap" width="350" />
            </div>
        </div>

        <div style="position:absolute;" id="popup">
            <table id="name_table" bgcolor="blue" border="0" cellspacing="0" cellpadding="0"/>
            <tbody id="name_table_body"></tbody>
            </table>
        </div>

        <div id="Separator">&nbsp;</div>
    </div>
</div>
<%@ include file="../common/IncludeBottom.jsp"%>

