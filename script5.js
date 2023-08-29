import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  //const users = await prisma.$queryRaw`SELECT * FROM users;`
  //const users = await prisma.$queryRaw`SELECT * FROM users WHERE name='Bob';`
  const users = await prisma.$queryRaw`SELECT * FROM users, posts WHERE users.id = posts.userId AND name='Bob';`

  console.dir(users, { depth: null })
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
    Raw database access
    https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access
*/

// node script5.js