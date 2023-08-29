import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
import json from './TBUNTUSE.json' assert {type: 'json'}

async function main() {  
  json.tbuntuse.map( async rec => {    
        const result = await prisma.tbuntuse.upsert( {
          where: { huntuse: rec.huntuse },
          update: {},
          create: rec 
        } )
        console.log('result=', result)
    } )
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })

/*
    Prisma Doc | Seeding your database
    https://www.prisma.io/docs/guides/migrate/seed-database

    Import a JSON file in JavaScript and Node.js (ES6 Modules)
    https://bobbyhadz.com/blog/javascript-import-json-file#import-a-json-file-in-nodejs

    npx prisma db seed 
*/