"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lambdaHandler = void 0;
// import * as moment from 'moment'; //  OK
const lambdaHandler = async (event) => {
    // const hw: string = process.env.HELLO;
    // const then: string = moment("2020-12-31").fromNow();
    return {
        statusCode: 200,
        body: `HELLO WORLD`,
    };
};
exports.lambdaHandler = lambdaHandler;
//# sourceMappingURL=app.js.map