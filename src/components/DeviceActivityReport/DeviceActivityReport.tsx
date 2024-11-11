import {requireNativeComponent} from 'react-native';
import {DeviceActivityReportProps} from './DeviceActivityReport.type';

const DeviceActivityReportComponent = requireNativeComponent(
  'DeviceActivityReport',
) as unknown as React.FC<DeviceActivityReportProps>;

function DeviceActivityReport({
  users = 'all',
  devices = ['iPhone'],
  ...props
}: DeviceActivityReportProps) {
  return (
    <DeviceActivityReportComponent users={users} devices={devices} {...props} />
  );
}

export default DeviceActivityReport;
