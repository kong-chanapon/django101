#!/bin/sh

# Wait for PostgreSQL to be ready
while ! nc -z $DB_HOST $DB_PORT; do
  echo "Waiting for PostgreSQL at $DB_HOST:$DB_PORT..."
  sleep 1
done

# Run migrations
python manage.py migrate

# Create a superuser if it doesn't already exist
echo "from django.contrib.auth import get_user_model; User = get_user_model(); \
if not User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists(): \
    User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')" | python manage.py shell

# Start the server
exec "$@"
