import { User } from "@/enum";

export interface UserSegmentedButtonsProps {
  /**
   * ### 디바이스
   */
  value: User;

  /**
   * ### 유저 변경 이벤트
   */
  onChangeValue: (value: User) => void;
}
