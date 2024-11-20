
This monorepo contains a React front end and a C# .NET modern backend. During develpoment, the backend was connected to a PostgreSQL database.

Database: 
-The database contains two tables of interest: Assetcommit and Investor. The RawData (RawDatum) table was used as a temporary table to import the csv 
data and can be disregarded. There is a FK relating Assetcommit "investor_id" and Investor "id" columns.

Backend:
-The backend uses EntityFrameworkCore in a DB-first approach. The scaffold command is below. In a real project, user secrets will be used instead of this.
-PGSQLDbContext.cs is the context (generated via scaffolding).
-DI Dependency Injection for the layers.
-The controller communicates api requests to the services layer, which communicates to the repository layer.
-An exception handling middleware class is used and responses are validated with Apiresponse/
-OpenAPI swagger can be used to test
-Some sample unit and e2e tests have been included to demonstrate the test writing intention

DB Scaffold command:
dotnet ef dbcontext scaffold "Host=localhost;Port=5432;Database=Prequin;Username=postgres;Password=" Npgsql.EntityFrameworkCore.PostgreSQL -o Models --context PGSQLDbContext


Frontend:

-Using React hooks, tailwindcss.
