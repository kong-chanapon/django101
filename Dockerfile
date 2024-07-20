FROM python:3.12

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

RUN python manage.py migrate

# Create a superuser only if it doesn't already exist
RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); \
if not User.objects.filter(username='admin').exists(): \
    User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
