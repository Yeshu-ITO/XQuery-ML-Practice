let $uris := cts:search(collection("widgetconfig"),())[widgetconfig/widgetType[. eq "servicewidget"] and widgetconfig/serviceWidgetConfig/serviceName[. eq "dataservice"]]/document-uri(.)
where exists(doc($uris)/widgetconfig/serviceWidgetConfig/buttonActions/buttonAction)
return $uris