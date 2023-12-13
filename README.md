# Heart Rate Monitoring Software with Qt on Raspberry Pi

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Bluetooth Communication](#bluetooth-communication)
- [ADC Converter Setup](#adc-converter-setup)


## Introduction

Welcome to the Heart Rate Monitoring Software with Qt on Raspberry Pi! This project is a comprehensive solution for real-time heart rate monitoring and visualization, designed to empower individuals with valuable insights into their cardiovascular health. Heart rate monitoring is crucial for a variety of applications, including fitness tracking, medical research, and personal health assessment. This software harnesses the power of Raspberry Pi and Qt to provide users with a sophisticated yet user-friendly tool for heart rate analysis.

## Features

- Real-time ECG Visualization: Our software captures and displays the electrocardiogram (ECG) waveform in real-time, allowing users to observe the electrical activity of their heart as it happens. The ECG waveform is presented graphically, making it easy to identify irregularities or changes in heart rhythms.

- Heart Rate Assessment: Beyond ECG visualization, our software calculates and displays the heart rate in beats per minute (BPM). Users can instantly assess their heart's performance, making it an invaluable tool for monitoring heart health during physical activities or daily routines.

- Wireless Data Transfer: The software leverages Bluetooth technology to communicate wirelessly with another Raspberry Pi equipped with a pulse sensor. This means users can monitor their heart rate remotely, making it suitable for applications like telemedicine, remote patient monitoring, or fitness coaching.

## Requirements

To use this software, you will need the following:

- Raspberry Pi (Tested on Raspberry Pi 4B and later models)
- Pulse sensor connected to another Raspberry Pi
- Bluetooth adapters on both Raspberry Pis
- Qt development environment installed on the target Raspberry Pi

## Bluetooth Communication

This software communicates with another Raspberry Pi that is connected to a pulse sensor via Bluetooth. Please note the following important details:

1. **ADC Converter Requirement**: The Raspberry Pi used for connecting to the pulse sensor must have an ADC (Analog-to-Digital Converter) since the Raspberry Pi's GPIO pins do not support analog signal input. Ensure that you have the necessary ADC hardware and that it's properly configured.

2. **Configuring Bluetooth Address**: To establish a Bluetooth connection, you need to configure the Bluetooth address in the `ads.py` file. Follow these steps:

    - Open the `ads.py` file in your project.
    
    - Locate the Bluetooth address configuration section.

    - Update the Bluetooth address to match the address of the Raspberry Pi running the Qt program. 

    - Save and close the `ads.py` file.

Ensure that both Raspberry Pis are paired and properly configured for Bluetooth communication.

## ADC Converter Setup

If you're not already familiar with setting up an ADC converter on a Raspberry Pi, here are some general steps to guide you:

1. Acquire a compatible ADC converter for your Raspberry Pi model.

2. Install any necessary drivers or libraries for the ADC converter as per the manufacturer's instructions. We use ads7830 converter in this project.

3. Connect the pulse sensor to the ADC converter following the provided pinout or wiring instructions.

4. Modify your code to interface with the ADC converter and read analog data from the pulse sensor correctly.

For detailed information on setting up your specific ADC converter, refer to the documentation provided with the hardware.

---

Please note that the above instructions are essential for the proper functioning of your heart rate monitoring system. Make sure to follow them carefully to ensure a successful setup and operation of your project.

