{
  parse_url(url):: 
    local hasP = std.findSubstr("://", url);
    local protocol = if std.length(hasP) > 0 then std.substr(url, 0, hasP[0]) else "";
    local stripP = if std.length(hasP) > 0 then std.substr(url, hasP[0]+3, std.length(url)) else url;
    local hostpath = std.splitLimit(stripP, "/", 1);
    local host = if std.length(hostpath) > 0 then hostpath[0] else "";
    local hasPort = std.findSubstr(":", host);
    local port = if std.length(hasPort) > 0 then std.substr(host, hasP[0]+1, std.length(host)) else 
      if protocol == "https" then "443" else "80";
    std.prune({
      protocol: protocol,
      host: host,
      port: std.parseInt(port),
      pathname: if std.length(hostpath) > 1 then hostpath[1],
    }),
}

