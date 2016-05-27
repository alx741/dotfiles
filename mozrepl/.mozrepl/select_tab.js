function selectTab(page)
{
    var numTabs=gBrowser.browsers.length;
    var url="";
    for(i=numTabs-1; i>0; i--)
    {
        url= gBrowser.browsers[i].contentDocument.location.href.split(".")[1];
        if(url == page)
        {
            gBrowser.tabContainer.selectedIndex=i;
            return true;
        }
     }

    return false;
}
