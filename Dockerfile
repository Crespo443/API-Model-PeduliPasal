FROM python:3.10-slim

ENV PYTHONBUFFERED True
# Set application home directory
ENV APP_HOME /app
WORKDIR $APP_HOME

# Install Python dependencies separately for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .


# Run the application using Gunicorn
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 src.app:app
