xquery version "1.0-ml";
declare namespace wl = "http://marklogic.com/mlu/world-leaders"; 
xdmp:set-response-content-type("text/html; charset=utf-8"),
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>World Leaders</title>
<link href="css/world-leaders.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrapper">
  <a href="index.xqy"><img src="images/logo.gif" width="427" height="76" /></a><br />
  <span class="currently">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Currently in database: xx</span><br />
  <br />
  <br />
  <br />
  <div id="tabs"><a href="index.xqy"><img src="images/byname_selected.gif" width="121" height="30" /></a><a href="bycountry.xqy"><img src="images/bycountry.gif" width="121" height="30" /></a><a href="bydate.xqy"><img src="images/bydate.gif" width="121" height="30" /></a><a href="search.xqy"><img src="images/search.gif" width="121" height="30" /></a></div>
  <div id="graybar"></div>
  <div id="content">
   <table cellspacing="0">
    <tr>
      <th>F Name</th>
      <th>L Name</th>
	  <th>Country</th>
      <th>Title</th>
	  <th>H of State</th>
      <th><p>H of Govt</p></th>
      <th>Start Date</th>
      <th>End Date</th>
      <th>Age</th>
      <th>Gender</th>
    </tr>

    <tr>
      <td colspan="10"><hr/></td>
    </tr>

    <tr>
      <td><b>{/wl:leader[wl:country eq "India"]/wl:name/wl:firstname/text()}</b></td>
      <td><b>{/wl:leader[wl:country eq "India"]/wl:name/wl:lastname/text()}</b></td>
	    <td>{/wl:leader/wl:country[. eq "India"]/string()}</td>
      <td>{/wl:leader[wl:country eq "India"]/wl:positions/wl:position[1]/wl:title/text()}</td>
      <td>{fn:string(/wl:leader[wl:country eq "India"]/wl:positions/wl:position[1]/@hos)}</td>
      <td>{fn:string(/wl:leader[wl:country eq "India"]/wl:positions/wl:position[1]/@hog)}</td>
      <td>{/wl:leader[child::wl:country eq "India"]/descendant::wl:position[1]/wl:startdate/text()}</td>
      <td>{/wl:leader[child::wl:country eq "India"]/descendant::wl:position[1]/wl:enddate/text()}</td>
      <td><!--age--></td>
      <td>{/descendant::wl:gender[preceding-sibling::wl:country eq "India"]/text()}</td>
    </tr>

    <tr>
      <td colspan="10" class="summary">&nbsp;</td>
    </tr>
	
  </table>
 </div>
</div>
</body>
</html>