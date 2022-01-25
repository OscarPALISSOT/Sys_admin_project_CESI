# projet-SI CESI A3
setupRoot
`wget -qO- https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/setupRoot.sh | bash`

setupWeb
`wget -qO- https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/setupWeb.sh | sudo bash`

setupTelecom
`wget -qO- https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/setupTelecom.sh | sudo bash`

setupVPN
`sudo su -c "bash <(wget -qO- https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/setupVPN.sh)" root`

setupClientVPN
`sudo su -c "bash <(wget -qO- https://raw.githubusercontent.com/OscarPALISSOT/projet-SI/main/setupClientVPN.sh)" root`
