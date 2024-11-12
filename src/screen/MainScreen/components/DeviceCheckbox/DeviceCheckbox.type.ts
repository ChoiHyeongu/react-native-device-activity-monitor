import { Device } from "@/enum";

export interface DeviceCheckboxProps {
  /**
   * ### 디바이스 목록
   */
  value: Device[];

  /**
   * ### 디바이스 변경 이벤트
   */
  onChangeValue: (value: Device[]) => void;
}
