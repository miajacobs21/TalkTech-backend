
=======
#!/bin/bash

# function program_is_installed {
#   local return_=1

#   type $1 >/dev/null 2>&1 || { local return_=0; }
#   echo "$return_"
# }

# if [ $(program_is_installed zip) == 0 ]; then
#   apk update
#   apk add zip
# fi

aws s3 sync s3://talktech-env-files/backend/production . # update with your s3 bucket
unzip env-file.zip
cp .env.production .env
rm .env.production
sed -i -e "s|\(^REDIS_HOST=\).*|REDIS_HOST=redis://$ELASTICACHE_ENDPOINT:6379|g" .env
rm -rf env-file.zip
cp .env .env.production
zip env-file.zip .env.production
aws --region us-east-1 s3 cp env-file.zip s3://talktech-env-files/backend/production/ # update with your s3 bucket
rm -rf .env*
rm -rf env-file.zip

