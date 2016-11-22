# Als/Utils

Набор классов из пакета [Lib](http://www.parser.ru/lib/lib/).

Включает в себя:
- [Als/Utils/Lib](src/Lib.p)
```ruby
###########################################################################
# cut trailing and leading chars $sChars (whitespaces by default) for $sText
@trim[sText;sChars]


###########################################################################
# print link to $sURI with attributes $uAttr (string or hash) if $sURI specified, otherwise just print $sLabel
@href[sURI;sLabel;uAttr]


###########################################################################
# set location header for redirecting to $sURI and prevent caching
# $.bExternal option makes redirect 
@location[sURI;hParam]


###########################################################################
# check email format
@isEmail[sEmail]


###########################################################################
# print $iNum as a binary string
@dec2bin[iNum;iLength]


###########################################################################
# makes hash of tables from $tData. if $sKeyColumn is not specified 'parent_id' will be used
@createTreeHash[tData;sKeyColumn]


###########################################################################
# print number. options $.iFracLength, $.sThousandDivider and $.sDecimalDivider are available
@numberFormat[dNumber;hParam]


###########################################################################
# looks over hash elements in specified order
@foreach[hHash;sKeyName;sValueName;jCode;sSeparator;sDirection]


###########################################################################
# returns hash with parser version
@getParserVersion[]


###########################################################################
# every odd call returns $sColor1, every even - $sColor2, without parameters - reset sequence
@color[sColor1;sColor2]


###########################################################################
# creates 2-levels hash
@create2LevelHash[uData;sField1;sField2]
```

- [Als/Utils/Doc](src/Doc.p)
```ruby
###########################################################################
# print $xDoc as string without DOCTYPE and XML declaration
@toString[xDoc]
```

- [Als/Utils/Node](src/Node.p)
```ruby
############################################################
# print $xNode as string
@toString[xNode;sRootTag]


############################################################
# print $xNode VALUE as string: <aaa><bbb>ccc</bbb></aaa> => "<bbb>ccc</bbb>"
@valueToString[xNode;sRootTag]


############################################################
# go through all nodes in $hNodeList and execute $jCode
@foreach[hNodeList;hNodeName;sNode;sAttr;jCode;sSeparator]


############################################################
# go through all children for $xParent and execute $jCode
@foreachChild[xParent;hNodeName;sNode;sAttr;jCode;sSeparator]


############################################################
# get children of $xParent as hash
@getChildren[xParent;hNodeName]
```

- [Als/Utils/Attrs](src/Attrs.p)
- [Als/Utils/Cached](src/Cached.p)
- [Als/Utils/Convert](src/Convert.p)
- [Als/Utils/Logger](src/Logger.p)
- [Als/Utils/LibComp](src/LibComp.p)

---

## Installation

```bash
$ composer require als/utils
```

---

## References

- Bugs and feature request are tracked on [GitHub](https://github.com/parser3/als.utils/issues)
