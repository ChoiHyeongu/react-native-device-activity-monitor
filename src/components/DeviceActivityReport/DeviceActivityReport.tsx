import {requireNativeComponent} from 'react-native';
import {DeviceActivityReportProps} from './DeviceActivityReport.type';

export const DeviceActivityReport = requireNativeComponent(
  'DeviceActivityReport',
) as unknown as React.FC<DeviceActivityReportProps>;
