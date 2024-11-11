import React, {useState} from 'react';
import {
  StyleSheet,
  View,
  Text,
  SafeAreaView,
  TouchableOpacity,
} from 'react-native';
import {DeviceActivityReport} from '../components';

function MainScreen(): React.JSX.Element {
  const [interval, setInterval] = useState<'hourly' | 'daily' | 'weekly'>(
    'daily',
  );
  const [startDate, setStartDate] = useState(new Date());
  const [endDate, setEndDate] = useState(new Date());
  const [users, setUsers] = useState<'all' | 'children'>('all');
  const [devices, setDevices] = useState<('iPhone' | 'iPad')[]>(['iPhone']);

  const toggleInterval = () => {
    const nextInterval =
      interval === 'hourly'
        ? 'daily'
        : interval === 'daily'
        ? 'weekly'
        : 'hourly';
    setInterval(nextInterval);
  };

  const toggleUsers = () => {
    setUsers(users === 'all' ? 'children' : 'all');
  };

  const toggleDevices = () => {
    setDevices(prevDevices =>
      prevDevices.includes('iPhone') ? ['iPad'] : ['iPhone'],
    );
  };

  const changeStartDate = () => {
    const newStartDate = new Date(startDate.getTime() - 24 * 60 * 60 * 1000);
    setStartDate(newStartDate);
  };

  const changeEndDate = () => {
    const newEndDate = new Date(endDate.getTime() + 24 * 60 * 60 * 1000);
    setEndDate(newEndDate);
  };

  return (
    <SafeAreaView style={styles.container}>
      <View>
        <Text style={styles.label}>Interval: {interval}</Text>
        <TouchableOpacity style={styles.button} onPress={toggleInterval}>
          <Text style={styles.buttonText}>Toggle Interval</Text>
        </TouchableOpacity>

        <Text style={styles.label}>
          Start Date: {startDate.toISOString().split('T')[0]}
        </Text>
        <TouchableOpacity style={styles.button} onPress={changeStartDate}>
          <Text style={styles.buttonText}>Change Start Date (-1 day)</Text>
        </TouchableOpacity>

        <Text style={styles.label}>
          End Date: {endDate.toISOString().split('T')[0]}
        </Text>
        <TouchableOpacity style={styles.button} onPress={changeEndDate}>
          <Text style={styles.buttonText}>Change End Date (+1 day)</Text>
        </TouchableOpacity>

        <Text style={styles.label}>Users: {users}</Text>
        <TouchableOpacity style={styles.button} onPress={toggleUsers}>
          <Text style={styles.buttonText}>Toggle Users</Text>
        </TouchableOpacity>

        <Text style={styles.label}>Devices: {devices.join(', ')}</Text>
        <TouchableOpacity style={styles.button} onPress={toggleDevices}>
          <Text style={styles.buttonText}>Toggle Devices</Text>
        </TouchableOpacity>
      </View>

      <DeviceActivityReport
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
    padding: 16,
  },
  screeTime: {
    flex: 1,
    borderWidth: 1,
    paddingTop: 8,
    paddingBottom: 16,
    paddingHorizontal: 12,
  },
  button: {
    backgroundColor: '#007BFF',
    padding: 12,
    marginVertical: 8,
    borderRadius: 8,
    alignItems: 'center',
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  label: {
    fontSize: 16,
    fontWeight: '600',
    marginVertical: 4,
  },
});

export default MainScreen;
