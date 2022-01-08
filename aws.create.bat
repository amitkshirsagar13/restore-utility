@echo off
call localstack.health
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo.          Restoring LocalStack s3 bucket and sqs!!!
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
@REM aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name test_PROCESS_EXPORT > nul
@REM aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name test_PROCESS_EXPORT-dlq > nul
echo.
echo.
echo.---------------
echo.  S3: Buckets
echo.---------------
aws --endpoint-url=http://localhost:4566 s3 ls --output text
echo.
echo.
echo.---------------
echo.  SQS: Queues
echo.---------------
aws --endpoint-url=http://localhost:4566 sqs list-queues --output text
echo.
echo.
call flyway.version
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo.          Restored LocalStack s3 bucket and sqs!!!
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX