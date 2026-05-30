# Air Filtration Idle Control

IC10 script to automatically switch a StructureFiltration (Air Filtration unit) between Idle and Active mode based on the presence of up to 2 specific gases detected by a pipe gas analyzer.

## Features

- Monitor 1 or 2 gases (maximum supported by the filtration unit).
- Flexible activation logic using REQUIRED_COUNT.
- Only activates the air filtration when the required number of selected gases are detected.
- Keeps the unit in Idle mode when conditions are not met (saves power).
- Simple and efficient.

## Required Devices and Labels

| Device                    | Prefab                  | Recommended Label      | Purpose |
|---------------------------|-------------------------|------------------------|---------|
| Air Filtration Unit       | StructureFiltration     | AIR_FILTRATION         | The machine to control |
| Pipe Gas Analyzer         | StructurePipeAnalysizer | PIPE_ANALYZER          | Analyzes gas in the pipe/network |

## Setup Instructions

1. Place an IC10 chip programmed with this script into any IC socket.
2. Label your Air Filtration unit AIR_FILTRATION.
3. Label your Pipe Gas Analyzer PIPE_ANALYZER.
4. Edit the configuration section at the top of the script.
5. Adjust GAS_COUNT, REQUIRED_COUNT, and THRESHOLD as needed.

## Configuration

### 1. Set how many gases you are using (1 or 2)

```ic10
define GAS_COUNT 2
```

### 2. Define your gases

```ic10
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"     # Remove or comment this line if using only 1 gas
```

### 3. Set the activation threshold

```ic10
define REQUIRED_COUNT 2
```

Common REQUIRED_COUNT strategies:

- 1 → Activate if any of the selected gases is present
- 2 → Activate only if both selected gases are present (when using 2 gases)

### 4. Detection sensitivity

```ic10
define THRESHOLD 0.05   # 5%
```

## Available Gases

- RatioOxygen
- RatioNitrogen
- RatioCarbonDioxide
- RatioVolatiles
- RatioPollutant
- RatioWater
- RatioNitrousOxide
- RatioHydrogen

## How It Works

1. The script reads the gases you have defined from the PIPE_ANALYZER.
2. It counts how many of them are currently above the THRESHOLD.
3. If the count is greater than or equal to REQUIRED_COUNT, the air filtration is set to Active.
4. Otherwise it is set to Idle.

## Configuration Examples

**Activate only when both Oxygen and Volatiles are present (default behavior):**

```ic10
define GAS_COUNT 2
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define REQUIRED_COUNT 2
```

**Activate if any one of two dangerous gases is detected:**

```ic10
define GAS_COUNT 2
define GAS1 "RatioVolatiles"
define GAS2 "RatioCarbonDioxide"
define REQUIRED_COUNT 1
```

**Monitor only one gas:**

```ic10
define GAS_COUNT 1
define GAS1 "RatioVolatiles"
define REQUIRED_COUNT 1
```

## Notes and Tips

- This version is limited to a maximum of 2 gases due to limitations of the filtration unit.
- The script is kept simple and efficient.
- If your filtration device uses a different control property than Mode, you can easily change the s instructions.
- Works with a single IC10 chip.
- Safe for continuous operation.

## Author

Created for Orffyrus's Stationeers collection.

## Related Scripts

- AC_HEATER – Smart heater control based on AC mode
- ATMO_MATRIX – Atmosphere control system
- CO2_ROOM_CONTROL – CO2 management
