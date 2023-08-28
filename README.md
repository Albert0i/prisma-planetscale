## Primsa x Planetscale --- A starter guide 


### Prologue 


### I. Initialize project 
```
npm -y 

npm install prisma --save-dev

npx prisma init --datasource-provider mysql 
```

.env
```
DATABASE_URL="mysql://<username>:<password>@<host>:<port>/<dbname>"

SHADOW_DATABASE_URL='mysql://<username>:<password>@<host>/<dbname>'
```


### II. Prepare the schema
prisma/schema.prisma
```
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider          = "mysql"
  url               = env("DATABASE_URL")
  shadowDatabaseUrl = env("SHADOW_DATABASE_URL")
  relationMode      = "prisma"
}

model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String?
  posts Post[]
}

model Post {
  id        Int     @id @default(autoincrement())
  title     String
  content   String?
  published Boolean @default(false)
  author    User    @relation(fields: [authorId], references: [id])
  authorId  Int
}
```


### III. Create database tables 
```
npx prisma migrate dev --name init
```


### IV. Seeding the data
prisma/seed.prisma
```
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
async function main() {
  const alice = await prisma.user.upsert({
    where: { email: 'alice@prisma.io' },
    update: {},
    create: {
      email: 'alice@prisma.io',
      name: 'Alice',
      posts: {
        create: {
          title: 'Check out Prisma with Next.js',
          content: 'https://www.prisma.io/nextjs',
          published: true,
        },
      },
    },
  })
  const bob = await prisma.user.upsert({
    where: { email: 'bob@prisma.io' },
    update: {},
    create: {
      email: 'bob@prisma.io',
      name: 'Bob',
      posts: {
        create: [
          {
            title: 'Follow Prisma on Twitter',
            content: 'https://twitter.com/prisma',
            published: true,
          },
          {
            title: 'Follow Nexus on Twitter',
            content: 'https://twitter.com/nexusgql',
            published: true,
          },
        ],
      },
    },
  })
  console.log({ alice, bob })
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
```


### V. Browse the data
```
npx prisma studio
```


### VI. Summary 


### VII. Reference
1. [Prisma | Quickstart](https://www.prisma.io/docs/getting-started/quickstart)
2. [Prisma | MySQL](https://www.prisma.io/docs/concepts/database-connectors/mysql)
3. [Prisma | Schema](https://www.prisma.io/docs/concepts/components/prisma-schema)
4. [Prisma | Relation mode](https://www.prisma.io/docs/concepts/components/prisma-schema/relations/relation-mode)
5. [Prisma | About the shadow database](https://www.prisma.io/docs/concepts/components/prisma-migrate/shadow-database)
6. [Planetscale | quickstart guide](https://planetscale.com/docs/tutorials/planetscale-quick-start-guide)
7. [Planetscale | Operating without foreign key constraints](https://planetscale.com/docs/learn/operating-without-foreign-key-constraints)
8. [The Sphinx](https://poemuseum.org/the-sphinx/)


### Epilogue


### EOF (2023/08/28)