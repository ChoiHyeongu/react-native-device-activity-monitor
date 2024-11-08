import {ViewStyle} from 'react-native';
import {Segment} from '../../enums';

export interface DeviceActivityReportProps extends ViewStyle {
  segment: Segment;
  style: ViewStyle;
}
