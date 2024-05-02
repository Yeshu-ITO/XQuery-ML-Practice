xquery version "1.0-ml";
declare variable $docs := doc("UserBookmark.xml");

for $bookmark in $docs/user/bookmarks/bookmark
return $bookmark
      if(exists($bookmark/widgetTitle) and exists($bookmark/uniqueId) and not(exists($bookmark/bookMarkType)))
      then let $booktype := if(exists(collection('usergrouplayout')[dashboarddetail/widgets/widget/uniqueId eq $bookmark/uniqueId/text()]))
                            then "userGroup"
                            else if(exists(collection('uilayout')[dashboarddetail/widgets/widget/uniqueId eq $bookmark/uniqueId/text()]))
                                 then "user"
                                 else ()
            return xdmp:node-insert-after($bookmark/uniqueId, element bookMarkType{$booktype})
      else ()