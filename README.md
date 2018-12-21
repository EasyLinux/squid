# Squid

Conteneur Squid pour les formations,
ce conteneur permet d'optimiser les acc√s r√seaux.

Pour le lancer :

`docker run -d -p 8080:8080 -e PROXYIP=<ip> -e PROXYPORT=<port> [-e PROXYUSR=<user> -e PROXYPWD=<pwd>] easylinux/squid`

Avec 
* ip l'adresse du proxy externe
* port le port d'√coute du proxy
* user l'utilisateur (optionnel)
* pwd  mot de passe (optionnel)

