# Use the official R image as the base
FROM r-base:latest

# Install plumber package
RUN R -e "install.packages('plumber', repos='https://cloud.r-project.org/')"

# Copy your script files into the container
COPY plumber.R /app/plumber.R
COPY server.R /app/server.R

# Set the working directory
WORKDIR /app

# Expose the port
EXPOSE 8000

# Command to run your Plumber API
CMD ["Rscript", "server.R"]
