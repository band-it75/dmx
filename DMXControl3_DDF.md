# DMXControl3 Device Definition Schema

This document describes the structure of `DMXControl3_DDF.xsd`. Device definition files (DDF) for DMXControl3 must conform to this schema.

## `<device>`
Root element of every DDF.

**Attributes**
- `image` – optional path to an image file.
- `type` – must be `DMXDevice`.
- `dmxaddresscount` – number of DMX channels used.
- `dmxcversion` – DMXControl3 version the file targets.
- `ddfversion` – optional schema version of the fixture file.
- `subdevice` – `yes` or `no` when the file describes a subdevice.
- `defaultdisplaystyle` – `preview`, `image` or `custom`.
- `defaultdisplaycolor` – default color name or hex value for preview.
- `whitechanneldefaultmode` – `none`, `addwhite` or `onlywhite`.
- `amberchanneldefaultmode` – `none`, `add` or `only`.

The element contains three main sections: `<information>`, `<functions>` and optionally `<procedures>`.

## `<information>`
General metadata.

Child elements:
- `model` – fixture model name.
- `vendor` – manufacturer.
- `author` – author of the DDF.
- `mode` – optional mode description.
- `electrical` – optional block with `static` and `dimmer` load values.
- `comment` – free text comment.

Example:
```xml
<information>
  <model>LumiPar 12 UQ Pro</model>
  <vendor>Prolights</vendor>
  <author>Example</author>
</information>
```

## `<functions>`
Defines the DMX channels and their behaviour. Each function entry must conform to `FunctionType`.

Common function tags include:
- `dimmer`, `switch`, `shutter`, `strobe`
- `pan`, `tilt`
- `rgb`, `hsv`, `cmy` for colour mixing groups
- `colorwheel`, `colortemp`
- `matrix` and `radix` for pixel based devices
- `gobowheel`, `goboindex`, `goborotation`, `goboshake`
- `wheelrotation`, `effectwheel`, `effectindex`, `effectrotation`
- `prism`, `prismrotation`
- `focus`, `zoom`, `iris`, `frost`
- `blade`, `blade1`–`blade4`
- `raw`, `rawstep`, `rawrange`

### Function example
```xml
<functions>
  <dimmer dmxchannel="0" defaultval="1" />
  <pan dmxchannel="1" finedmxchannel="2" />
  <tilt dmxchannel="3" />
  <rgb>
    <red   dmxchannel="4" />
    <green dmxchannel="5" />
    <blue  dmxchannel="6" />
  </rgb>
</functions>
```

## `<procedures>`
Optional list of presets or reset actions. Each child is a predefined procedure name such as `lamp_on`, `lamp_off`, `reset`, `reset_pan_tilt`, etc.

A procedure contains `<set>`, `<hold>` or `<restore>` instructions. Example:
```xml
<procedures>
  <lamp_on>
    <set dmxchannel="0" value="255" />
  </lamp_on>
</procedures>
```

## Complex Types
### `FunctionType`
Allows `<step>`, `<range>` or `<support>` sub‑elements and defines channel attributes (`dmxchannel`, `finedmxchannel`, etc.).

### `ColorGroupType`
Grouping of colour channels such as `<red>`, `<green>`, `<blue>` and their abbreviations.

### `RangeType`
Specifies a DMX range with numeric values or nested support steps.

### `ProcedureType`
Structure for procedures using `<set>`, `<hold>` and `<restore>`.

### `ColorChannelType` and `EmptyType`
Utility types used for colour channels and inheritance. The
`dmxchannel` attribute is optional so placeholder nodes can be
specified without a DMX address when a fixture lacks certain
base colours.

## DMX Options
The schema supports several DMX options. Below are common patterns.

### Simple switch
```xml
<switch dmxchannel="0">
  <range type="switch" mindmx="0" maxdmx="255" />
</switch>
```

### Linear range
```xml
<dimmer dmxchannel="1">
  <range type="linear" mindmx="0" maxdmx="255" minval="0" maxval="1" />
</dimmer>
```

### Step list
```xml
<strobe dmxchannel="2">
  <step mindmx="0" maxdmx="10" caption="Off" />
  <step mindmx="11" maxdmx="255" caption="Fast" />
</strobe>
```

### Colour group
```xml
<rgb>
  <red dmxchannel="3" />
  <green dmxchannel="4" />
  <blue dmxchannel="5" />
</rgb>
```

### Procedure with restore
```xml
<procedures>
  <reset_pan_tilt>
    <set dmxchannel="1" value="128" />
    <hold value="2" />
    <restore dmxchannel="1" />
  </reset_pan_tilt>
</procedures>
```

Keep device definition files and this document updated whenever the schema or fixture options change.
