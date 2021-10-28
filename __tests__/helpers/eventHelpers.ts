import { APIGatewayProxyEvent } from "aws-lambda/trigger/api-gateway-proxy";

export function getTestEvent(): APIGatewayProxyEvent {
    return {
        body: "{\"Hello\": \"World\"}",
        headers: {},
        multiValueHeaders: {},
        httpMethod: "",
        isBase64Encoded: true,
        path: "",
        pathParameters: null,
        queryStringParameters: null,
        multiValueQueryStringParameters: null,
        stageVariables: null,
        requestContext: {
            accountId: "",
            apiId: "",
            authorizer: {},
            protocol: "",
            httpMethod: "",
            identity: {
                clientCert: null,
                accessKey: null,
                accountId: null,
                apiKey: null,
                apiKeyId: null,
                caller: null,
                cognitoAuthenticationProvider: null,
                cognitoAuthenticationType: null,
                cognitoIdentityId: null,
                cognitoIdentityPoolId: null,
                principalOrgId: null,
                sourceIp: "",
                user: null,
                userAgent: null,
                userArn: null,
            },
            path: "",
            stage: "",
            requestId: "",
            requestTimeEpoch: 0,
            resourceId: "",
            resourcePath: "",
        },
        resource: ""
    };
}