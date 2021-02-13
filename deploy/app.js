"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lambdaHandler = void 0;
const lambdaHandler = async (event) => {
    return {
        statusCode: 200,
        body: `HELLO WORLD`,
    };
};
exports.lambdaHandler = lambdaHandler;
//# sourceMappingURL=app.js.map