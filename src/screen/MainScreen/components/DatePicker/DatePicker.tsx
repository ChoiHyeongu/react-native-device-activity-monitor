import { useState } from "react";
import { View } from "react-native";
import RNDatePicker from "react-native-date-picker";
import { Chip } from "react-native-paper";

import { DatePickerProps } from "./DatePicker.type";

function DatePicker({ title, date, onChangeDate }: DatePickerProps) {
  const [open, setOpen] = useState(false);

  function onPressChip() {
    openDatePicker();
  }

  function openDatePicker() {
    setOpen(true);
  }

  function handleChangeDate(date: Date) {
    onChangeDate(date);
    setOpen(false);
  }

  return (
    <View>
      <Chip onPress={onPressChip}>{`${title}${date.toDateString()}`}</Chip>
      <RNDatePicker
        modal
        open={open}
        date={date}
        mode={"date"}
        onConfirm={handleChangeDate}
      />
    </View>
  );
}

export default DatePicker;
