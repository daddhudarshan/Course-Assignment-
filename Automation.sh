
echo "Updating the package"
sudo apt update
echo "Checking appache status"

if  sudo systemctl status apache2; then
echo "Status  active"
 else 
echo "Installing"
sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
fi
echo "Tar file creating"
tar cvzf darshan-httpd-logs-02820021.101010.tar tmp/


aws s3  cp  darshan-httpd-logs-02820021.101010.tar s3://upgard-darshan09
echo " Tar uploaded to s3 bucket" 

cat  inventory.html
echo "httpd-logs ${date} tar ${size}>>index.html"

