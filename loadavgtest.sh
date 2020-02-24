loadavg_output=`/bin/cat /proc/loadavg
loadave1=`echo $loadavg_output | tr -s ' ' | cut -d ' ' -f 1`
echo $loadave1
`
