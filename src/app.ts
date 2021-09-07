import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";
import logger from "./logging/logger";
import helloWorldSuccessMetric from "./metrics/hello.world.metric";

export const lambdaHandler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  logger.info(event);

  helloWorldSuccessMetric.publish();
  return {
    statusCode: 200,
    body: JSON.stringify({ message: "hello world" }),
  };
};
