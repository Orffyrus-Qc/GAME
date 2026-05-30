# Air Filtration Idle Control

IC10 script to automatically switch a `StructureFiltration` (Air Filtration unit) between **Idle** and **Active** mode based on the presence of multiple specific gases detected by a pipe gas analyzer.

## Features

- Monitor **up to 8 gases** at the same time.
- Flexible activation logic using `REQUIRED_COUNT`.
- Only activates the air filtration when enough of the selected gases are detected.
- Keeps the unit in Idle mode when conditions are not met (saves power).
- Easy to configure at the top of the script.

## Required Devices & Labels

| Device                    | Prefab                  | Recommended Label      | Purpose |
|---------------------------|-------------------------|------------------------|---------|
| Air Filtration Unit       | `StructureFiltration`   | `AIR_FILTRATION`       | The machine to control |
| Pipe Gas Analyzer         | `StructurePipeAnalysizer` | `PIPE_ANALYZER`      | Analyzes gas in the pipe/network |

## Setup Instructions

1. Place an IC10 chip programmed with this script into any IC socket.
2. Label your **Air Filtration** unit `AIR_FILTRATION`.
3. Label your **Pipe Gas Analyzer** `PIPE_ANALYZER`.
4. Edit the configuration section at the top of the script (see below).
5. Optionally adjust `THRESHOLD` and `REQUIRED_COUNT`.

## Configuration

### 1. Define your gases (up to 8)

```ic10
define GAS_COUNT 3

define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define GAS3 "RatioCarbonDioxide"
# define GAS4 "RatioPollutant"
# ... up to GAS8
```

### 2. Set how many gases are required

```ic10
define REQUIRED_COUNT 2
```

**Examples of `REQUIRED_COUNT` usage:**

- `REQUIRED_COUNT = 1` → Activate if **any** of the selected gases is present.
- `REQUIRED_COUNT = 2` → Activate only if **at least 2** of the selected gases are present (very common).
- `REQUIRED_COUNT = 3` → Activate only if **at least 3** gases match.
- `REQUIRED_COUNT = GAS_COUNT` → Activate only if **all** selected gases are present.

### 3. Set detection sensitivity

```ic10
define THRESHOLD 0.05   # 5% minimum concentration
```

## Available Gases (Latest Stationeers)

- `RatioOxygen`
- `RatioNitrogen`
- `RatioCarbonDioxide`
- `RatioVolatiles`
- `RatioPollutant`
- `RatioWater`
- `RatioNitrousOxide`
- `RatioHydrogen`

## How It Works

1. The script reads all the gases you defined from the `PIPE_ANALYZER`.
2. It counts how many of them are above the `THRESHOLD`.
3. If `count >= REQUIRED_COUNT` → sets the `AIR_FILTRATION` to **Active** mode.
4. Otherwise → sets the filtration unit to **Idle** mode.

This gives you very precise control over when expensive air filtration should run.

## Configuration Examples

**Example 1: Activate on any dangerous gas**
```ic10
define GAS_COUNT 4
define GAS1 "RatioVolatiles"
define GAS2 "RatioCarbonDioxide"
define GAS3 "RatioPollutant"
define GAS4 "RatioNitrousOxide"
define REQUIRED_COUNT 1
```

**Example 2: Activate only when both Oxygen and Volatiles are high**
```ic10
define GAS_COUNT 2
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define REQUIRED_COUNT 2
```

**Example 3: Activate when at least 2 out of 4 monitored gases are present**
```ic10
define GAS_COUNT 4
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define GAS3 "RatioCarbonDioxide"
define GAS4 "RatioPollutant"
define REQUIRED_COUNT 2
```

## Notes & Tips

- The script is designed to be very easy to customize at the top.
- If your version of Stationeers uses a different property than `Mode` for the filtration unit (e.g. `On` or `Setting`), you can change the `s` instructions easily.
- Works with a single IC10 chip.
- Safe for continuous operation.

## Author

Created for Orffyrus's Stationeers collection.

## Related Scripts

- `AC_HEATER` – Smart heater control based on AC mode
- `ATMO_MATRIX` – Atmosphere control system
- `CO2_ROOM_CONTROL` – CO2 management
