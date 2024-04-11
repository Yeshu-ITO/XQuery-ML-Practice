xquery version "1.0-ml"; 
module namespace co = "http://marklogic.com/mlu/world-leaders/common"; 
declare namespace wl = "http://marklogic.com/mlu/world-leaders";
declare function in-office() as xs:string
{ 
let $incount := fn:count(/wl:leader/wl:positions/wl:position[1]/wl:enddate/text()[. = "present"]) 
return fn:concat(" (in  office: ", $incount, ")") 
};




