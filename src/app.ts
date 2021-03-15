import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";
import * as winston from 'winston';

let logger: winston.Logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  transports: [
      new winston.transports.Console({ level: 'info' }),
  ],
});

export const lambdaHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(event);

  return {
    statusCode: 200,
    body: JSON.stringify({message: "hello world"}),
  };
};
