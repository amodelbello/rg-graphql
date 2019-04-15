FROM node:8
EXPOSE 4000
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .
# TODO Move these to docker-compose.yml
ENV API_URL http://best-chile_rg-api_1:3000/api
ENV SUPER_AUTH_TOKEN Bearer\ eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1YjNiZThkZWM2YmI4ZTJkODJlNmZjNmIiLCJlbWFpbCI6InN1cGVyQHVzZXIuY29tIiwidXNlcm5hbWUiOiJzdXBlcnVzZXIiLCJyb2xlIjoic3VwZXIiLCJleHBpcmF0aW9uIjoxNTM1MDY0NzExLCJpYXQiOjE1MzI0NzI3MTF9.WCCR_OL5cZCv-MiROCc-FyOi2ppbuSg0mSu9Wd5Phx0
ENV ADMIN_AUTH_TOKEN Bearer\ eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1YjFmNGVmZGI0NGJkMWZlMmE1ZGVhNzkiLCJlbWFpbCI6ImFkbWludXNlckBsYWxhbGEuY29tIiwidXNlcm5hbWUiOiJhZG1pbnVzZXIiLCJyb2xlIjoiYWRtaW4iLCJleHBpcmF0aW9uIjoxNTMxNDIwNjM5LCJpYXQiOjE1Mjg4Mjg2Mzl9.U6Ku8U42fn84u8lFScx4xvWo8Zz_KoAEppGAScleB5g
ENV DEFAULT_AUTH_TOKEN Bearer\ eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1Yjk5MzBlMWFkYTZmOTU0OGM0ZjhhYWYiLCJlbWFpbCI6ImRlZmF1bHRAdXNlci5jb20iLCJ1c2VybmFtZSI6ImRlZmF1bHR1c2VyIiwicm9sZSI6ImRlZmF1bHQiLCJleHBpcmF0aW9uIjoxNTM5MzU4MTc3LCJpYXQiOjE1MzY3NjYxNzd9.iUBkNmPZHBvd_qz77NkOVFjNcgGjjMQl7-uoztkI82I
CMD ["npm", "start"]