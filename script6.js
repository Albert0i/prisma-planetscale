//import prisma from "@/lib/prisma"
import prisma from './lib/prisma.js'

prisma.post.findMany({ 
        include: {
            comments: true,
        }
    })
    .then(data => {
        data.map( rec => console.log('rec=', rec))
    })
