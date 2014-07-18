[ -f /etc/redhat-release ] && . ./redhat-network
[ -f /etc/debian_version ] && . ./debian-network
[ `uname` == "SunOS" ] && . ./solaris-network

shownetwork()
{
    for thisnic in $*
    do
        thisip=`getipaddr $thisnic`
        case $? in
            $SUCCESS) echo "the IPAddress configured for $thisnic is $thisip" ;;
            $_WRONG_PLATFORM) echo "This does not seem to be running " "on the expected platform" ;;
            $_NO_IP) echo "No IP Address defined for $thisnic" ;;
            $_NO_CONFIG) echo "No configuration found for $thisnic" ;;
            esac
        done
}
