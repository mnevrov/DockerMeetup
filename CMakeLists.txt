cmake_minimum_required(VERSION 3.25)
project(MeetUp_2)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(DockerMeetup main.cpp)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/spdlog.cmake)
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(PCAP)
find_package(PcapPlusPlus)

target_link_libraries(DockerMeetup spdlog_header_only ${PcapPlusPlus_LIBRARY} ${PCAP_LIBRARY})
target_include_directories(DockerMeetup PRIVATE ${PCAP_INCLUDE_DIR} ${PcapPlusPlus_INCLUDE_DIR})
