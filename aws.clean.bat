@echo off
set "inputfile=.\%1\localstack\recorded_api_calls.json"
SET "outfile=.\%1\localstack\recorded_api_calls.json.backup"

echo Filter out SQS entries from recorded_api_calls.json
findstr /v /rc:"""sqs""" %inputfile% > %outfile%

echo Filter out S3 deleted entries from recorded_api_calls.json
findstr /v /rc:"""DELETE""" %outfile% > %inputfile%
DEL %outfile%