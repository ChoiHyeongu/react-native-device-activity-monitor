export interface DatePickerProps {
  /**
   * ### 날짜
   */
  date: Date;

  /**
   * ### 제목
   */
  title: string;

  /**
   * ### 날짜 변경 이벤트
   */
  onChangeDate: (date: Date) => void;
}
