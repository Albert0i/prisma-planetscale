import prisma from './lib/prisma.js'

const res = await prisma.user.findUnique({
        where: { id: 2 }, 
        select: { 
                name: true, 
                email: true,
                posts: {
                    select: {
                                id: true,
                                title: true,
                                content: true, 
                                categorytopost: true, 
                                comments: true,
                                views: true,
                                likes: true,
                                published: true
                            }
                    }
                }
            })

console.log('res=', res)
res.posts.map(post => {
    post.comments.map(comment => console.log('comment=', comment))
})
