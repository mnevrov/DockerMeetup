include(FetchContent)
set(SPDLOG_BUILD_EXAMPLE OFF CACHE INTERNAL "")
set(SPDLOG_BUILD_TESTS OFF CACHE INTERNAL "")
FetchContent_Declare(spdlog
        GIT_REPOSITORY https://github.com/gabime/spdlog.git
        GIT_TAG v1.15.2
        BUILD_ALWAYS OFF
        DOWNLOAD_EXTRACT_TIMESTAMP TRUE)
FetchContent_GetProperties(spdlog)
FetchContent_MakeAvailable(spdlog)