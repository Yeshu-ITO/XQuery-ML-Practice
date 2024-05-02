xquery version "1.0-ml";
declare variable $URI := cts:uris((),(),cts:collection-query("masterPlannerConfig"));
for $docs in doc($URI)
for $navigationConfig in  $docs/masterPlannerConfig/navigationConfigs
return $navigationConfig
return xdmp:node-insert-after($navigationConfig/onFailure, element userGroup{"TestData"})

