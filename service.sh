# This script will be executed in late_start service mode
# More info in the main Magisk thread
setenforce 0
stop thermald


#set GED to defaults
echo 0 >/sys/module/ged/parameters/gx_game_mode
	echo 0 >/sys/module/ged/parameters/gx_force_cpu_boost
	echo 0 > /sys/module/ged/parameters/boost_amp
	echo 0 > /sys/module/ged/parameters/boost_extra
	echo 0 > /sys/module/ged/parameters/boost_gpu_enable
	echo 0 > /sys/module/ged/parameters/enable_cpu_boost
	echo 0 > /sys/module/ged/parameters/enable_gpu_boost
	echo 0 > /sys/module/ged/parameters/enable_game_self_frc_detect
	echo 20 > /sys/module/ged/parameters/gpu_idle
	echo 0 > /sys/module/ged/parameters/cpu_boost_policy
	echo 0 > /sys/module/ged/parameters/ged_force_mdp_enable
	echo 0 > /sys/module/ged/parameters/ged_boost_enable
	echo 0 > /sys/module/ged/parameters/ged_smart_boost
	echo 0 > /sys/module/ged/parameters/gx_frc_mode
	echo 0 > /sys/module/ged/parameters/gx_boost_on


# Update to Boosted GED Module Values
echo 1 >/sys/module/ged/parameters/gx_game_mode
echo 1 > /sys/module/ged/parameters/enable_cpu_boost
echo 1> /sys/module/ged/parameters/enable_gpu_boost
echo 0 > /sys/module/ged/parameters/boost_gpu_enable
echo 900000 > /sys/module/ged/parameters/gpu_cust_boost_freq
echo 20 > /sys/module/ged/parameters/gpu_idle
echo 1 > /sys/module/ged/parameters/enable_game_self_frc_detect
echo 90 > /sys/module/ged/parameters/cpu_boost_policy
echo 1 > /sys/module/ged/parameters/is_GED_KPI_enabled
echo 1 >/sys/module/ged/parameters/gx_3D_benchmark_on
echo 20 >/sys/module/ged/ap_self_frc_detection_rate
echo 0 > /sys/module/ged/parameters/gpu_debug_enable
echo 1 > /sys/module/ged/parameters/gpu_dvfs_enable
# lock GPU frequency to highest for best gaming experience
	echo Lock GPU to 900MHz
	echo echo 900000,480000>  /proc/gpufreq/gpufreq_opp_freq
        echo set Min Freq to 480mhz
       echo 480000 > /sys/module/ged/parameters/gpu_bottom_freq
	echo Done
	echo

#EnableFastCharge
echo "1" >/proc/fastchg_fw_update

echo GED Modules enabled
echo

# change CPU mode
echo "1" > /proc/sys/slide_boost_enabled
echo 1 > /proc/cpufreq/cpufreq_cci_mode
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo "0 2 5 11 2 16" > /proc/driver/thermal/clatm_cpu_min_opp
echo 1 > /proc/cpufreq/cpufreq_stress_test
echo "0 2 5 11 2 16"> /proc/driver/thermal/clatm_cpu_min_opp
echo 0 > /proc/cpufreq/cpufreq_stress_test
echo 1 > /proc/cpufreq/cpufreq_imax_enable
echo 0 > /proc/cpufreq/cpufreq_imax_thermal_protect
echo 7 > /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_turbo_mode
echo switch 0 > /proc/driver/thermal/tztsAll_enable
echo "turbo_mode 1,0,0" > /proc/cpufreq/MT_CPU_DVFS_CCI/cpufreq_turbo_mode
echo "16" > /proc/sys/kernel/perf_cpu_time_max_percent
echo enable perfserv boost
echo "1">/proc/perfmgr/boost_ctrl/eas_ctrl/perfserv_ta_boost
echo "1">/proc/sys/kernel/launcher_boost_enabled


# PPM
echo "1"> /proc/ppm/enabled
        echo  "1"> /proc/ppm/profile/profile_on
	echo 0 0> /proc/ppm/policy_status
	echo 1 1> /proc/ppm/policy_status
	echo 2 0> /proc/ppm/policy_status
	echo 3 0> /proc/ppm/policy_status
	echo 4 0> /proc/ppm/policy_status
	echo 5 0> /proc/ppm/policy_status
	echo 6 0> /proc/ppm/policy_status
	echo 7 0> /proc/ppm/policy_status
	echo 8 0> /proc/ppm/policy_status
	echo 9 1> /proc/ppm/policy_status

# change Governor to performance(Freezes on schedutil)
	echo Change Governor to performance
	echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
	echo performance > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
	echo Done
	

#RAM Optimizations
echo "60" > /proc/sys/vm/vfs_cache_pressure
echo "10" > /proc/sys/vm/stat_interval
echo "9" > /proc/sys/vm/dirty_ratio
echo "3" > /proc/sys/vm/dirty_background_ratio
echo "160" > /proc/sys/vm/direct_swapiness
echo "110" > /proc/sys/vm/swapiness

#KernelTweaks
echo "40"> /proc/sys/kernel/boost_task_threshold
echo "60"> /proc/sys/kernel/frame_rate


# Fix Touch Screen
echo Fix Touch Screen by enable Oplus TP Direction and disable limit
echo "1" > /proc/touchpanel/oplus_tp_direction
echo "0" > /proc/touchpanel/oplus_tp_limit_enable
echo 0> /proc/touchpanel/game_switch_enable
	
# Disable CABC 
echo Disable CABC Mode for best experience
echo "0" > /sys/kernel/oppo_display/LCM_CABC
	
# Disable some debugging
echo "0" > /sys/kernel/ccci/debug
setprop debug.mediatek.high_frame_rate_multiple_display_mode 0
setprop debug.sf.disable_backpressure 0
	
## POWERHAL SPORT MODE
	echo Add some games to sport mode
	echo -e "com.mobile.legends\ncom.tencent.ig\nskynet.cputhrottlingtest\ncom.miHoYo.GenshinImpact\ncom.pubg.krmobile\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\n" > /data/vendor/powerhal/smart
	echo Done

# CPUStune
	echo Tune CPU Load to high priority for big Cluster

#Foreground
echo 30> /dev/stune/foreground/schedtune.boost
	echo 1> /dev/stune/foreground/schedtune.prefer_idle

	# Realtime
	echo 30> /dev/stune/rt/schedtune.boost
	echo 0> /dev/stune/rt/schedtune.prefer_idle
	
	# Background
	echo 0> /dev/stune/background/schedtune.util.max.effective
	echo 0> /dev/stune/background/schedtune.util.min.effective
	echo 0> /dev/stune/background/schedtune.util.max
	echo 0> /dev/stune/background/schedtune.util.min
	echo 30> /dev/stune/background/schedtune.boost
	echo 1> /dev/stune/background/schedtune.prefer_idle

# Top-App
	echo 1024> /dev/stune/top-app/schedtune.util.max.effective
	echo 0> /dev/stune/top-app/schedtune.util.min.effective
	echo 1024> /dev/stune/top-app/schedtune.util.max
	echo 0> /dev/stune/top-app/schedtune.util.min
	echo 60> /dev/stune/top-app/schedtune.boost
	echo 0> /dev/stune/top-app/schedtune.prefer_idle

# Global
	echo 0> /dev/stune/schedtune.util.min
	echo 1024> /dev/stune/schedtune.util.max
	echo 1024> /dev/stune/schedtune.util.max.effective
	echo 0> /dev/stune/schedtune.util.min.effective
	echo 0> /dev/stune/schedtune.boost
	echo 0> /dev/stune/schedtune.prefer_idle
	echo Done
	echo

# This script made by @AbzRaider
#Mod of RyuX2.3 with RUI 1 Perf Profile Kang

	# force sched to EAS
	echo 1 > /sys/devices/system/cpu/eas/enable

	echo 650000> /sys/devices/system/cpu/cpufreq/schedutil/down_rate_limit_us
	echo 0> /sys/devices/system/cpu/cpufreq/schedutil/up_rate_limit_us


#Disable-TimerMigration
echo "0" > /proc/sys/kernel/timer_migration




	


#CPUSetsforMT6785
#This is Tweaked CPU Sets for MT6785 From @helloklf on GitHub


echo 0-7> /dev/cpuset/foreground/cpus
echo 2-4> /dev/cpuset/background/cpus
echo 0-3> /dev/cpuset/system-background/cpus
echo 0-7> /dev/cpuset/top-app/cpus
echo 0-4> /dev/cpuset/restricted/cpus
echo 0-7>/dev/cpuset/camera-daemon/cpus