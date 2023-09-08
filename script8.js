import prisma from './lib/prisma.js'

const res = await prisma.user.findMany({
    where: {
      posts: {
        some: {
          published: true,
        },
      },
    },
    include: {
      posts: {
        where: {
          published: true,
        },
      },
    },
})

console.log('res=', res)
