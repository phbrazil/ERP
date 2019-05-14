var xmlHttp1;
function searchSuggestProjectCode(str)
{
    if (typeof XMLHttpRequest != "undefined")
    {
        xmlHttp1 = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttp1 == null)
    {
        alert("Browser does not support XMLHTTP Request");
        return
    }
    var url = "SearchCode.jsp";
    url += "?search=" + str;
    xmlHttp1.onreadystatechange = stateChange1;
    xmlHttp1.open("GET", url, true);
    xmlHttp1.send();
}
function stateChange1()
{
    if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete")
    {
        var strResponse = xmlHttp1.responseText;
        if (strResponse != "")
        {

            //Split response into array  
            var arrResponse = strResponse.split("brcode");
            var arrLen = arrResponse.length;

            for (i = 0; i < arrLen; i++) {

                document.getElementById("hintcode").innerHTML = arrResponse[0];

                if (strResponse.includes("Code in use")) {
                    document.getElementById("projectcode").value = 0;

                }

            }
        }
    }

}
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


