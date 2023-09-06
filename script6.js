//import prisma from "@/lib/prisma"
import prisma from './lib/prisma.js'

// prisma.post.findMany({ 
//         include: {
//             comments: true,
//         }
//     })
//     .then(data => {
//         data.map( rec => console.log('rec=', rec))
//     })

prisma.post.findUnique({ 
                where: { id: 1 }
            })
            .then(rec => { 
                // console.log('old rec=', rec)

                prisma.post.update({
                    where: { id: 1 },
                    data: { views: rec.views + 1,
                            likes: rec.likes + 1 }
                })
                .then( res => console.log('new res=', res))
            } )
