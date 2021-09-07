import { MetricPublisher } from "./metrics.client";

class HelloWorldSuccess extends MetricPublisher {
    constructor() {
        super('OrderRecordSuccess', 'Airfield/Notifications')
    }
}

const createHelloWorldSuccess = (): HelloWorldSuccess => {
    return new HelloWorldSuccess();
}


const helloWorldSuccessMetric: MetricPublisher = createHelloWorldSuccess();

export default helloWorldSuccessMetric;