EDITOR="vim"

prompt = function(){
    var datab = "";

    if (typeof db == 'undefined'){
        datab = "NO DB";
    }else{
        datab = db;
    }

    // If this comment is removed, mongo breaks. WTF?
    return "\n[" + datab + "]    (╯°□°）╯- ┻━┻    ";
};
