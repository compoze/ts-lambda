import { MetricPublisher } from "./metrics.client";

class HelloWorldSuccess extends MetricPublisher {
    constructor() {
        super('HelloSuccess', 'myapp/Notifications')
    }
}

const createHelloWorldSuccess = (): HelloWorldSuccess => {
    return new HelloWorldSuccess();
}


const helloWorldSuccessMetric: MetricPublisher = createHelloWorldSuccess();

export default helloWorldSuccessMetric;