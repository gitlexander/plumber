# Use an official R image as a base
FROM rocker/r-ver:4.1.0

# Install Plumber
RUN R -e "install.packages('plumber')"

# Copy the project files into the Docker image
COPY . /app

# Set the working directory
WORKDIR /app

# Expose the port on which the Plumber API will run
EXPOSE 8000

# Start the Plumber API
CMD ["Rscript", "server.R"]
