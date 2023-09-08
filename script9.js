import prisma from './lib/prisma.js'

const res = await prisma.post.aggregate({ 
    where: {
        id: 1
    }, 
    _sum: { 
        likes: true
    }, 
    _max: {
        likes: true
    },
    _min: {
        likes: true
    }
 })

console.log('res=', res)
