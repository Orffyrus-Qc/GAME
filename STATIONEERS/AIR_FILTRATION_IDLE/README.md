# Air Filtration Idle Control

IC10 script to automatically switch a `StructureFiltration` (Air Filtration unit) between **Idle** and **Active** mode based on the presence of multiple specific gases detected by a pipe gas analyzer.

## Features

- Monitor **up to 16 gases** at the same time.
- Extremely flexible activation logic using `REQUIRED_COUNT`.
- Only activates the air filtration when enough of the selected gases are detected.
- Keeps the unit in Idle mode when conditions are not met (saves power).
- Designed to be easy to scale as new gases are added in future Stationeers updates.

## Required Devices & Labels

| Device                    | Prefab                  | Recommended Label      | Purpose |
|---------------------------|-------------------------|------------------------|---------|
| Air Filtration Unit       | `StructureFiltration`   | `AIR_FILTRATION`       | The machine to control |
| Pipe Gas Analyzer         | `StructurePipeAnalysizer` | `PIPE_ANALYZER`      | Analyzes gas in the pipe/network |

## Setup Instructions

1. Place an IC10 chip programmed with this script into any IC socket.
2. Label your **Air Filtration** unit `AIR_FILTRATION`.
3. Label your **Pipe Gas Analyzer** `PIPE_ANALYZER`.
4. Edit the configuration section at the top of the script.
5. Adjust `GAS_COUNT`, `REQUIRED_COUNT`, and `THRESHOLD` as needed.

## Configuration

### 1. Set how many gases you're using

```ic10
define GAS_COUNT 5
```

### 2. Define your gases (up to 16)

```ic10
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define GAS3 "RatioCarbonDioxide"
define GAS4 "RatioPollutant"
define GAS5 "RatioWater"
# define GAS6 "..."
# ... up to GAS16
```

### 3. Set the activation threshold

```ic10
define REQUIRED_COUNT 2
```

**Common `REQUIRED_COUNT` strategies:**

- `1` → Activate on **any** dangerous or desired gas
- `2` or `3` → Activate only when multiple concerning gases appear together
- `GAS_COUNT` → Activate only when **all** monitored gases meet the criteria

### 4. Detection sensitivity

```ic10
define THRESHOLD 0.05   # 5%
```

## Available Gases

Current common gases in Stationeers (add new ones as the game updates):

- `RatioOxygen`
- `RatioNitrogen`
- `RatioCarbonDioxide`
- `RatioVolatiles`
- `RatioPollutant`
- `RatioWater`
- `RatioNitrousOxide`
- `RatioHydrogen`

## How It Works

1. The script reads every gas you have defined.
2. It counts how many of them are currently above the `THRESHOLD`.
3. If the count is **greater than or equal to** `REQUIRED_COUNT`, the air filtration is set to **Active**.
4. Otherwise it is set to **Idle**.

This system scales very well whether you're watching 2 gases or 12.

## Practical Examples

**Monitor many possible contaminants, activate on any 2:**
```ic10
define GAS_COUNT 8
define GAS1 "RatioVolatiles"
define GAS2 "RatioCarbonDioxide"
define GAS3 "RatioPollutant"
define GAS4 "RatioNitrousOxide"
define GAS5 "RatioWater"
define GAS6 "..."
define GAS7 "..."
define GAS8 "..."
define REQUIRED_COUNT 2
```

**Very strict: Only run filtration when 4 specific gases are all present**
```ic10
define GAS_COUNT 4
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define GAS3 "RatioCarbonDioxide"
define GAS4 "RatioPollutant"
define REQUIRED_COUNT 4   # Must have all 4
```

**Simple "any bad gas" mode (great for general air cleaning)**
```ic10
define GAS_COUNT 6
define GAS1 "RatioVolatiles"
define GAS2 "RatioCarbonDioxide"
define GAS3 "RatioPollutant"
define GAS4 "RatioNitrousOxide"
define GAS5 "RatioWater"
define GAS6 "RatioHydrogen"
define REQUIRED_COUNT 1
```

## Notes & Tips

- The unrolled checks (GAS1 through GAS16) are easy to enable by uncommenting blocks.
- If your filtration device uses a different control property than `Mode`, you can change the `s` lines at the bottom.
- 16 gases is more than enough for current and near-future Stationeers versions.
- Works with a single IC10 chip.

## Author

Created for Orffyrus's Stationeers collection.

## Related Scripts

- `AC_HEATER` – Smart heater control based on AC mode
- `ATMO_MATRIX` – Atmosphere control system
- `CO2_ROOM_CONTROL` – CO2 management
