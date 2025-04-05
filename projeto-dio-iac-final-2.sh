#!/bin/bash 

echo -e "Script criação de usuários\n"
echo -e "Criando diretórios...\n"

for i in publico adm ven sec;
do
    mkdir /"$i"
    echo -e "Diretório $i criado\n" 
done   

echo -e "Criando Grupos... \n"

for i in GRP_ADM GRP_VEN GRP_SEC 
do 
    groupadd "$i"
    echo -e "Grupo $ criado \n"
done   

for i in carlos maria joao debora sebastiana roberto josefina amanda rogerio 
do
   if [[ "$i" = "joao" || "$i" = "maria" || "$i" = "carlos" ]] then	
       useradd "$i" -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -6 senha123)
       echo -e "Usuário $i criado\n"

   elif [[ "$i" = "debora" || "$i" = "sebastiana" || "$i" = "roberto" ]] then
       useradd "$i" -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -6 senha123)
       echo -e "Usuário $i criado\n"
  
   else 
       useradd "$i" -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -6 senha123)
       echo -e "Usuário $i criado\n"
   fi

done   
   


