
import { PrismaClient } from "@prisma/client";

const prisma = global.prisma || new PrismaClient();

if (process.env.NODE_ENV === "development")
    global.prisma = prisma;

export default prisma;

/*
   Database as Code with PlanetScale and Prisma - Taylor Barnett - (Next.js Conf 2021)
   https://youtu.be/5JpKZfPx-1k
*/