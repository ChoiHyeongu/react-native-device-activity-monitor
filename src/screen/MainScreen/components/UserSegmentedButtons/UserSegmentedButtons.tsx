import { SegmentedButtons } from "react-native-paper";

import { User } from "@/enum";

import { UserSegmentedButtonsProps } from "./UserSegmentedButtons.type";

// 세그먼트 버튼 데이터
const SEGMENT_USERS = [
  { value: User.All, label: "ALL" },
  { value: User.Children, label: "Children" },
];

function UserSegmentedButtons({
  value,
  onChangeValue,
}: UserSegmentedButtonsProps) {
  function handleChange(value: string) {
    onChangeValue(value as User);
  }

  return (
    <SegmentedButtons
      value={value}
      onValueChange={handleChange}
      buttons={SEGMENT_USERS}
    />
  );
}

export default UserSegmentedButtons;
