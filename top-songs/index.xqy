xquery version "1.0-ml";
declare namespace ts="http://marklogic.com/MLU/top-songs";

declare function local:result-controller()
{
	if(xdmp:get-request-field("q"))
	then "Search results here"
	else 	if(xdmp:get-request-field("uri"))
			then local:song-detail()  
			else local:default-results()
};

declare function local:default-results()
{
(for $song in /ts:top-song 		 
		order by $song//ts:weeks/@last descending
		return (<div>
			<div class="songname">"{$song//ts:title/text()}" by {$song//ts:artist/text()}</div>
				<div class="week"> ending week: {fn:data($song//ts:weeks/@last)} 
				(total weeks: {fn:count($song//ts:weeks/ts:week)})</div>	
			<div class="genre">genre: 						  {fn:lower-case(fn:string-join(($song//ts:genres/ts:genre),", "))}</div>
			<div class="description">{fn:tokenize($song//ts:descr, " ") [1 to 70]} ...&#160;
			<a href="index.xqy?uri={xdmp:url-encode(fn:base-uri($song))}">[more]</a>
			</div>
			</div>)	   	
		)[1 to 10]
};

declare function local:song-detail()
{
	let $uri := xdmp:get-request-field("uri")
	let $song := fn:doc($uri) 
	return <div>
		<div class="songnamelarge">"{$song/ts:top-song/ts:title/text()}"</div>
		{if ($song/ts:top-song/ts:album/@uri) then <div class="albumimage"><img src="get-file.xqy?uri={xdmp:url-encode($song/ts:top-song/ts:album/@uri)}"/></div> else ()}
		<div class="detailitem">#1 weeks: {fn:count($song/ts:top-song/ts:weeks/ts:week)}</div>	
		<div class="detailitem">weeks: {fn:string-join(($song/ts:top-song/ts:weeks/ts:week), ", ")}</div>	
		{if ($song/ts:top-song/ts:genres/ts:genre) then <div class="detailitem">genre: {fn:lower-case(fn:string-join(($song/ts:top-song/ts:genres/ts:genre), ", "))}</div> else ()}
		{if ($song/ts:top-song/ts:artist/text()) then <div class="detailitem">artist: {$song/ts:top-song/ts:artist/text()}</div> else ()}
		{if ($song/ts:top-song/ts:album/text()) then <div class="detailitem">album: {$song/ts:top-song/ts:album/text()}</div> else ()}
		{if ($song/ts:top-song/ts:writers/ts:writer) then <div class="detailitem">writers: {fn:string-join(($song/ts:top-song/ts:writers/ts:writer), ", ")}</div> else ()}
		{if ($song/ts:top-song/ts:producers/ts:producer) then <div class="detailitem">producers: {fn:string-join(($song/ts:top-song/ts:producers/ts:producer), ", ")}</div> else ()}
		{if ($song/ts:top-song/ts:label) then <div class="detailitem">label: {$song/ts:top-song/ts:label}</div> else ()}
		{if ($song/ts:top-song/ts:formats/ts:format) then <div class="detailitem">formats: {fn:string-join(($song/ts:top-song/ts:formats/ts:format), ", ")}</div> else ()} 
		{if ($song/ts:top-song/ts:lengths/ts:length) then <div class="detailitem">lengths: {fn:string-join(($song/ts:top-song/ts:lengths/ts:length), ", ")}</div> else ()}
		{if ($song/ts:top-song/ts:descr) then <div class="detailitem">{$song/ts:top-song/ts:descr}</div> else ()}
		</div>
};

xdmp:set-response-content-type("text/html; charset=utf-8"),
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Top Songs</title>
<link href="css/top-songs.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="wrapper">
<div id="header"><a href="index.xqy"><img src="images/banner.jpg" width="918" height="153" border="0"/></a></div>
<div id="leftcol">
  <img src="images/checkblank.gif"/>facet content here<br />
  <br />
  <div class="purplesubheading"><img src="images/checkblank.gif"/>check your birthday!</div>
  <form name="formbday" method="get" action="index.xqy" id="formbday">
    <img src="images/checkblank.gif" width="7"/>
    <input type="text" name="bday" id="bday" size="15"/> 
    <input type="submit" id="btnbday" value="go"/>
  </form>
  <div class="tinynoitalics"><img src="images/checkblank.gif"/>(e.g. 1965-10-31)</div>
</div>
<div id="rightcol">
  <form name="form1" method="get" action="index.xqy" id="form1">
  <div id="searchdiv">
    <input type="text" name="q" id="q" size="50"/><button type="button" id="reset_button" onclick="document.getElementById('bday').value = ''; document.getElementById('q').value = ''; document.location.href='index.xqy'">x</button>&#160;
    <input style="border:0; width:0; height:0; background-color: #A7C030" type="text" size="0" maxlength="0"/><input type="submit" id="submitbtn" name="submitbtn" value="search"/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<a href="advanced.xqy">advanced search</a>
  </div>
  <div id="detaildiv">
  {  local:result-controller()  }  	
  </div>
  </form>
</div>
<div id="footer"></div>
</div>
</body>
</html>
