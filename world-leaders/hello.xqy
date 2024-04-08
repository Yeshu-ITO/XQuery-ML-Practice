xquery version "1.0-ml"; 
declare variable $name := "Yeshu";
xdmp:set-response-content-type("text/html; charset=utf-8"),
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',

(: Hello - Comment :)
<h1>{("Hello  World! ", $name, 12, "section 2")}</h1> 


