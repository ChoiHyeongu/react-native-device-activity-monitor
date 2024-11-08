import React from 'react';
import {
  StyleSheet,
  View,
  Text,
  SafeAreaView,
  TouchableOpacity,
} from 'react-native';
import {DeviceActivityReport} from '../components';
import {Segment} from '../enums';

function MainScreen(): React.JSX.Element {
  const [segment, setSegment] = React.useState<Segment>(Segment.Daily);

  function onPressSegment(value: Segment) {
    setSegment(value);
  }

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.segmentButtonContainer}>
        <Button
          label={'Hourly'}
          onPress={() => onPressSegment(Segment.Hourly)}
        />
        <Button label={'Daily'} onPress={() => onPressSegment(Segment.Daily)} />
        <Button
          label={'Weekly'}
          onPress={() => onPressSegment(Segment.Weekly)}
        />
      </View>
      <DeviceActivityReport segment={segment} style={styles.screeTime} />
    </SafeAreaView>
  );
}

function Button({label}: {label: string; onPress: () => void}) {
  return (
    <TouchableOpacity style={styles.buttonContainer}>
      <Text style={styles.buttonLabel}>{label}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  screeTime: {
    flex: 1,
    borderWidth: 1,
    paddingTop: 8,
    paddingBottom: 16,
    paddingHorizontal: 12,
  },
  segmentButtonContainer: {
    flexDirection: 'row',
  },
  buttonContainer: {
    flex: 1,
    height: 60,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 12,
  },
  buttonLabel: {
    fontSize: 20,
    fontWeight: '700',
  },
});

export default MainScreen;
