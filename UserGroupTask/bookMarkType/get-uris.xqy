xquery version "1.0-ml";
let $uris := cts:uris((),(),cts:collection-query("user"))
return (count($uris),$uris)