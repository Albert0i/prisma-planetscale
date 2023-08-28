
npm -y 

npm install prisma --save-dev

npx prisma init --datasource-provider mysql 

npx prisma migrate dev --name init

npx prisma studio


[Prisma Doc | Quickstart](https://www.prisma.io/docs/getting-started/quickstart)