# myapp

NodeJS Typescript application targeted for deployment to AWS Lambda Configured for `HELLO WORLD`.

## Setup

```npm i```

## Test

The unit test framework of choice is TS-Jest. You can find an initial handler.spec.ts test under the __tests__ directory

You can execute the tests via ```npm run test```

## Deployment

You can leverage Compoze to do your deployments for you. Otherwise you can configure your local AWS environment and run ```npm run deploy <env>```

## Gitignore

IDE configurations are excluded.
