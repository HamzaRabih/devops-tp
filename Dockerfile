FROM nginx
LABEL authors="h.rabih"
COPY index.html /admin/share/nginx/html
EXPOSE 80
