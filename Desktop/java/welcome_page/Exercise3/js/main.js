var first_name = "David".length;
var last_name = "Tal".length;

function CreateObjects()
{
    var articles = "";
    for(i=0; i<(first_name*last_name);i++)
    {
        articles +="<article></article>";
    }
    var main = document.getElementsByTagName("main")[0];
    main.innerHTML = articles;
    ShowLetter();
}

function ShowLetter()
{
var first=document.getElementsByTagName("article")[0];
    first.onmouseover=function () {
        first.style.backgroundImage="url(images/D-letter.png)";
    }
    first.onmouseout=function () {
        first.style.backgroundImage="";
    }
}

function First_name_background(){
    for(i=0; i<(first_name);i++)
    {
        var art=document.getElementsByTagName("article")[i];
        art.style.backgroundColor= "#3f3f3f";
    }
}
function Reset_backgrounds(){
    for(i=0; i<(first_name);i++)
    {
        var art=document.getElementsByTagName("article")[i];
        art.style.backgroundColor= "";
    }
}