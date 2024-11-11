import {ViewStyle} from 'react-native';
import {Segment} from '../../enums';

export interface DeviceActivityReportProps extends ViewStyle {
  /**
   * ### @requires 세그먼트
   */
  segmentInterval: {
    type: 'hourly' | 'daily' | 'weekly';
    start: number;
    end: number;
  };

  /**
   * ### 사용자
   */
  users?: 'all' | 'children';

  /**
   * ### 디바이스
   */
  devices?: ('iPhone' | 'iPad')[];

  /**
   * ### @todo 어플리케이션
   */
  applications?: string[];

  /**
   * ### @todo 카테고리
   */
  categories?: string[];

  /**
   * ### 스타일
   */
  style: ViewStyle;
}
