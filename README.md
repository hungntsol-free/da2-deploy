# Setup

## Server

- The api server need some config in `./env/api/.env` file.
  - `MongoSettings__*`: config for database.
  - `ServicesSettings__S3Bucket__*`: need to register AWS and create S3 bucket if not it will be error when upload image.
    - When have AWS S3, download credential for your iam/account, install `aws-cli` and use `aws configure` to config credential for host access to S3.
    - You MUST make S3 public to internet with `GetObject` policy.
    - *`Cloudinary` config is not used anymore. Please use S3*.
  - `ServicesSettings__MailSettings__*`: SMTP mail server.

## Compose

- File `docker-compose.yaml` define service need to run, file `docker-compose.{override}` will override the `docker-compose.yaml`, use both to run compose.
