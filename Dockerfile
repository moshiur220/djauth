FROM python:3.9.15-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install nginx
RUN apt-get update && apt-get install nginx -y --no-install-recommends

COPY nginx.default /etc/nginx/sites-available/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
RUN mkdir -p /social/app && \
    chown -R www-data:www-data /social/app

WORKDIR /social/app

COPY requirements.txt entrypoint.sh /social/app/
RUN pip install --upgrade pip && \
    pip install -r requirements.txt


COPY . .

RUN chmod +x entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["sh", "-c", "/social/app/entrypoint.sh"]


# FROM python:3.9.15-slim-bullseye

# RUN mkdir /home/product_admin_software

# WORKDIR /home/product_admin_software

# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# COPY ./ /home/product_admin_software/
# RUN apt-get update &&\
#     apt-get install -y binutils libproj-dev gdal-bin
# RUN pip install --upgrade pip
# RUN pip install -r /home/product_admin_software/requirements.txt


