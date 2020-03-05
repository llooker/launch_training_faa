# Setup and Exercise 1

# Welcome to your Looker Flight Training

## Ground School

First thing we need to do is connect Looker to your Snowflake environment so that we can query the data there.
You can go to the Admin menu find Database/Connections and then press "New Connection" or click [here](https://launchtraining.looker.com/admin/connections/new).

In general, you will need to put in the information as outlined in our [documentation](https://docs.looker.com/setup-and-management/database-config/snowflake#adding_the_connection).
Specifically,
- give the connection a name we can refer to in Looker, how about: `yourname_snowflake_faa`.
- Select snowflake as the dialect
- Put in the hostname (doesn't need https://) and accept the default port of 443
- Put in your Database/user name/password/and schema
- IMPORTANT - with snowflake we need to add `additional parameters` to the JDBC string we connect with to define the account and warehouse to use when querying.  It takes the form `account=[account_name]&warehouse=[warehouse_name]` Where account_name is typically whatever precedes .snowflakecomputing.com in the host and warehouse is the snowflake warehouse to use for querying.  For both, you will want to use UPPER CASE.  AN example would be `account=FLA8374&warehouse=COMPUTE_WH`

At this point, you should be able to scroll to the bottom and `Test these settings` - let us know if you have an issue.

## Inspect the Plane

OK - now that we have connectivity, let's check out what is going on by going to the [SQL Runner](https://launchtraining.looker.com/sql): Under the Develop menu, choose SQL Runner.  On the left, you will see a dropdown for connection - that should have everyone's connections.  Choose yours (`yourname_snowflake_faa`) - you can now see the data in your Snowflake database.  You can write raw SQL in the box or use the gear box next to the table names to have Looker pre-populate some simple queries for you.  Let's check out the size of that delays table:
`SELECT COUNT(*) FROM "PUBLIC"."BTS_Delays"`  This is a great place to ground truth the data.  SQL Runner also can give you some quick visualizations that can be used in dashboards or shared across the instance.  But nothing here is governed.  What we want to do is get to LookML, what will really let us fly ....

## Taxi out to the runway

LookML is a Markup Language for SQL.  It abstracts away many of the complexities of writing manual SQL and gives you a DRY environment to develop.  Let's build a LookML project:
- Go to the [Manage LookML Projects](https://launchtraining.looker.com/projects) page (can be found under the develop menu)
- Build a New LookML Project
- You might have to switch to development mode!  That's OK! LookML built with git integration in mind, so any changes (including new projects) need to be done from a developer branch.
- Give your project a name, how about: `yourname_faa`
- You have a number of options for a starting point - Looker can generate a model from the information in the database, you can give Looker a SQL query and it can generate a model.  Both of these are good when working with brand new data sets.  In this case, we know what the data schema is so we can go ahead and select Clone Public Git Repository
- Enter `git://github.com/llooker/launch_training_faa.git`
- Et Voila - you have a LookML Project!
