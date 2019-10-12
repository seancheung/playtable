# Playtable

Virtual Playtable unofficial server docker image

## Image

```bash
docker pull seancheung/playtable:<tag>
```

## Tags

| tag    | description |
| ------ | ----------- |
| latest | v0.9.5      |
| 0.9.5  | v0.9.5      |

## Environments

| Name    | default                                  |
| ------- | ---------------------------------------- |
| VPT_DIR | Virtual Playtable installation directory |

## Custom build Args

| Name    | default                                                |
| ------- | ------------------------------------------------------ |
| VPT_URL | https://virtualplaytable.com/download/vpt0952setup.exe |

## Usage

```bash
docker run -d --name vpt -p 4754:4754/udp -p 4754:4754 seancheung/playtable:latest
```

| port     | description     |
| -------- | --------------- |
| 4754     | server tcp port |
| 4754/udp | server udp port |
