import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

import * as dotenv from "dotenv";

export const lambdaHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {

  dotenv.config();

  const hw: string = process.env.HELLO;

  return {
    statusCode: 200,
    body: `TESTING ENV VARIABLE LOCAL AND IN AWS ${hw}`,
  };
};
