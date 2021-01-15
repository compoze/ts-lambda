import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

// import * as moment from 'moment'; //  OK

export const lambdaHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {

  // const hw: string = process.env.HELLO;
  // const then: string = moment("2020-12-31").fromNow();

  return {
    statusCode: 200,
    body: `HELLO WORLD`,
  };
};
