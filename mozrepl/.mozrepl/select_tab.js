function selectTab(page)
{
    var numTabs=gBrowser.browsers.length;
    var url="";
    for(i=0; i<numTabs-1; i++)
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
