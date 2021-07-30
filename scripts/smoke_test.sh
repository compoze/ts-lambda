STACK_NAME=$1

URL_KEY="myappUrl"

echo "Fetching url for $STACK_NAME for $URL_KEY"
URL=$(aws cloudformation describe-stacks --stack-name "$STACK_NAME" --query 'Stacks[0].Outputs[?OutputKey==`'${URL_KEY}'`].OutputValue' --output text)
echo $URL

RESULT=$(curl -o /dev/null -s -w "%{http_code}\n" ${URL})

echo $RESULT

if [ "$RESULT" != 200 ]; then
    echo "Call failed $RESULT"
    exit 1
fi

echo "API is up and working!"
