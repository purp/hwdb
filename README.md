# Getting Started

1. Do all the usual Rails startup bits, e.g. `bundle install && rake db:create` but don't do `db:migrate`
1. Get a SQL dump file of Alex's hardware database.
1. `SQL_DUMP=/path/to/dump/file.sql rake db:migrate` which will load your database dump and apply some adjustments from `db/sql/adjustments.sql`
1. `rails server` and you're good to go

## Caveats

This was written to be a read-only view and follows the Principle of Minimal Munging. Rather than munge the tables around into a form that Rails would prefer, we create some views to provide the table names that Rails expects, with the columns that Rails wants to see.

I've never tried writing new records via this, though it should work properly. Still, if we wanted this to work long-term, I'd probably translate the database format itself to remove the hacky view thing.

_Ut visum notitia bona id temporis ..._

