
import { PrismaClient } from "@prisma/client";

const prisma = global.prisma || new PrismaClient({
        log: [{
          emit: 'event',
          level: 'query',
        },
        {
          emit: 'event',
          level: 'error',
        }],
      });

if (process.env.NODE_ENV === "development")
{
  global.prisma = prisma;
  prisma.$on('query', (e) => {
    console.log()
    console.log('Query: ' + e.query)
    console.log('Params: ' + e.params)
    console.log('Duration: ' + e.duration + 'ms')
    // console.log('Timestamp: ' + e.timestamp)
    // console.log('Target: ' + e.target)
    // console.log('Message: ' + e.message)
  })
}

export default prisma;

/*
   Database as Code with PlanetScale and Prisma - Taylor Barnett - (Next.js Conf 2021)
   https://youtu.be/5JpKZfPx-1k

   How to see executed SQL queries? #3967
   https://github.com/prisma/prisma/discussions/3967

   Prisma Client API reference
   https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#prismaclient

   Configuring logging
   https://www.prisma.io/docs/concepts/components/prisma-client/working-with-prismaclient/logging
*/