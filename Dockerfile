FROM nginx
LABEL authors="h.rabih"
COPY index.html /usr/share/nginx/html
EXPOSE 80
