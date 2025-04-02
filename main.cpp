#include <spdlog/spdlog.h>
#include <PcapLiveDeviceList.h>

int main()
{
    const auto devices = pcpp::PcapLiveDeviceList::getInstance().getPcapLiveDevicesList();
    for (const auto& device : devices) {
        if (device->getMacAddress() == pcpp::MacAddress::Zero || device->getIPv4Address() == pcpp::IPv4Address::Zero) {
            continue;
        }

        SPDLOG_INFO("\nDevice name:\t{}\nIP address:\t\t{}\nGateway:\t\t{}\nMAC address:\t{}",
                    device->getName(), device->getIPv4Address().toString(), device->getDefaultGateway().toString(),
                    device->getMacAddress().toString());
    }
    return 0;
}
