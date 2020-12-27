#!/bin/bash
#Uncomment one of the following server lines to select the server
#See the list of available mirors at:  http://physionet.mit.edu/mirrors/
SERVER=https://lbcsi.fri.uni-lj.si/tpehgdb/tpehgdb/
#SERVER=http://lbcsi.fri.uni-lj.si/ltstdb/mitdb/
#SERVER=http://physionet.cps.unizar.es/physiobank/database/mitdb/

# The MIT-BIH Arrhythmia Database contains 48 half-hour excerpts of two-channel ambulatory ECG recordings
RECORDS="  
 tpehg1022 
 tpehg1027 
 tpehg1029 
 tpehg1065 
 tpehg1113 
 tpehg1119 
 tpehg1128 
 tpehg1137 
 tpehg1139 
 tpehg1149 
 tpehg1150 
 tpehg1161 
 tpehg1167 
 tpehg1177 
 tpehg1183 
 tpehg1205 
 tpehg1216 
 tpehg1219 
 tpehg1226 
 tpehg1240 
 tpehg1250 
 tpehg1264 
 tpehg1265 
 tpehg1273 
 tpehg1276 
 tpehg1282 
 tpehg1284 
 tpehg1314 
 tpehg1335 
 tpehg1338 
 tpehg1342 
 tpehg1344 
 tpehg1367 
 tpehg1368 
 tpehg1369 
 tpehg1377 
 tpehg1389 
 tpehg1412 
 tpehg1414 
 tpehg1437 
 tpehg1459 
 tpehg1463 
 tpehg1470 
 tpehg1498 
 tpehg1501 
 tpehg1507 
 tpehg1511 
 tpehg1534 
 tpehg1536 
 tpehg1589 
 tpehg1606 
 tpehg1612 
 tpehg1614 
 tpehg1616 
 tpehg1619 
 tpehg1628 
 tpehg1650 
 tpehg1662 
 tpehg1663 
 tpehg1664 
 tpehg1687 
 tpehg1689 
 tpehg1703 
 tpehg1709 
 tpehg1717 
 tpehg1723 
 tpehg1726 
 tpehg1732 
 tpehg1735 
 tpehg1737 
 tpehg1741 
 tpehg1745 
 tpehg1746 
 tpehg1747 
 tpehg1749 
 tpehg553  
 tpehg572  
 tpehg583  
 tpehg584  
 tpehg593  
 tpehg601  
 tpehg615  
 tpehg618  
 tpehg625  
 tpehg639  
 tpehg642  
 tpehg660  
 tpehg667  
 tpehg675  
 tpehg676  
 tpehg681  
 tpehg688  
 tpehg690  
 tpehg718  
 tpehg725  
 tpehg734  
 tpehg737  
 tpehg751  
 tpehg753  
 tpehg766  
 tpehg767  
 tpehg773  
 tpehg778  
 tpehg796  
 tpehg808  
 tpehg821  
 tpehg832  
 tpehg851  
 tpehg854  
 tpehg867  
 tpehg878  
 tpehg902  
 tpehg916  
 tpehg920  
 tpehg927  
 tpehg933  
 tpehg947  
 tpehg966  
 tpehg994  
"

for r in $RECORDS
do

	cd /home/ziva/Desktop/OBBS_2/TL;
#	Use these lines for download with progress indication
	echo "Downloading .hea file for for record $r ..."
	wget -c --progress=dot $SERVER$r".hea" 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
	echo "Downloading .dat file for for record $r ..."
	wget -c --progress=dot $SERVER$r".dat" 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
#	Use these lines for quiet dowload
#	wget -q --progress=bar:force -c $SERVER$r".hea"
#	wget -q --progress=bar:force -c $SERVER$r".atr"
#	wget -q --progress=bar:force -c $SERVER$r".dat"

	echo "Converting recording to Matlab format ..."
	wfdb2mat -r $r 1>&- 2>&-
	echo "--------------------------------------------------"
done
