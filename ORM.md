
## "The Myth and Riddle of ORM"

![alt orm-sql](img/orm-sql.JPG)

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
> "ORMs are nerds! They generate stupid, inefficient and dubious SQL statements that potentially harmful, hazardous and henceforth ruin my project. Besides, if the vendor goes out of business, my project will be left unattended forthwith." 

> "Keeping the model in line with database tables is a drudgery. How do I know they are sychronized?" 

> "ORMs are incredulous, I want to keep track of every *single* line of SQL statements under the hook."

Let's continue our discussion: 
> Use the `PrismaClient` [log](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#log) parameter to configure [log levels](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#log-levels), including warnings, errors, and information about the queries sent to the database.

lib/prisma.js
```
import { PrismaClient } from "@prisma/client";

const prisma = global.prisma || new PrismaClient({
        log: [{
          emit: 'event',
          level: 'query',
        }],
      });

if (process.env.NODE_ENV === "development")
{
  global.prisma = prisma;
  prisma.$on('query', (e) => {
    console.log('Query: ' + e.query)
    console.log('Params: ' + e.params)
    console.log('Duration: ' + e.duration + 'ms')
  })
}

export default prisma;
```

script6.js
```
import prisma from './lib/prisma.js'

prisma.post.findUnique({ 
                where: { id: 1 }
            })
            .then(rec => { 
                prisma.post.update({
                    where: { id: 1 },
                    data: { views: rec.views + 1,
                            likes: rec.likes + 1 }
                })
                .then( res => console.log('new res=', res))
            } )
```

![alt query1](img/query1.JPG)

![alt query1](img/query2.JPG)

- The `findUnique` transforms into a `SELECT` statement; 
- The `update` transforms into one `SELECT` to check existence, one `UPDATE` to update the data, the last `SELECT` to return the updated record;
- Hand coding can cut it down into one `UPDATE` and one `SELECT` because existence check can be offset by checking [mysql_affected_rows()](https://dev.mysql.com/doc/c-api/8.0/en/mysql-affected-rows.html) after `UPDATE`. 

Any company could close down at any moment. The article [Top 11 Node.js ORMs, query builders & database libraries in 2022](https://www.prisma.io/dataguide/database-tools/top-nodejs-orms-query-builders-and-database-libraries) shows that Prisma, which support wide range of popular [databases](https://www.prisma.io/docs/reference/database-reference/supported-databases) with the exception of Oracle, is in a tailwind and nobody could tell how long it will last... [Nothing is Certain Except Death and Taxes](https://www.firstexchange.com/Nothing-is-Certain-Except-Death-and-Taxes). This is perhaps the elegy of IT industry, the elegy of our peers. 

Keeping model synchronized is tedious and error-prone. That's why Prisma has introducted the concept of [`migration`](https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-dev). 

```
npx prisma migrate dev
```
![alt sync](img/sync.JPG)

- Reruns the existing migration history in the [shadow database](https://www.prisma.io/docs/concepts/components/prisma-migrate/shadow-database) in order to detect schema drift (edited or deleted migration file, or a manual changes to the database schema)
- Applies pending migrations to the shadow database (for example, new migrations created by colleagues)
- Generates a new migration from any changes you made to the Prisma schema before running `migrate dev`
- Applies all unapplied migrations to the development database and updates the `_prisma_migrations` table
- Triggers the generation of artifacts (for example, Prisma Client)

Things happen behind the scenes... All generated SQL DDL souces are saved under `migrations` folder and will come to help whenever necessary. 


### IV. Summary 
- Prisma is not your cup of tea if are not using [NodeJS](https://nodejs.org/en) and related technique. 

- If you are from .NET family, you should think about [Entity Framework](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-8.0/plan). 

- if you are not using PostgreSQL, MySQL, SQLite, Microsoft SQL Server, MongoDB or CockroachDB then Prisma won't work for you. 

- ["The end justifies the means"](https://dictionary.cambridge.org/dictionary/english/end-justifies-the-means). If your applications strongly couples with database, ORM may not suit you. 

- [crud](https://www.prisma.io/docs/concepts/components/prisma-client/crud) operations are handy especially in implementing [REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api). [Aggregation, grouping, and summarizing](https://www.prisma.io/docs/concepts/components/prisma-client/aggregation-grouping-summarizing) are awkward/clumsy/embarrassing. 

- All in all, SQL knowledge is essential, ORM is helpful in crud rather than analytic and statistic. This conclusion also apply to NonSQL database. SQL has unparalleled/unrivaled/unmatched power in data mining. 


### V. Reference
1. [Prisma Course: Zero To Hero](https://youtu.be/yW6HnMUAWNU)
2. [Prisma Doc | Raw database access](https://www.prisma.io/docs/concepts/components/prisma-client/raw-database-access)
3. [Prisma Doc | Error message reference](https://www.prisma.io/docs/reference/api-reference/error-reference)
4. [Prisma Doc | Prisma Client API reference](https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#prismaclient)
5. [Prisma Doc | Configuring logging](https://www.prisma.io/docs/concepts/components/prisma-client/working-with-prismaclient/logging)
5. [Hop-Frog or the Eight Chained Ourang-Outangs](https://poemuseum.org/hop-frog/)


### Epilogue
```
CREATE TABLE fruits (
    id INTEGER NOT NULL AUTO_INCREMENT,    
    name VARCHAR(191) NOT NULL, 
    update_ident INTEGER DEFAULT 0, 

    PRIMARY KEY (id)
);

insert into fruits(name) values('Ourang-Outangs');

-- Old trick for the old dog
DELIMITER $$
CREATE TRIGGER before_update_fruits
BEFORE UPDATE
ON fruits FOR EACH ROW
BEGIN
    SET new.update_ident = old.update_ident + 1; 
END$$
DELIMITER ;

update fruits set name='Ourang-Outangs' where id=1;
```


### EOF (2023/09/08)
