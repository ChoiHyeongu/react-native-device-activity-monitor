import { SegmentInterval } from "@/enum";

export interface IntervalSegmentedButtonsProps {
  /**
   * ### 세그먼트 인터벌 값
   */
  value: SegmentInterval;

  /**
   * ### 인터벌 값 변경 이벤트
   */
  onChangeValue: (value: SegmentInterval) => void;
}
