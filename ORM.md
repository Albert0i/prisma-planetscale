
## "The Myth and Riddle of ORM"

### Prologue
I was both delighted and agitated upon seeing her. She was born on late '80s of last century, I heard of and knew of her since I was in the University. Speaking of her beautifullines, it was simplicity on one side and complexity on the other. Difficult to comprehend at first glance but even more abstruse to apprehend on second thought. Her visage has evolved over times but with enriched youthfulness then before. Communication between us is done via more or less the same language since acquaintance. She never betrays me, never fails me in any aspects of my working life. As you may guess, she is ... 


### I. Do I *really* need an [ORM](https://www.mongodb.com/developer/products/mongodb/mongodb-orms-odms-libraries/)? (TL;DR)
In the 1980s and ’90s, relational databases grew increasingly dominant, crowned and coined the mainstream in application development till today. Most seasoned programmers were highly opinionated against [ORM](https://www.prisma.io/dataguide/types/relational/what-is-an-orm): 
- Since SQL is *de facto* standard in data manipulation. Why bother to learn another ways? 
- If SQL knowledge is vital, why bother to learn another tools? 
- The popularity of NoSQL doesn't impede or hazard the orthodoxy of relational database and so does SQL. 
- If we can't get rid of it, get alone with it. 

Virtually and effectively, SQL is the standard way to manipulate database. But may not be proper or most efficient way to handle data especially for object-oriented languages. Most popular modern programming languages derive from [C++](https://www.w3schools.com/cpp/cpp_intro.asp), which instead retrofitted somewhat from [Smalltalk](https://en.wikipedia.org/wiki/Smalltalk). Traditionally, relational database consists of tables, indexex, stored procedures and functions but has no idea of object whatsoever. See the glitch? 

The more difference in abstraction levels, the more modulation is necessary, ie. to convert objets to and fro table rows required human intervention, because they are not *in the same row*. In addition, operations to object are conceptionally and practically different from those to database table. To alleviate mental labour, one always introduces an *abstraction layer* so that our programs can operate on the same level, so that they work smoothly. The appellation of abstraction layer is commonly known as "data access layer" or something like that. DAL wraps function calls and transform to database calls; read data from database and convert them to object and return it to the invokers. 

Levels of abstraction are indispensable means in programming, as it greatly reduces the complexity of tasks so that we can focus on the very issue on hand. 

The success of NoSQL databases also hinges on it's higher abstraction level. [MongoDB](https://www.mongodb.com/) is a typical NoSQL implementation with intrinsic capabilities not seen or not easy to implemented on relational database. One imperceptible feature is the seamless integration with the host programming language. Operations on language bear much similarity to database. Objects are of the same notation. 

SQL knowledge is crucial, I can't fancy any chance of it's decline in the future. Diversified programming paradigms intense the particularity of tools, ie. every tool has it's own use, different portions of [software stacks](https://www.mongodb.com/basics/technology-stack) require different technique. But absbraction level tends to be unified. 


### II. The other extreme
> "Stop touting these hideously disgusting ideas... I am quite used to maintain my code alone with SQL statements and don't want to change till I die..." 

Old-school PHP developers certainly familar with [mysqli](https://www.php.net/manual/en/book.mysqli.php) extension. 

index.php
```
<?php
$mysqli = mysqli_init();
$mysqli->ssl_set(NULL, NULL, "/etc/ssl/certs/ca-certificates.crt", NULL, NULL);
$mysqli->real_connect($_ENV["DB_HOST"], $_ENV["DB_USERNAME"], $_ENV["DB_PASSWORD"], $_ENV["DB_NAME"]);
. . . 
$mysqli->close();
?>
```

Previous to crafting SQL statements, you need to install and initialize some kind of library. 
```
npm install prisma --save-dev
npx prisma init --datasource-provider mysql
```

prisma/schema.prisma
```
generator client {
    provider = "prisma-client-js"
}

datasource db {
    provider = "mysql"
    url = env("DATABASE_URL")
    relationMode = "prisma"
}
```

Done! From now on, you are equipped with everything you need to work with [MySQL](https://www.mysql.com/) database since [Prisma](https://www.prisma.io/) has provided [Raw database access](https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access) interface: 

- `$queryRaw` to return actual records (for example, using `SELECT`)
- `$executeRaw` to return a count of affected rows (for example, after an `UPDATE` or `DELETE`)

```
const prisma = new PrismaClient()

const result = await prisma.$queryRaw`SELECT * FROM User`

const email = 'emelie@prisma.io'
const result = await prisma.$queryRaw(
Prisma.sql`SELECT * FROM User WHERE email = ${email}`
)
```

```
const prisma = new PrismaClient()

const result = await prisma.$executeRaw`UPDATE User SET active = true WHERE emailValidated = true`

const emailValidated = true
const active = true

const result = await prisma.$executeRaw`UPDATE User SET active = ${active} WHERE emailValidated = ${emailValidated};`
```

> The method is implemented as a [tagged template](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals#tagged_templates), which allows you to pass a template literal where you can easily insert your [variables](https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access#using-variables). In turn, Prisma creates prepared statements that are safe from SQL injections. 

**Skip to next session if you are hard core SQL fans.** 

To create models from existing database tables. 
```
npx prisma db pull
```
> Pull the state from the database to the Prisma schema using *introspection*

To create database tables from existing models. 
```
npx prisma db push
```
> Push the state from Prisma schema to the database during *prototyping*

To synchronize database tables with models. 
```
npx prisma migrate dev
```
> Create a *migration* from changes in Prisma schema, apply it to the database trigger generators (e.g. Prisma Client)


### III. The Cost 
> "ORMs are nerds, only generate stupid, inefficient and dubious SQL statements that potentially harmful and thus ruin my project. Besides, if the ORM vendor closes down, my project would quickly becomes an unattended orphan." 

> "ORMs are incredulous, I want to keep track of every *single* line of SQL statements under the hook."


### IV. Summary 

### V. Reference
1. [Prisma Course: Zero To Hero](https://youtu.be/yW6HnMUAWNU)
2. [Prisma Doc | Raw database access](https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access)
3. [Prisma Doc | Error message reference](https://www.prisma.io/docs/reference/api-reference/error-reference)
4. [Prisma Doc | Prisma Client API reference](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#prismaclient)
5. [Prisma Doc | Configuring logging](https://www.prisma.io/docs/concepts/components/prisma-client/working-with-prismaclient/logging)
5. [Hop-Frog or the Eight Chained Ourang-Outangs](https://poemuseum.org/hop-frog/)


### Epilogue

### EOF (2023/09/06)
