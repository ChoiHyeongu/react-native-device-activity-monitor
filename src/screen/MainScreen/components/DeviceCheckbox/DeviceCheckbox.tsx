import { StyleSheet, View } from "react-native";
import { Checkbox } from "react-native-paper";

import { Device } from "@/enum";

import { DeviceCheckboxProps } from "./DeviceCheckbox.type";

function DeviceCheckbox({ value = [], onChangeValue }: DeviceCheckboxProps) {
  function onChangeiPad() {
    handleChangeValue(Device.iPad);
  }

  function onChangeiPhone() {
    handleChangeValue(Device.iPhone);
  }

  function onChangeMac() {
    handleChangeValue(Device.Mac);
  }

  function handleChangeValue(newValue: Device) {
    const isChecked = isCheckedDevice(newValue);

    if (isChecked) {
      onChangeValue(value.filter((device) => device !== newValue));
    } else {
      onChangeValue([...value, newValue]);
    }
  }

  function isCheckedDevice(device: Device) {
    return !!value.includes(device);
  }

  function getStatus(device: Device) {
    return isCheckedDevice(device) ? "checked" : "unchecked";
  }

  return (
    <View style={styles.container}>
      <Checkbox.Item
        label={"iPhone"}
        status={getStatus(Device.iPhone)}
        onPress={onChangeiPhone}
      />
      <Checkbox.Item
        label={"iPad"}
        status={getStatus(Device.iPad)}
        onPress={onChangeiPad}
      />
      <Checkbox.Item
        label={"Mac"}
        status={getStatus(Device.Mac)}
        onPress={onChangeMac}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-around",
  },
});

export default DeviceCheckbox;
