import prisma from './lib/prisma.js'

const res = await prisma.post.groupBy({
    select: {
        userId: true
    }, 
    by: ['userId'],
    _sum: {
        likes: true
    },
    orderBy: {
        _sum: {
            likes: 'desc',
          },
    }
})

console.log('res=', res)
