# Network Diagram

Star topology: every device connects to the central switch over Cat6 ethernet.

![Home network star topology](network-diagram.svg)

## Devices

| Device | IP address | Connection |
| --- | --- | --- |
| Router / modem | 192.168.1.254 | Cat6 to switch |
| Server | 192.168.1.194 | Cat6 to switch |
| Main PC | 192.168.1.233 | Cat6 to switch |
| Wireless access point | (not recorded) | Cat6 to switch |

## Editable version (Mermaid)

GitHub renders this block natively, so you can edit it as plain text.

```mermaid
graph TD
    R["Router / modem<br/>192.168.1.254"]
    SW["Switch"]
    S["Server<br/>192.168.1.194"]
    PC["Main PC<br/>192.168.1.233"]
    AP["Wireless access point"]

    R ---|Cat6| SW
    SW ---|Cat6| S
    SW ---|Cat6| PC
    SW ---|Cat6| AP

    classDef gear fill:#EEEDFE,stroke:#534AB7,color:#3C3489
    classDef host fill:#E1F5EE,stroke:#0F6E56,color:#085041
    class R,SW,AP gear
    class S,PC host
```
