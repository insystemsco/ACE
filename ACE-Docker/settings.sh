# Write appsettings.Production.json to screen
clear
echo ""
echo ""
echo "=========================================================="
echo ""
echo "    $(docker logs ace-rabbitmq | grep UserName)"
echo "    $(docker logs ace-rabbitmq | grep Password)"
echo "    $(docker logs ace-nginx | grep Thumbprint)"
echo "    $(docker logs ace-sql | grep ApiKey)"
echo "    $(docker logs ace-sql | grep StartAceSweep)"
echo "    $(docker logs ace-sql | grep DownloadAceFile)"
echo "    $(docker logs ace-sql | grep DefaultConnection)"
echo ""
echo "=========================================================="
echo ""
echo ""

# Provide configuration details for PowerShell Module
echo "==============================================================="
echo "|        Thank you for provisioning ACE with Docker!!         |"
echo "|  Please use the following information to interact with ACE  |"
echo "==============================================================="
echo "" 
echo "  \$settings = @{"
echo "    Uri        = 'https://[DOCKER HOST IP HERE]'"
IFS='"' read -r -a array <<< "$(docker logs ace-sql | grep Api)"
echo "    ApiKey     = '${array[3]}'"
IFS='"' read -r -a array <<< "$(docker logs ace-nginx | grep Thumbprint)"
echo "    Thumbprint = '${array[3]}'"
echo "  }"
echo ""
echo "=============================================================="
echo ""
echo ""