# NY-Taxi-Docker

## Set up the PostgreSQL Container
```bash
# Use docker compose to set up and link pgAdmin and pgCLI
docker-compose up -d
```

## Run the script with Docker

The csv files are available at: https://github.com/DataTalksClub/nyc-tlc-data/releases/tag/yellow

- Run through Docker
```bash
# Build image through Dockerfile
docker build -t taxi_ingest:v001 .

# Run
docker run -it \
  --network=pg-network \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pgdatabase \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"
```

## Usage

### Connect to pgCLI through terminal

```bash
pgcli -h localhost -p 5432 -u root -d ny_taxi
```

### Connect to pgAdmin

The pgAdmin will be available at: http://localhost:8080/
- Account: admin@admin.com
- Password: root

Register server:
- Hostname: pg-database
- User: root
- Password: root
