import { SegmentedButtons } from "react-native-paper";

import { SegmentInterval } from "@/enum";

import { IntervalSegmentedButtonsProps } from "./IntervalSegmentedButtons.type";

// 세그먼트 버튼 데이터
const SEGMENT_INTERVALS = [
  { value: SegmentInterval.Hourly, label: "Hourly" },
  { value: SegmentInterval.Daily, label: "Daily" },
  { value: SegmentInterval.Weekly, label: "Weekly" },
];

function IntervalSegmentedButtons({
  value,
  onChangeValue,
}: IntervalSegmentedButtonsProps) {
  function handleChange(value: string) {
    onChangeValue(value as SegmentInterval);
  }

  return (
    <SegmentedButtons
      value={value}
      onValueChange={handleChange}
      buttons={SEGMENT_INTERVALS}
    />
  );
}

export default IntervalSegmentedButtons;
