import { useState } from "react";
import { StyleSheet, SafeAreaView, View } from "react-native";

import { DeviceActivityReport } from "@/components";
import { Device, SegmentInterval, User } from "@/enum";

import {
  DatePicker,
  DeviceCheckbox,
  IntervalSegmentedButtons,
  UserSegmentedButtons,
} from "./components";

function MainScreen() {
  const [interval, setInterval] = useState<SegmentInterval>(
    SegmentInterval.Weekly
  );
  const [users, setUsers] = useState<User>(User.All);
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(new Date());
  const [devices, setDevices] = useState<Device[]>([Device.iPhone]);

  function onChangeInterval(value: SegmentInterval) {
    setInterval(value);
  }

  function onChangeUser(value: User) {
    setUsers(value);
  }

  function onChangeDevices(value: Device[]) {
    setDevices(value);
  }

  function onChangeStartDate(date: Date) {
    setStartDate(date);
  }

  function onChangeEndDate(date: Date) {
    setEndDate(date);
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.control}>
        <IntervalSegmentedButtons
          value={interval}
          onChangeValue={onChangeInterval}
        />
        <UserSegmentedButtons value={users} onChangeValue={onChangeUser} />
        <DeviceCheckbox value={devices} onChangeValue={onChangeDevices} />
        <DatePicker
          title={"시작일: "}
          date={startDate}
          onChangeDate={onChangeStartDate}
        />
        <DatePicker
          title={"종료일: "}
          date={endDate}
          onChangeDate={onChangeEndDate}
        />
      </View>
      <DeviceActivityReport
        users={users}
        devices={devices}
        segmentInterval={{
          type: interval,
          start: +startDate,
          end: +endDate,
        }}
        style={styles.screeTime}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  control: {
    paddingTop: 32,
    paddingHorizontal: 20,
    gap: 12,
    paddingBottom: 16,
  },
  screeTime: {
    flex: 1,
    borderWidth: 1,
    borderRadius: 12,
    marginTop: 4,
    marginBottom: 16,
    marginHorizontal: 12,
  },
});

export default MainScreen;
