LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
#我使用的是NDK 18
#NDK 17及以上不再支持ABIs [mips64, armeabi, mips]
APP_ABI := armeabi-v7a arm64-v8a x86 x86_64
APP_CPPFLAGS += -std=c++11
APP_STL := gnustl_shared
APP_PLATFORM := android-16

LOCAL_MODULE        := opusutil

#链接的资源文件
LOCAL_SRC_FILES     := \
    opus_util.c \
    libopus/celt/bands.c \
    libopus/celt/celt.c \
    libopus/celt/celt_encoder.c \
    libopus/celt/celt_decoder.c \
    libopus/celt/cwrs.c \
    libopus/celt/entcode.c \
    libopus/celt/entdec.c \
    libopus/celt/entenc.c \
    libopus/celt/kiss_fft.c \
    libopus/celt/laplace.c \
    libopus/celt/mathops.c \
    libopus/celt/mdct.c \
    libopus/celt/modes.c \
    libopus/celt/pitch.c \
    libopus/celt/celt_lpc.c \
    libopus/celt/quant_bands.c \
    libopus/celt/rate.c \
    libopus/celt/vq.c \
    libopus/celt/arm/armcpu.c \
    libopus/celt/arm/arm_celt_map.c \
    libopus/silk/CNG.c \
    libopus/silk/code_signs.c \
    libopus/silk/init_decoder.c \
    libopus/silk/decode_core.c \
    libopus/silk/decode_frame.c \
    libopus/silk/decode_parameters.c \
    libopus/silk/decode_indices.c \
    libopus/silk/decode_pulses.c \
    libopus/silk/decoder_set_fs.c \
    libopus/silk/dec_API.c \
    libopus/silk/enc_API.c \
    libopus/silk/encode_indices.c \
    libopus/silk/encode_pulses.c \
    libopus/silk/gain_quant.c \
    libopus/silk/interpolate.c \
    libopus/silk/LP_variable_cutoff.c \
    libopus/silk/NLSF_decode.c \
    libopus/silk/NSQ.c \
    libopus/silk/NSQ_del_dec.c \
    libopus/silk/PLC.c \
    libopus/silk/shell_coder.c \
    libopus/silk/tables_gain.c \
    libopus/silk/tables_LTP.c \
    libopus/silk/tables_NLSF_CB_NB_MB.c \
    libopus/silk/tables_NLSF_CB_WB.c \
    libopus/silk/tables_other.c \
    libopus/silk/tables_pitch_lag.c \
    libopus/silk/tables_pulses_per_block.c \
    libopus/silk/VAD.c \
    libopus/silk/control_audio_bandwidth.c \
    libopus/silk/quant_LTP_gains.c \
    libopus/silk/VQ_WMat_EC.c \
    libopus/silk/HP_variable_cutoff.c \
    libopus/silk/NLSF_encode.c \
    libopus/silk/NLSF_VQ.c \
    libopus/silk/NLSF_unpack.c \
    libopus/silk/NLSF_del_dec_quant.c \
    libopus/silk/process_NLSFs.c \
    libopus/silk/stereo_LR_to_MS.c \
    libopus/silk/stereo_MS_to_LR.c \
    libopus/silk/check_control_input.c \
    libopus/silk/control_SNR.c \
    libopus/silk/init_encoder.c \
    libopus/silk/control_codec.c \
    libopus/silk/A2NLSF.c \
    libopus/silk/ana_filt_bank_1.c \
    libopus/silk/biquad_alt.c \
    libopus/silk/bwexpander_32.c \
    libopus/silk/bwexpander.c \
    libopus/silk/debug.c \
    libopus/silk/decode_pitch.c \
    libopus/silk/inner_prod_aligned.c \
    libopus/silk/lin2log.c \
    libopus/silk/log2lin.c \
    libopus/silk/LPC_analysis_filter.c \
    libopus/silk/LPC_inv_pred_gain.c \
    libopus/silk/table_LSF_cos.c \
    libopus/silk/NLSF2A.c \
    libopus/silk/NLSF_stabilize.c \
    libopus/silk/NLSF_VQ_weights_laroia.c \
    libopus/silk/pitch_est_tables.c \
    libopus/silk/resampler.c \
    libopus/silk/resampler_down2_3.c \
    libopus/silk/resampler_down2.c \
    libopus/silk/resampler_private_AR2.c \
    libopus/silk/resampler_private_down_FIR.c \
    libopus/silk/resampler_private_IIR_FIR.c \
    libopus/silk/resampler_private_up2_HQ.c \
    libopus/silk/resampler_rom.c \
    libopus/silk/sigm_Q15.c \
    libopus/silk/sort.c \
    libopus/silk/sum_sqr_shift.c \
    libopus/silk/stereo_decode_pred.c \
    libopus/silk/stereo_encode_pred.c \
    libopus/silk/stereo_find_predictor.c \
    libopus/silk/stereo_quant_pred.c \
    libopus/silk/LPC_fit.c \
    libopus/silk/fixed/LTP_analysis_filter_FIX.c \
    libopus/silk/fixed/LTP_scale_ctrl_FIX.c \
    libopus/silk/fixed/corrMatrix_FIX.c \
    libopus/silk/fixed/encode_frame_FIX.c \
    libopus/silk/fixed/find_LPC_FIX.c \
    libopus/silk/fixed/find_LTP_FIX.c \
    libopus/silk/fixed/find_pitch_lags_FIX.c \
    libopus/silk/fixed/find_pred_coefs_FIX.c \
    libopus/silk/fixed/noise_shape_analysis_FIX.c \
    libopus/silk/fixed/process_gains_FIX.c \
    libopus/silk/fixed/regularize_correlations_FIX.c \
    libopus/silk/fixed/residual_energy16_FIX.c \
    libopus/silk/fixed/residual_energy_FIX.c \
    libopus/silk/fixed/warped_autocorrelation_FIX.c \
    libopus/silk/fixed/apply_sine_window_FIX.c \
    libopus/silk/fixed/autocorr_FIX.c \
    libopus/silk/fixed/burg_modified_FIX.c \
    libopus/silk/fixed/k2a_FIX.c \
    libopus/silk/fixed/k2a_Q16_FIX.c \
    libopus/silk/fixed/pitch_analysis_core_FIX.c \
    libopus/silk/fixed/vector_ops_FIX.c \
    libopus/silk/fixed/schur64_FIX.c \
    libopus/silk/fixed/schur_FIX.c \
    libopus/src/opus.c \
    libopus/src/opus_decoder.c \
    libopus/src/opus_encoder.c \
    libopus/src/opus_multistream.c \
    libopus/src/opus_multistream_encoder.c \
    libopus/src/opus_multistream_decoder.c \
    libopus/src/repacketizer.c \
    libopus/src/opus_projection_encoder.c \
    libopus/src/opus_projection_decoder.c \
    libopus/src/mapping_matrix.c \
    libopus/src/analysis.c \
    libopus/src/mlp.c \
    libopus/src/mlp_data.c \

LOCAL_LDLIBS        := -lm -llog

#C头文件引用路径
LOCAL_C_INCLUDES    := \
    libopus/include \
    libopus/silk \
    libopus/silk/float \
    libopus/silk/fixed \
    libopus/celt
LOCAL_CFLAGS        := -DNULL=0 -DSOCKLEN_T=socklen_t -DLOCALE_NOT_USED -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS        += -Drestrict='' -D__EMX__ -DOPUS_BUILD -DFIXED_POINT -DUSE_ALLOCA -DHAVE_LRINT -DHAVE_LRINTF -O3 -fno-math-errno
LOCAL_CPPFLAGS      := -DBSD=1
LOCAL_CPPFLAGS      += -ffast-math -O3 -funroll-loops

include $(BUILD_SHARED_LIBRARY)