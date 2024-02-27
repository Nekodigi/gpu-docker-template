wget -q --spider google.com 
if [ $? -ne 0 ] ; then
  echo "ERROR"
fi
echo "OK"