# Use the official R base image from the Rocker project
FROM rocker/r-ver:4.0.3

# Install system dependencies
RUN apt-get update && apt-get install -y \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  && rm -rf /var/lib/apt/lists/*

# Install R package dependencies
RUN R -e "install.packages(c('plumber', 'jsonlite'), repos='https://cloud.r-project.org/')"

# Copy your API code into the Docker image
COPY . /app
WORKDIR /app

# Expose the port where the API will run
EXPOSE 8000

# Run the Plumber API
CMD ["R", "-e", "plumber::plumb('plumber.R')$run(host='0.0.0.0', port=8000)"]
