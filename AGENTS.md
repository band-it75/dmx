Hardware we have:
- Prolights LumiPar 12UAW5 (Stage Lights)
- Prolights LumiPar 7UTRI
- Prolights LumiPar 12UQPro
- Prolights PIXIEWASH (Moving Head)
- Smoke Machine

Scenarios we want to cover:
- Intermission: Stage Lights are on, rest of the lights are off
- Slow Pace: red theme, short bursts of smoke frequently every 15 seconds
- Medium Pace: red/yellow theme
- High Pace: green/blue theme with strobes, longer bursts of smoke every 45 seconds
- Applause: Moving Head strobing towards audience

When updating fixtures or resolving issues, keep `DMXControl3_DDF.xsd` and `DMXControl3_DDF.md` in sync with the changes.

Template for fixture MDs:
'''
# {{DeviceName}} – DMX Lighting Fixture Datasheet

## 1. Mounting & Physical Installation

* **Mounting options**: Floor-standing, hanging with bracket (M10 clamp compatible), safety cable point included
* **Bracket**: Dual bracket for angled positioning or fixed truss mounting
* **Cooling**: {{CoolingType}} (e.g. passive / fan-cooled)
* **IP rating**: IP{{IPRating}} – suitable for {{UseCase}}
* **Dimensions (WxHxD)**: {{Dimensions}} mm
* **Weight**: {{Weight}} kg

---

## 2. User Menu & Control

* **Display**: {{DisplayType}} (e.g. LED with 4-button navigation)
* **Control Modes**:

  * DMX512 ({{DMXChannelOptions}} channels)
  * Manual mode (set static values)
  * Auto mode (built-in programs with speed control)
  * IR remote (optional)
  * Master/slave (sync multiple units)
* **Menu Settings**:

  * DMX address
  * Channel mode
  * Dimmer curve
  * Strobe/auto speed
  * Wireless config (if applicable)

---

## 3. DMX Parameters

* **Supported DMX Modes**: {{ChannelModes}}
* **DMX Connector**: {{ConnectorType}} (e.g. 3-pin XLR in/out)
* **Example Channel Map (7ch mode)**:

| CH | Function       | Range | Notes                    |
| -- | -------------- | ----- | ------------------------ |
| 1  | Dimmer         | 0–255 | 0=off, 255=full          |
| 2  | Strobe         | 0–255 | Speed control            |
| 3  | Warm White     | 0–255 | Independent WW intensity |
| 4  | Cold White     | 0–255 | Independent CW intensity |
| 5  | CCT Presets    | 0–255 | Predefined CT ranges     |
| 6  | Program Select | 0–255 | For auto mode            |
| 7  | Program Speed  | 0–255 | Applies to auto programs |

---

## 4. Electrical Specifications

* **Input Voltage**: 100–240 V AC, 50/60 Hz
* **Max Power Consumption**: {{MaxPower}} W
* **Power Connections**: {{PowerConnType}} IN/OUT
* **Power Linking**:

  * Max {{LinkedUnits230V}} units @ 230 V
  * Max {{LinkedUnits120V}} units @ 120 V
* **Thermal Range**: –10 °C to +45 °C

'''
