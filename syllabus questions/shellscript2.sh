x=$(lsb_release -a)
echo "os details : $x"
echo "available shells :"
echo $(cat /etc/shells)
echo "mouse settings :"
echo $(xinput --list --short)
echo "cpu  information :"
echo $(lscpu)
echo "memory info :"
echo $(free -m)
echo "file system :"
echo $(sudo fdisk -l)
