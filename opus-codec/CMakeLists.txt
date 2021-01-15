# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# 设置CMake最低版本号要求
cmake_minimum_required(VERSION 3.4.1)

# 设置变量
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")
set(libs_include_opus_DIR src/main/jni/libopus)

# 向工程添加多个特定的头文件搜索路径，路径之间用空格分隔，如果路径包含空格，可以使用双引号将它括起来。
# 默认的行为是追加到当前头文件搜索路径的后面。有如下两种方式可以控制搜索路径添加的位置：
#       CMAKE_INCLUDE_DIRECTORIES_BEFORE,通过SET这个cmake变量为on,可以将添加的头文件搜索路径放在已有路径的前面
#       通过AFTER或BEFORE参数,也可以控制是追加还是置前
include_directories(
        ${libs_include_opus_DIR}/include
        ${libs_include_opus_DIR}/celt
        ${libs_include_opus_DIR}/silk
        ${libs_include_opus_DIR}/silk/float
        ${libs_include_opus_DIR}/src)

# 生成库文件
# opusutil为库名
# SHARED表示生成动态库(SHARED动态库，STATIC静态库，MOUDLE模块)
# 之后的文件为生成库依赖的源文件
add_library(
        opusutil

        SHARED

        src/main/jni/opus_util.c
        src/main/jni/libopus/src/opus_multistream_decoder.c
        src/main/jni/libopus/src/opus_multistream_encoder.c
        src/main/jni/libopus/src/opus_multistream.c
        src/main/jni/libopus/src/opus_encoder.c
        src/main/jni/libopus/celt/celt_encoder.c
        src/main/jni/libopus/celt/bands.c
        src/main/jni/libopus/celt/entcode.c
        src/main/jni/libopus/celt/entdec.c
        src/main/jni/libopus/celt/entenc.c
        src/main/jni/libopus/celt/mathops.c
        src/main/jni/libopus/celt/vq.c
        src/main/jni/libopus/celt/cwrs.c
        src/main/jni/libopus/celt/celt.c
        src/main/jni/libopus/celt/mdct.c
        src/main/jni/libopus/celt/kiss_fft.c
        src/main/jni/libopus/celt/bands.c
        src/main/jni/libopus/celt/pitch.c
        src/main/jni/libopus/celt/celt_lpc.c
        src/main/jni/libopus/celt/quant_bands.c
        src/main/jni/libopus/celt/laplace.c
        src/main/jni/libopus/celt/modes.c
        src/main/jni/libopus/celt/rate.c
        src/main/jni/libopus/silk/lin2log.c
        src/main/jni/libopus/silk/enc_API.c
        src/main/jni/libopus/silk/resampler.c
        src/main/jni/libopus/silk/resampler_private_IIR_FIR.c
        src/main/jni/libopus/silk/resampler_private_up2_HQ.c
        src/main/jni/libopus/silk/resampler_private_down_FIR.c
        src/main/jni/libopus/silk/resampler_private_AR2.c
        src/main/jni/libopus/silk/resampler_rom.c
        src/main/jni/libopus/silk/float/encode_frame_FLP.c
        src/main/jni/libopus/silk/gain_quant.c
        src/main/jni/libopus/silk/log2lin.c
        src/main/jni/libopus/silk/encode_pulses.c
        src/main/jni/libopus/silk/code_signs.c
        src/main/jni/libopus/silk/tables_pulses_per_block.c
        src/main/jni/libopus/silk/tables_other.c
        src/main/jni/libopus/silk/shell_coder.c
        src/main/jni/libopus/silk/encode_indices.c
        src/main/jni/libopus/silk/tables_LTP.c
        src/main/jni/libopus/silk/tables_pitch_lag.c
        src/main/jni/libopus/silk/NLSF_unpack.c
        src/main/jni/libopus/silk/tables_gain.c
        src/main/jni/libopus/silk/float/wrappers_FLP.c
        src/main/jni/libopus/silk/quant_LTP_gains.c
        src/main/jni/libopus/silk/VQ_WMat_EC.c
        src/main/jni/libopus/silk/NSQ.c
        src/main/jni/libopus/silk/LPC_analysis_filter.c
        src/main/jni/libopus/silk/NSQ_del_dec.c
        src/main/jni/libopus/silk/process_NLSFs.c
        src/main/jni/libopus/silk/NLSF2A.c
        src/main/jni/libopus/silk/bwexpander_32.c
        src/main/jni/libopus/silk/LPC_inv_pred_gain.c
        src/main/jni/libopus/silk/table_LSF_cos.c
        src/main/jni/libopus/silk/NLSF_encode.c
        src/main/jni/libopus/silk/NLSF_decode.c
        src/main/jni/libopus/silk/NLSF_stabilize.c
        src/main/jni/libopus/silk/sort.c
        src/main/jni/libopus/silk/NLSF_VQ_weights_laroia.c
        src/main/jni/libopus/silk/NLSF_del_dec_quant.c
        src/main/jni/libopus/silk/NLSF_VQ.c
        src/main/jni/libopus/silk/interpolate.c
        src/main/jni/libopus/silk/float/wrappers_FLP.c
        src/main/jni/libopus/silk/A2NLSF.c
        src/main/jni/libopus/silk/float/process_gains_FLP.c
        src/main/jni/libopus/silk/float/find_pred_coefs_FLP.c
        src/main/jni/libopus/silk/float/residual_energy_FLP.c
        src/main/jni/libopus/silk/float/energy_FLP.c
        src/main/jni/libopus/silk/float/LPC_analysis_filter_FLP.c
        src/main/jni/libopus/silk/float/find_LPC_FLP.c
        src/main/jni/libopus/silk/float/burg_modified_FLP.c
        src/main/jni/libopus/silk/float/inner_product_FLP.c
        src/main/jni/libopus/silk/float/scale_copy_vector_FLP.c
        src/main/jni/libopus/silk/float/LTP_analysis_filter_FLP.c
        src/main/jni/libopus/silk/float/LTP_scale_ctrl_FLP.c
        src/main/jni/libopus/silk/float/find_LTP_FLP.c
        src/main/jni/libopus/silk/float/scale_vector_FLP.c
        src/main/jni/libopus/silk/float/regularize_correlations_FLP.c
        src/main/jni/libopus/silk/float/corrMatrix_FLP.c
        src/main/jni/libopus/silk/float/noise_shape_analysis_FLP.c
        src/main/jni/libopus/silk/float/bwexpander_FLP.c
        src/main/jni/libopus/silk/float/LPC_inv_pred_gain_FLP.c
        src/main/jni/libopus/silk/float/autocorrelation_FLP.c
        src/main/jni/libopus/silk/float/warped_autocorrelation_FLP.c
        src/main/jni/libopus/silk/float/apply_sine_window_FLP.c
        src/main/jni/libopus/silk/float/find_pitch_lags_FLP.c
        src/main/jni/libopus/silk/float/pitch_analysis_core_FLP.c
        src/main/jni/libopus/silk/pitch_est_tables.c
        src/main/jni/libopus/silk/float/sort_FLP.c
        src/main/jni/libopus/silk/resampler_down2.c
        src/main/jni/libopus/silk/resampler_down2_3.c
        src/main/jni/libopus/silk/float/k2a_FLP.c
        src/main/jni/libopus/silk/float/schur_FLP.c
        src/main/jni/libopus/silk/LP_variable_cutoff.c
        src/main/jni/libopus/silk/biquad_alt.c
        src/main/jni/libopus/silk/VAD.c
        src/main/jni/libopus/silk/sigm_Q15.c
        src/main/jni/libopus/silk/ana_filt_bank_1.c
        src/main/jni/libopus/silk/control_SNR.c
        src/main/jni/libopus/silk/stereo_encode_pred.c
        src/main/jni/libopus/silk/stereo_LR_to_MS.c
        src/main/jni/libopus/silk/stereo_quant_pred.c
        src/main/jni/libopus/silk/stereo_find_predictor.c
        src/main/jni/libopus/silk/inner_prod_aligned.c
        src/main/jni/libopus/silk/sum_sqr_shift.c
        src/main/jni/libopus/silk/HP_variable_cutoff.c
        src/main/jni/libopus/silk/control_codec.c
        src/main/jni/libopus/silk/tables_NLSF_CB_NB_MB.c
        src/main/jni/libopus/silk/tables_NLSF_CB_WB.c
        src/main/jni/libopus/silk/control_audio_bandwidth.c
        src/main/jni/libopus/silk/init_encoder.c
        src/main/jni/libopus/silk/check_control_input.c
        src/main/jni/libopus/src/analysis.c
        src/main/jni/libopus/src/repacketizer.c
        src/main/jni/libopus/src/opus.c
        src/main/jni/libopus/src/opus_decoder.c
        src/main/jni/libopus/src/opus_projection_encoder.c
        src/main/jni/libopus/src/opus_projection_decoder.c
        src/main/jni/libopus/src/mapping_matrix.c
        src/main/jni/libopus/src/mapping_matrix.h
        src/main/jni/libopus/celt/celt_decoder.c
        src/main/jni/libopus/silk/dec_API.c
        src/main/jni/libopus/silk/stereo_MS_to_LR.c
        src/main/jni/libopus/silk/decode_frame.c
        src/main/jni/libopus/silk/PLC.c
        src/main/jni/libopus/silk/bwexpander.c
        src/main/jni/libopus/silk/CNG.c
        src/main/jni/libopus/silk/decode_core.c
        src/main/jni/libopus/silk/decode_parameters.c
        src/main/jni/libopus/silk/decode_pitch.c
        src/main/jni/libopus/silk/decode_pulses.c
        src/main/jni/libopus/silk/decode_indices.c
        src/main/jni/libopus/silk/stereo_decode_pred.c
        src/main/jni/libopus/silk/decoder_set_fs.c
        src/main/jni/libopus/silk/init_decoder.c
        src/main/jni/libopus/src/mlp.c
        src/main/jni/libopus/src/mlp_data.c
        src/main/jni/libopus/silk/LPC_fit.c
        )


# 查找模块的库文件
find_library(
        log-lib
        log)
find_library(
        android-lib
        android)

# 添加链接库文件路径
# opusutil为需要添加链接库文件路径的库名
# 之后为对应的链接库文件
target_link_libraries(
        opusutil
        ${log-lib}
        ${android-lib}
        )

add_definitions(-DOUTSIDE_SPEEX -DOPUS_BUILD -DSTDC_HEADERS -DVAR_ARRAYS)