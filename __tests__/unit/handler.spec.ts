// 'use strict';

import { APIGatewayProxyEvent } from 'aws-lambda/trigger/api-gateway-proxy';
// const app = require('../../src/app.js');
import { lambdaHandler } from '../../src/app';
import { getTestEvent } from '../helpers/eventHelpers';

describe('Tests index', function () {
    const event: APIGatewayProxyEvent = getTestEvent();

    it('verifies successful response', async () => {
        const result = await lambdaHandler(event);

        console.log(result);

        expect(result.statusCode).toBe(200);

        let response = JSON.parse(result.body);

        expect(response.message).toBe("hello world");
    });
});
