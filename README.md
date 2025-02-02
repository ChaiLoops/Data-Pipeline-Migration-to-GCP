
# Data-Pipeline-Migration-to-GCP #
## Overview
  #### Gans is a startup developing an e-scooter sharing system. It aims to operate in the world's most populated cities. In each city, the company will have hundreds of e-scooters parked on the streets and allow users to rent them by the minute. Dynamic information such as population, weather and flight arrival will help the Gans team better predict scooter usage and optimal scooter placement.
## Project Exceution
  #### The project will unfold in three phases, involving the creation of a local pipeline and its subsequent migration to the cloud. The ultimate goal is to establish a fully automated data pipeline, outlined in the following flowchart:
  ![image](https://github.com/user-attachments/assets/f5ddcf28-d930-42cc-95a7-5769073e2629)
## Phase 1: Local Pipeline
  #### 1. This phase involves building a local data pipeline for collecting, transforming, and storing data in an SQL database.
  ![EER_diagram_Gans](https://github.com/user-attachments/assets/fdb28750-30b2-45e3-8fcc-48c50e93d137)
  #### 2. Select German Cities using API 
  #### Instead of manually selecting the cities for my project, I decided to use a curated list from Google that highlights the most visited cities in Germany. This decision simplified my process and ensured that I included popular travel destinations.
  #### 3. Web Scraping using BeautifulSoup 
  #### Web scraping is performed on wiki pages. The goal was to extract important details from their respective Wikipedia pages, including country, latitude, longitude, population, and census year. The data is then integrated into SQL database.
  #### 4. Weather Data Collection via OpenWeather API 
  #### Weather forecast data for the selected cities is collected using the OpenWeather API. Various weather-related metrics are obtained and stored in the SQL database.
  #### 5. Flights Data Collection via AeroDataBox API 
  #### Airport Data Collection: Retrieved nearby airports using the AeroDataBox API, storing details like IATA and ICAO codes in the "Airports" SQL table. Flight Information Storage: Collected detailed flight data, including departure and scheduled arrival times, and saved it in the "Flights" SQL table for monitoring flight statuses.
## Phase 2: Cloud Pipeline
  #### After setting up the local data pipeline, I migrated it to the cloud by configuring a MySQL instance on Google Cloud Platform (GCP). MySQL Workbench was connected to the GCP instance to create the necessary schema and tables. Data collection scripts were executed using GCP Cloud Functions, while static tables (city and airport data) remained unchanged. The forecast (update_forecast_table) and flight tables (request_flights_data) are dynamically updated daily with data from API endpoints to ensure real-time insights. Additionally, GCP Cloud Scheduler automates data collection at set intervals, providing Gans with timely weather forecasts and flight arrival data.
![forecasts](https://github.com/user-attachments/assets/89bd8d56-ca8d-47b9-ba63-e933cde4111d)

![flights](https://github.com/user-attachments/assets/530daf4d-d8b1-4ae9-b217-973948f7c4e4)
## Phase 3: Write a Medium Article
  #### Publish Medium Article A detailed Medium article was published, summarizing the project's key tasks, challenges, and outcomes. Read the detailed insights here: [Gans Escooter: Successful Data Pipeline Migration to GCP](https://medium.com/@dtungenwar9850/gans-escooter-successful-data-pipeline-migration-to-gcp-4d5d989c8acf) for more insights.
