// JavaScript Document
//计算单个小计
function EveryCount()
{
    var index=window.event.srcElement.parentElement.parentElement.rowIndex;
    var a=document.getElementById("test").rows(index).cells(1).innerText;
    var b=document.getElementById("Num"+index).value;
    var c=parseFloat(a)*parseFloat(b);
    document.getElementById("test").rows(index).cells(3).innerText=c;
    TotalCount();
    updateOrderCookie();//修改cookies中保存的数量
}
//计算总计
function TotalCount()
{
    var rowscount=document.getElementById("test").rows.length;
    var sum=0;
    for(var i=1;i<=(parseInt(rowscount)-1);i++)
    {
        var littecount=document.getElementById("test").rows(i).cells(3).innerText;
        sum=parseFloat(sum)+parseFloat(littecount);
    }
    document.getElementById("total").innerText=sum;
}
//<--Start--将订单数据写入div
function WriteOrderInDiv()
{
    var gwc="<table id='test' style='border:0px;' ><tr><td width='40%'>商品名称</td><td>单价(￥)</td><td>数量</td><td>小计</td></tr>";
    var OrderString=unescape(ReadOrderForm('24_OrderForm'));//获取cookies中的购物车信息
    //document.write(OrderString);
    var strs= new Array(); //定义一个数组，用于存储购物车里的每一条信息
    var OneOrder="";
    //strs=OrderString.split("%7C");//用|分割出购物车中的每个产品
    strs=OrderString.split("|");//用|分割出购物车中的每个产品
    for (i=1;i<strs.length ;i++ )  
    {
        gwc+="<tr>";
        //OneOrder=strs[i].split("%26");
        OneOrder=strs[i].split("&");
        for (a=1;a<OneOrder.length ;a++ )  
        {
            if(a!=3)
            {
                gwc+="<td>";
                gwc+=OneOrder[a];
                gwc+="</td>";
            }
            else
            {
                gwc+="<td id='dd'>";
                gwc+="<input title='填写想购买的数量,请使用合法数字字符' style='width:10px;' id='Num"+i+"' type='text' onkeyup='EveryCount();'value='"+OneOrder[a]+"'>";
                gwc+="</td>";
            }
            //document.getElementById("gwc").innerHTML+=OneOrder[a]+"<br/>";//每个产品的每个属性分割后字符输出
        }
        gwc+="<td>";
        gwc+=OneOrder[2]*OneOrder[3];
        gwc+="</td>";
        gwc+="</tr>";
        //document.getElementById("gwc").innerHTML+=strs[i]+"<br/>";  //每个产品分割后的字符输出
    }
    gwc+="</table>";
    document.getElementById("Cart").innerHTML=gwc;
    TotalCount();
}
//<--End--将订单数据写入div
//--Start--展开/收缩购物车
function show(id)
{
    if (document.getElementById(id).style.display=="") 
    {
        document.getElementById(id).style.display='none';
    } else {
        document.getElementById(id).style.display='';
    }
}
//<--End--展开/收缩购物车
//<--Start--从cookie中读出订单数据的函数
function ReadOrderForm(name)
{
    var cookieString=document.cookie;
    if (cookieString=="")
    {
        return false;
    }
    else
    {
        var firstChar,lastChar;
        firstChar=cookieString.indexOf(name);
        if(firstChar!=-1)
        {
            firstChar+=name.length+1;
            lastChar = cookieString.indexOf(';', firstChar);
            if(lastChar == -1) lastChar=cookieString.length;
            return cookieString.substring(firstChar,lastChar);
        }
        else
        {
            return false;
        }
    }  
}
//-->End

//<--清空购物车
function clearOrder() 
{
    var Then = new Date();
    document.cookie="24_OrderForm='';expires=" + Then.toGMTString();
}
//<--End//<--Start--添加商品至购物车的函数,参数(商品编号,商品名称，商品数量，商品单价)
function SetOrderForm(item_no,item_name,item_amount,item_price)
{
	//alert("item_no:" + item_no + ",item_name:" + item_name + ",item_amount:" + item_amount + ",item_price:" + item_price);
    var cookieString=document.cookie;
    if (cookieString.length>=4000)
    {
        alert("您的订单已满\n请结束此次订单操作后添加新订单！");
    }
    else if(item_amount<1||item_amount.indexOf('.')!=-1)
    {
        alert("数量输入错误！");
    }
    else
    {
        var mer_list=ReadOrderForm('24_OrderForm');
        var Then = new Date();
        Then.setTime(Then.getTime()+30*60*1000);
        var item_detail="|"+item_no+"&"+item_name+"&"+item_price+"&"+item_amount;
        if(mer_list==false)
        {
            document.cookie="24_OrderForm="+escape(item_detail)+";expires=" + Then.toGMTString();
            //alert("“"+item_name+"”\n"+"已经加入您的订单！");
        }
        else
        {
            if (mer_list.indexOf(escape(item_no))!=-1)
            {
                //alert('此商品您已添加\n请进入订单修改数量！')
            }
            else
            {
                document.cookie="24_OrderForm="+mer_list+escape(item_detail)+";expires=" + Then.toGMTString();
                //alert("“"+item_name+"”\n"+"已经加入您的订单！");
            }
        }
    }//*/
}
//-->End
//<--Start--修改数量后，更新cookie的函数
function updateOrderCookie()
{
    var rowscount=document.getElementById("test").rows.length;
    var item_detail="";
    for(var i=1;i<=(parseInt(rowscount)-1);i++)
    {
        item_detail+="|"+document.getElementById("test").rows(i).cells(0).innerText+"&"+document.getElementById("test").rows(i).cells(0).innerText+"&"+document.getElementById("test").rows(i).cells(1).innerText+"&"+document.getElementById("Num"+i).value;
        // document.write(document.getElementById("test").rows(i).cells(1).innerText);
    }
    var Then = new Date();
    Then.setTime(Then.getTime()+30*60*1000);
    document.cookie="24_OrderForm="+escape(item_detail)+";expires=" + Then.toGMTString();
}
//<--End--订单更新
