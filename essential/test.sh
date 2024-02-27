wget -q --spider $URL 
if [ $? -ne 0 ] ; then
  echo "ERROR"
fi
echo "OK"