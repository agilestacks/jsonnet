{
  parse_url(url):: 
    local hasP = std.findSubstr("://", url);
    local stripP = if std.length(hasP) > 0 then std.substr(url, hasP[0]+3, std.length(url)) else url;
    local hostpath = std.splitLimit(stripP, "/", 1);
    {
      protocol: if std.length(hasP) > 0 then std.substr(url, 0, hasP[0]),
      host: if std.length(hostpath) > 0 then hostpath[0],
      pathname: if std.length(hostpath) > 1 then hostpath[1],
    },
}
