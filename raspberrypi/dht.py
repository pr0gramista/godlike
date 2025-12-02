import time
import board
import adafruit_dht
import json

# Sensor is connected to pin GPIO 17
# 4.7k resistor between DATA and VCC
sensor = adafruit_dht.DHT11(board.D17)

while True:
    try:
        # Print the values to the serial port
        temperature_c = sensor.temperature
        temperature_f = temperature_c * (9 / 5) + 32
        humidity = sensor.humidity
        print(
            "Temp={0:0.1f}ºC, Temp={1:0.1f}ºF, Humidity={2:0.1f}%".format(
                temperature_c, temperature_f, humidity
            )
        )

        data = {"temperature": temperature_c, "humidity": humidity}

        try:
            with open("homeconfig/dht.json", "w") as f:
                json.dump(data, f)
        except Exception as e:
            print(f"Error writing to file {e}")

    except RuntimeError as error:
        # Errors happen fairly often, DHT's are hard to read, just keep going
        print(error.args[0])
        time.sleep(2.0)
        continue
    except Exception as error:
        sensor.exit()
        raise error

    time.sleep(15.0)
