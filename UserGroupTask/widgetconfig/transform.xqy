xquery version "1.0-ml";
declare variable $URI := cts:uris((),(),cts:collection-query("widgetconfig"));

for $docs in doc($URI)
for $buttonAction in $docs/widgetconfig/serviceWidgetConfig/buttonActions/buttonAction
for $navigationDetails in $buttonAction/navigationDetails
return $navigationDetails
    if(exists( $navigationDetails/entry[key eq "moduleCode"]) and not($navigationDetails/entry[key eq "moduleCode"]/value[. eq ""]))
       then xdmp:node-insert-child($navigationDetails, (element entry {element key{"userGroup"},element value{"TestUser"}}))
       else if(exists( $navigationDetails/entry[key eq "moduleCode"]))
            then xdmp:node-insert-child($navigationDetails, (element entry {element key{"userGroup"},element value{""}}))
            else()