###########################################################################
# $Id: LibComp.p,v 1.8 2010-11-18 23:43:37 misha Exp $
###########################################################################


###########################################################################
# load and process file $sFileName
@include[sFileName][fFile]
^if(def $sFileName && -f $sFileName){
	$fFile[^file::load[text;$sFileName]]
	^if(def $caller.self){
		$result[^process[$caller.self]{^taint[as-is][$fFile.text]}]
	}{
#		backward
		$result[^process{^taint[as-is][$fFile.text]}]
	}
}{
	$result[]
}
#end @include[]



###########################################################################
# measure and print width="" height="" for image if exist
@imageSize[sFileName][fImage]
^if(def $sFileName && -f $sFileName){
	$fImage[^image::measure[$sFileName]]
	$result[ width="$fImage.width" height="$fImage.height" ]
}{
	$result[]
}
#end @imageSize[]



###########################################################################
# print <img src="..." width="..." height="..." $sAttr /> if image with $sFileName exist
@image[sFileName;uAttr][fImage;sKey;sValue]
^if(def $sFileName && -f $sFileName){
	$fImage[^image::measure[$sFileName]]
	$result[<img src="$fImage.src" width="$fImage.width" height="$fImage.height"^if(def $uAttr){^Als/Utils/Node:printAttributes[$uAttr;$.src[]$.width[]$.height[]]}/>]
}{
	$result[]
}
#end @image[]



###########################################################################
@getIconPathByExt[sFileExt;sIconSuffix][sIconDir;sFileName]
$sIconDir[/i/icons]
$sFileName[$sIconDir/^if(def $sFileExt){^sFileExt.lower[]}${sIconSuffix}.gif]
$result[^if(def $sFileName && -f $sFileName){$sFileName}{$sIconDir/none^if(def $sIconSuffix){^sIconSuffix.lower[]}.gif}]
#end @getIconPathByExt[]



###########################################################################
@getIconByExt[sFileExt;sIconSuffix;sImageAttr]
$result[^image[^getIconPathByExt[$sFileExt;$sIconSuffix];border="0"^if(def $sImageAttr){ $sImageAttr}]]
#end @getIconByExt[]



###########################################################################
@getIconByFile[sFileName;sIconSuffix;sImageAttr]
$result[^getIconByExt[^file:justext[$sFileName];$sIconSuffix;$sImageAttr]]
#end @getIconByFile[]




###########################################################################
# operator look over all hash elements with specified order
# variables have different search method so we can't just $foreach[$Lib:foreach] in @auto[]
@foreach[hash;key;value;code;separator;direction][_keys;_int]
^if($hash is "hash"){
	$direction[^if(def $direction){$direction}{asc}]
	$_keys[^hash._keys[]]
	$_int(0)
	^_keys.menu{^if(^_keys.key.int(0)){$_int(1)}}
	^if($_int){
		^_keys.sort($_keys.key)[$direction]
	}{
		^_keys.sort{$_keys.key}[$direction]
	}
	^_keys.menu{
		$caller.[$key][$_keys.key]
		$caller.[$value][$hash.[$_keys.key]]
		$code
	}[$separator]
}{
	^throw[LibComp;foreach;Variable must be hash]
}
#end @foreach[]



###########################################################################
# were moved to others static classes


#####################################
@color[sColor1;sColor2]
$result[^Als/Utils/Lib:color[$sColor1;$sColor2]]



#####################################
@trim[sText;sChars]
$result[^Als/Utils/Lib:trim[$sText;$sChars]]



#####################################
# variables have different search method so we can't just $run_time[$Erusage:measure] in @auto[]
@run_time[jCode;sVarName][h]
^if(def $sVarName){
	$result[^Als/Erusage:measure{$jCode}[h]]
	$caller.[$sVarName][$h]
}{
	$result[$jCode]
}



#####################################
@fileSize[sFileName;hName;sDecimalDivider]
$result[^Als/FileSystem:printFileSize[^FileSystem:getFileSize[$sFileName];$.hName[$hName]$.sDecimalDivider[$sDecimalDivider]]]



#####################################
@fileCopy[sFileFrom;sFileTo]
$result[^Als/FileSystem:fileCopy[$sFileFrom;$sFileTo]]



#####################################
@dirCopy[sDirFrom;sDirTo;hParam]
$result[^Als/FileSystem:dirCopy[$sDirFrom;$sDirTo;$hParam]]



#####################################
@href[sUrl;sLabel;sAttr]
$result[^Als/Utils/Lib:href[$sUrl;$sLabel;$sAttr]]



#####################################
@location[sUrl;hParam]
$result[^Als/Utils/Lib:location[$sUrl;$hParam]]



#####################################
@isEmail[sEmail]
$result(^Als/Utils/Lib:isEmail[$sEmail])



#####################################
@node2str[nNode;sRootTag]
$result[^Als/Utils/Node:valueToString[$nNode;$sRootTag]]



#####################################
@nodeToStr[nNode;sRootTag]
$result[^Als/Utils/Node:valueToString[$nNode;$sRootTag]]



#####################################
@doc2str[xDoc]
$result[^Als/Utils/Doc:toString[$xDoc]]



#####################################
@dec2bin[iNum;iLength][i]
$result[^Als/Utils/Lib:dec2bin($iNum;$iLength)]



#####################################
@createTreeHash[tData;sKey]
$result[^Als/Utils/Lib:createTreeHash[$tData;$sKey]]



#####################################
@numberFormat[dNumber;hParam]
$result[^Als/Utils/Lib:numberFormat[$dNumber;$hParam]]



#####################################
@setExpireHeaders[uDate]
$result[^Als/Dtf:setExpireHeaders[$uDate]]



#####################################
@getParserVersion[]
$result[^Als/Utils/Lib:getParserVersion[]]




###########################################################################
# for compatibility with old name convention


#####################################
@image_size[sFileName]
$result[^imageSize[$sFileName]]



#####################################
@file_size[sFileName;hName;sDecimalDivider]
$result[^Als/FileSystem:printFileSize[^FileSystem:getFileSize[$sFileName];$.hName[$hName]$.sDecimalDivider[$sDecimalDivider]]]



#####################################
@file_copy[sFileFrom;sFileTo]
$result[^Als/FileSystem:fileCopy[$sFileFrom;$sFileTo]]



#####################################
@dir_copy[sDirFrom;sDirTo;hParam]
$result[^Als/FileSystem:dirCopy[$sDirFrom;$sDirTo;$hParam]]



#####################################
@is_email[sEmail]
$result(^Als/Utils/Lib:isEmail[$sEmail])



#####################################
@number_format[dNumber;sThousandDivider;sDecimalDivider;iFracLength]
$result[^Als/Utils/Lib:numberFormat($dNumber)[
	$.sThousandDivider[$sThousandDivider]
	$.sDecimalDivider[$sDecimalDivider]
	$.iFracLength($iFracLength)
]]
