"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lambdaHandler = void 0;
const dotenv = require("dotenv");
const lambdaHandler = async (event) => {
    dotenv.config();
    const hw = process.env.HELLO;
    return {
        statusCode: 200,
        body: `TESTING ENV VARIABLE LOCAL AND IN AWS ${hw}`,
    };
};
exports.lambdaHandler = lambdaHandler;
//# sourceMappingURL=app.js.map