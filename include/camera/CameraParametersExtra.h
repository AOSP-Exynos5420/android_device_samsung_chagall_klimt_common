/*
 * Copyright (C) 2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define CAMERA_PARAMETERS_EXTRA_C \
 \
void DurationTimer::start(void)  \
{ \
    gettimeofday(&mStartWhen, NULL); \
} \
 \
void DurationTimer::stop(void) \
{ \
    gettimeofday(&mStopWhen, NULL); \
} \
 \
long long DurationTimer::durationUsecs(void) const \
{ \
    return (long) subtractTimevals(&mStopWhen, &mStartWhen); \
} \
 \
/*static*/ long long DurationTimer::subtractTimevals(const struct timeval* ptv1, \
    const struct timeval* ptv2) \
{ \
    long long stop  = ((long long) ptv1->tv_sec) * 1000000LL + \
                      ((long long) ptv1->tv_usec); \
    long long start = ((long long) ptv2->tv_sec) * 1000000LL + \
                      ((long long) ptv2->tv_usec); \
    return stop - start; \ \
} \
 \
/*static*/ void DurationTimer::addToTimeval(struct timeval* ptv, long usec) \
{ \
    if (usec < 0) { \
        ALOG(LOG_WARN, "", "Negative values not supported in addToTimeval\n"); \
        return; \
    } \
 \
    if (ptv->tv_usec >= 1000000) { \
        ptv->tv_sec += ptv->tv_usec / 1000000; \
        ptv->tv_usec %= 1000000; \
    } \
 \
    ptv->tv_usec += usec % 1000000; \
    if (ptv->tv_usec >= 1000000) { \
        ptv->tv_usec -= 1000000; \
        ptv->tv_sec++; \
    } \
    ptv->tv_sec += usec / 1000000; \
} \
 \
const char CameraParameters::KEY_CITYID[] = "cityid"; \
const char CameraParameters::KEY_WEATHER[] = "weather"; \
const char CameraParameters::ISO_AUTO[] = "auto"; \
const char CameraParameters::ISO_100[] = "ISO100"; \
const char CameraParameters::ISO_200[] = "ISO200"; \
const char CameraParameters::ISO_400[] = "ISO400"; \
const char CameraParameters::ISO_800[] = "ISO800"; \
 \
int CameraParameters::getInt64(const char *key __attribute__ ((unused))) const \
{ \
    return -1; \
} \
 \
extern "C" { \
    void acquire_dvfs_lock(void) { } \
    void release_dvfs_lock(void) { } \
} \
 \
#define CAMERA_PARAMETERS_EXTRA_H \
 \
class DurationTimer { \
public: \
    DurationTimer() {} \
    ~DurationTimer() {} \
    void start(); \
    void stop(); \
    long long durationUsecs() const; \
    static long long subtractTimevals(const struct timeval* ptv1, \
        const struct timeval* ptv2); \
    static void addToTimeval(struct timeval* ptv, long usec); \
private: \
    struct timeval  mStartWhen; \
    struct timeval  mStopWhen; \
}; \
 \
    int getInt64(const char *key) const; \
 \
    static const char KEY_CITYID[]; \
    static const char KEY_WEATHER[]; \
    static const char ISO_AUTO[]; \
    static const char ISO_100[]; \
    static const char ISO_200[]; \
    static const char ISO_400[]; \
    static const char ISO_800[]; \
    /* LAST_LINE OF CAMERA_PARAMETERS_EXTRA_H, every line before this one *MUST* have
     * a backslash \ at the end of the line or else everything will break.
     */