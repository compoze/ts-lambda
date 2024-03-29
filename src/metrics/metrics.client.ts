import { CloudWatchClient, MetricDatum, PutMetricDataCommand } from "@aws-sdk/client-cloudwatch";
import logger from "../logging/logger";

export interface NotificationsCloudwatchMetric {
    merticData: MetricDatum[];
    nameSpace: string;
}


export abstract class MetricPublisher {
   
    protected metricName: string;
    protected namespace: string;
    protected environment: string;
    private client: CloudWatchClient;
   
    constructor(metricName: string, namespace: string) {
        this.metricName = metricName;
        this.namespace = namespace;
        this.environment = process.env.NODE_ENV ?? "local";
        this.client = new CloudWatchClient({ region: "us-east-1" });

    }


    public async publish(count?: number): Promise<void> {

        try {


            logger.debug('publishing metric');

            const command = new PutMetricDataCommand({
                MetricData: [{
                    MetricName: this.metricName,
                    Dimensions: [{
                        Name: 'Environment',
                        Value: this.environment,
                    }],
                    Unit: 'None',
                    Timestamp: new Date(),
                    Value: count ? count : 1
                }],
                Namespace: this.namespace
            });

            await this.client.send(command);
            logger.debug('successfully published metric');

        } catch (err) {

            logger.warn('Failed to publish metric ', err);
            return;
        }
    }

}