# Cyberfeminism-Index-SQL

The Cyberfeminism Index, an ongoing archival project by Dr Mindy Seu,  gathers three decades of online activism, academic research, literature and net art.
 Hackers, scholars, artists and activists worldwide have contributed to the database; submissions are ongoing.
Inspired by this datase, I created a database to analyse the archive, and attain a comprehensive set of information regarding submissions and their authors. I was particularly interested in examining trends in author's country of origin, and spikes in publishing.  

The database comprises 5 tables in total, all interrelated by primary keys and foreign keys. 

Scripts created include: A right join used to determine details of authors with books that had been published (not all the media submitted were books with ISBN, a large proportion of submissions consisted of activist groups, art projects, academic articles and websites). A stored procedure used to easily insert a new item into the central table. A stored concatenation function to join author first-names to their surnames. An event, setting a daily reminder to check the data for new submissions, nudging the analyst to update the tables. And finally, I inserted a series of subqueries to rapidly attain information regarding quantity of items by year, grouping of items by author nationality, and an overview of the variety of media types in the index. 

Please note that the contents of the database are not owned by myself.
