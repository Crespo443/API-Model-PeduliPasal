FROM python:3.10-slim

# Configure Python environment
ENV PYTHONBUFFERED True

# Set application home directory
ENV APP_HOME /app

# Copy all files and requirements
WORKDIR $APP_HOME
COPY . $APP_HOME

# Install Python dependencies
RUN pip install -r requirements.txt

# Set the working directory for the app
WORKDIR $APP_HOME/src

# Run the application using Gunicorn
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 src.app:app
