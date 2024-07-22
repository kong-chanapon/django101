FROM python:3.12

ENV PORT=8000
ENV DB_HOST=aws-0-ap-southeast-1.pooler.supabase.com
ENV DB_PORT=6543
ENV DB_USERNAME=postgres.qcakvwgzyvyzxdlheqgl
ENV DB_PASSWORD=AvGn5yBEjsCnLyPu
ENV DB_NAME=postgres

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
