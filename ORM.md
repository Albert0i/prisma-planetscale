
## "The Myth and Riddle of ORM"

### Prologue
I was both delighted and agitated upon seeing her. She was born on late '80s of last century, I heard of and know of her since I was in the University. Speaking of her beautifullines, it was simplicity on one side and complexity on the other. Difficult to comprehend at first glance but even more abstruse to apprehend on second thought. Her visage has evolved over times but with enriched youthfulness then before. Communicatopm between us is done via more or less the same language since acquaintance. She never betrays me, never fails me in any aspects of my working life. As you may guess, she is ... 


### I. Do I really need ORM? (TL;DR)
In the 1980s and ’90s, relational databases grew increasingly dominant, crowned and coined the mainstream in application development till today. Most seasoned programmers were highly opinionated against [ORM](https://www.prisma.io/dataguide/types/relational/what-is-an-orm): 
- Since SQL is *de facto* standard in data manipulation. Why bother to learn another ways? 
- If SQL knowledge is vital, why bother to learn another tools? 
- The popularity of NoSQL doesn't impede or hazard the orthodoxy of relational database and so does SQL. 
- If we can not get rid of it, get alone with it. 

Virtually and effectively, SQL is the standard way to manipulate database. But may not be proper or most efficient to handle data especially for object-oriented languages. Most popular modern programming languages derive from [C++](https://www.w3schools.com/cpp/cpp_intro.asp), which instead retrofitted somewhat from [Smalltalk](https://en.wikipedia.org/wiki/Smalltalk). Traditionally, relational database consists of tables, indexex, stored procedures and functions but has no idea of object whatsoever. See the glitch? 

The more difference in abstraction levels, the more modulation is necessitated, ie. to convert objets to and fro table rows required human intervention, they are not in the same row. In addition, operations to object are conceptionally and practically different from those to database table. To alleviate mental labour, one always introduces an *abstraction layer* so that our programs can operate on the same level, so that they work smoothly. The appellation of abstraction layer is commonly known as "data access layer" or something like that. DAL wraps function calls and transform to database calls; read data from relation database and convert to object and return it to the invokers. 

Levels of abstraction are indispensable means in programming, as it greatly reduces the complexity of tasks so that we can focus on the very issue on hand. 

The success of NoSQL databases also hinges on it's higher abstraction level. [MongoDB](https://www.mongodb.com/) is a typical NoSQL implementation with built-in capabilities not seen on traditional relational database. One imperceptible feature is the seamless integration with the host programming language. Operations on language bear much similarity to database. Objects are the same notation. 

SQL knowledge is crucial, I can't fancy any chance it will decline in the future. Diversified programming paradigm only intenses the particularity of tools. Every tool has it's own use; different portions of [software stacks](https://www.mongodb.com/basics/technology-stack) require different technique, absbraction level tends to be unified. 


### II. The other extreme

### III. The Cost 

### IV. Summary 

### V. Reference

### Epilogue

### EOF (2023/09/06)
