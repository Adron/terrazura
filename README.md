# terrazura

I created this repo during a live stream on my Twitch [Thrashing Code](https://www.twitch.tv/thrashingcode) Channel 🤘 at 10am on the 30th of December, 2020. The VOD is now available on my YouTube [Thrashing Code](https://youtube.com/thrashingcode) Channel (click [here](https://youtu.be/7glsC88h2Ss) for the direct link to video). A rough as hell year, but wanted to wrap it up with some solid content. In this stream I tackled a ton of specifics, in detail about getting Hasura deployed in Azure, Postgres backed, a database schema designed and created, using database schema migrations, and all sorts of tips n' tricks along the way. 3 hours of solid how to get shit done material!

[![Picture at Time in Point of the Video](https://i1.wp.com/compositecode.blog/wp-content/uploads/2021/02/CleanShot-2021-02-19-at-13.56.22.png)](https://youtu.be/7glsC88h2Ss)

Some of the things covered:

* Setup of infrastructure as code using Terraform.
* Setup of GraphQL API Hasura Server.
* Setup of Dev AND Live *Prod* Deployment using Docker & Terraform.
* Build out of our initial Database Schema.
* Deployment of the database schema to Hasura using Hasura CLI Migrations.
* Coverage of basic GraphQL and looking into queries and mutations.

Time Points:

* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=169s" target="_blank">02:49</a>​ - Shout out to the stream sponsor, Azure, and links to some collateral material.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=890s" target="_blank">14:50</a>​ - In this first segment, I start but run into some troubleshooting needs around the provider versions for Terraform in regards to Azure. You can skip this part unless you want to see what issue I ran into.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=1104s" target="_blank">18:24</a>​ - Since I ran into issues with the current version of Terraform I had installed, at this time I show a quick upgrade to the latest version.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=1642s" target="_blank">27:22</a>​ - After upgrading and fighting through trial and error execution of Terraform until I finally get the right combination of provider and Terraform versions.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=1673s" target="_blank">27:53</a>​ - Adding the first Terraform resource, the Azure resource group.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=1787s" target="_blank">29:47</a>​ - Azure Portal oddness, just to take note off if/when you're working through this. Workaround later in the stream.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=1920s" target="_blank">32:00</a>​ - Adding the Postgres server resource.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=2683s" target="_blank">44:43</a>​ - In this segment I switched over to Jetbrain's Intellij to do the rest of the work. I also tweak the IDE to re-add the plugin for the material design themes and icons. If you use this IDE, it's very much IMHO worth getting this to switch between themes.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=3572s" target="_blank">59:32</a>​ - After getting leveled-up with the IDE, I wrap up the Postgres server resource and terraform apply it the overall set of resources. At this point I also move forward with the infrastructure as code, with emphasis on additive changes to the immutable infrastructure by emphasizing use of `terraform apply` and minimizing any `terraform destroy` use.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=3727s" target="_blank">1:02:07</a>​ - At this time, I try figuring out the portal issue by `az logout` and logging back in `az login` to Azure Still no resources shown but...
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=4127s" target="_blank">1:08:47</a>​ - eventually I realize I have to use the hack solution of pasting the subscription ID into the 
@Azure portal to get resources for the particular subscription account which seems highly counter intuitive since its the ONLY account. 🧐
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=4974s" target="_blank">1:22:54</a>​ - The next thing I setup, now that I have variables that need passed in on every `terraform` execution, I add a script to do this for me.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=5375s" target="_blank">1:29:35</a>​ - Next up is adding the database to the database server and firewall rule. Also we get to see Jetbrains <a href="/hashtag/intellij">#Intellij</a>​ HCL plugin introspection at work adding required properties to the firewall resource! A really useful feature.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=5904s" target="_blank">1:38:24</a>​ - Next up, creating the Azure container to deploy our Hasura GraphQL API for Postgres to!
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=6702s" target="_blank">1:51:42</a>​ - BAM! API Server is done and launched! I've got a live GraphQL API up and running in Azure and we're ready to start building a data model!
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=6982s" target="_blank">1:56:22</a>​ - In this segment I show how to turn off the public facing console and shift one's development workflow to the local Hasura console working against - local OR your live dev environment.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=7109s" target="_blank">1:58:29</a>​ - Next segment I get into schema migrations, initializing a directory structure for Hasura CLI use, and metadata, migrations, and related data. Including an update to the latest CLI so you can see how to do that, after a run into a slight glitch. 😬
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=8582s" target="_blank">2:23:02</a>​ - I also shift over to dbdiagram to graphically build out some of the schema via their markdown, then use the SQL export option for postgres combined with Hasura's option to execute plain ole SQL via migrations...
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=9108s" target="_blank">2:31:48</a>​ - Getting a bit more in depth in this segment, I delve through - via the Hasura console - to build out relationships between the tables and data so the graphql queries can introspect accordingly.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=9630s" target="_blank">2:40:30</a>​ - Next segment, graphql time! I show some of the options of what is available immediately for queries and mutations via the console.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=10236s" target="_blank">2:50:36</a>​ - Then some more details about metadata. I'm going to do a stream with further details, since I was a little fuzzy on some of those details myself, in the very very near future. However a good introduction to what the metadata does for the graphql API.
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=10747s" target="_blank">2:59:07</a>​ - Then as a wrap up to all of this... I nuke EVERYTHING and deploy it all out to Azure again inclusive of schema migrations, metadata, etc. 🤘🏻
* <a href="https://youtu.be/7glsC88h2Ss/watch?v=7glsC88h2Ss&amp;t=11790s" target="_blank">3:16:30</a>​ - Final segment, I add some data to the database and get into a few basic queries and mutations in graphql via the graphiql console interface in Hasura.
