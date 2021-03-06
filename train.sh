#!/bin/bash
cd ~/Repos/exjobb/network/

EPOCHS=2
PLOT_FREQ=5000
PRINT_FREQ=10
BATCH_SIZE=16
FOLDER_NAME=test_deluxe/
DATASET=flexible/
CLUSTER_PATH='/home/annaochjacob/Repos/exjobb/preprocessing/path_clustering/'

# Best network when trained with SGD and scheduler, but now trained with Adam to see the difference (using same lr)
#python3 main.py -e $EPOCHS -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_2pf/ -pf 2 -fs 2 -bl -o "Adam( model.parameters(), lr=5*1e-6, weight_decay=1e-5, amsgrad=True)" #--resume ${FOLDER_NAME}CNNBiasAll_2pf/checkpoint.pt

# Do some simple curriculim learning, aka. remove all intentions first.
#python3 main.py --no-intention -e $EPOCHS -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam/ -bl -o "Adam( model.parameters(), lr=5*1e-6, weight_decay=1e-5, amsgrad=True)" #--resume ${FOLDER_NAME}CNNBiasAll_2pf/checkpoint.pt
# After 2 epochs, we continued our journey 5 epochs further into the jungle, this time with intentions.
#python3 main.py -e 7 -b $BATCH_SIZE -pl $PLOT_FREQ -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam/ -bl --resume ${FOLDER_NAME}CNNBiasAll_Adam/checkpoint.pt

# These two trainings are with lidar only and then adding all values
#python3 main.py --no-intention --only-lidar -e $EPOCHS -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar/ -bl -o "Adam( model.parameters(), lr=5*1e-6, weight_decay=1e-5, amsgrad=True)" #--resume ${FOLDER_NAME}CNNBiasAll_2pf/checkpoint.pt
#python3 main.py -e 7 -b $BATCH_SIZE -pl $PLOT_FREQ -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar/ -bl --resume ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar/checkpoint.pt

# Curriculum learning with past frames
#python3 main.py --no-intention --only-lidar -e $EPOCHS -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar_past_frames/ -bl -o "Adam( model.parameters(), lr=1e-4, weight_decay=1e-5, amsgrad=True)" -pf 2 -fs 2 # --resume ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar_past_frames/checkpoint.pt
#python3 main.py --no-intention --only-lidar -e 3 -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar_past_frames/ -bl -pf 2 -fs 2 --resume ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar_past_frames/checkpoint.pt
#python3 main.py -e 7 -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar_past_frames/ -bl -pf 2 -fs 2 --resume ${FOLDER_NAME}CNNBiasAll_Adam_only_lidar_past_frames/checkpoint.pt

#test_deluxe
#python3 main.py -e $EPOCHS -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias_flexible.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_6pf/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20' -bl -o "Adam( model.parameters(), lr=5*1e-6, weight_decay=1e-5, amsgrad=True)" #--resume ${FOLDER_NAME}CNNBiasAll_2pf/checkpoint.pt
#python3 main.py -e $EPOCHS -b $BATCH_SIZE -pl $PLOT_FREQ -a cnn_bias_flexible.CNNBiasAll -p 1 -d $DATASET -s ${FOLDER_NAME}CNNBiasAll_6pf/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=5*1e-6, weight_decay=1e-5, amsgrad=True)" --resume ${FOLDER_NAME}CNNBiasAll_6pf/checkpoint.pt --evaluate

# Try different number of channels NOTE -ipf is missing step 29 due to Jacob being tired. Sorry...
#python3 main.py -e 1 -b 12 -pl $PLOT_FREQ -a more_channels_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_channels_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)"
#python3 main.py -e 1 -b 12 -pl $PLOT_FREQ -a more_channels_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_channels_2/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)"

# Train the regular CNNBiasAll for comparison
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a cnn_bias_flexible.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cnn_bias_all/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

# Try different dilations.
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_dilation_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_dilation_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_dilation_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_dilation_2/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

# Try different kernel size and stride
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_size_stride_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_size_stride_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a gott_och_blandat_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}gott_och_blandat_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

#python3 main_clusters.py -e 4 -b 12 -pl $PLOT_FREQ -a cluster_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420
# Try more layers (this includes different dilations)
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_layers_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_layers_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

# SECOND ATTEMPT AT more_dilation_1 because it seem to have stuck at 1000 iterations last time
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_dilation_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_dilation_1_attempt_2/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420






#-------------------------------------------------------------------------------
# 2018-06-07 Continue training more_layers_1
#python3 main.py -e 8 -b $BATCH_SIZE -pl $PLOT_FREQ -a more_layers_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_layers_1_continued/ -bl -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}more_layers_1/checkpoint.pt


# Train networks with even more layers
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_layers_2/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420
# Continue training for another 7h
#python3 main.py -e 10 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_14h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2/checkpoint.pt
# Evaluate
#python3 main.py -e 10 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_14h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_14h/all_time_best.pt --evaluate
# Continue training mooooooore
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_21h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_14h/checkpoint.pt
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_28h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_21h/checkpoint.pt
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_35h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_28h/checkpoint.pt
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_42h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_35h/checkpoint.pt
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_49h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_42h/checkpoint.pt
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_56h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_49h/checkpoint.pt
#python3 main.py -e 100 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_63h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_56h/checkpoint.pt
# Evaluate
#python3 main.py -e 10 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/more_layers_2_63h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 --resume ${FOLDER_NAME}regression_idea/more_layers_2_63h/all_time_best.pt --evaluate

#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_layers_3.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_layers_3/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

#python3 main.py -e 4 -b 6 -pl $PLOT_FREQ -a more_layers_4.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_layers_4/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420


# Train using ona more maxpooling before the context module. Note that the batch size is set higher for this one to be more fair, since the loading time for each batch doesn't go below ~0.2s even for small batch sizes.
#python3 main.py -e 16 -b 24 -pl $PLOT_FREQ -a more_max_pool_1.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}more_maxpool_1/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

#-------------------------------------------------------------------------------
# Train pc regression networ with 5 pcs
#python3 main_pc_reg.py -e 4 -b 12 -pl $PLOT_FREQ -a pc_reg_1.PCNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}pca_idea/pc_reg_1_fixed_5_pc/ \
#-ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -npc 5 -cpath ${CLUSTER_PATH}20_clusters/
# Train pc regression networ with 10 pcs
#python3 main_pc_reg.py -e 4 -b 12 -pl $PLOT_FREQ -a pc_reg_1.PCNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}pca_idea/pc_reg_1_fixed_10_pc/ \
#-ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -npc 10 -cpath ${CLUSTER_PATH}20_clusters/
# Train pc regression networ with 20 pcs
#python3 main_pc_reg.py -e 10 -b 12 -pl $PLOT_FREQ -a pc_reg_1.PCNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}pca_idea/pc_reg_1_fixed_20_pc_continued/ \
#-ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -npc 20 -cpath ${CLUSTER_PATH}20_clusters/ --resume ${FOLDER_NAME}pca_idea/pc_reg_1_fixed_20_pc/checkpoint.pt

#-------------------------------------------------------------------------------
# Train the cluster + pc_delta network using 7 principal components and 10 clusters
#python3 main_clusters.py -e 4 -b 12 -pl $PLOT_FREQ -a cluster_1.ClusterNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_1_10_cl_7_pc/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -ncl 10 -npc 7 -cpath ${CLUSTER_PATH}10_clusters/
# Train the cluster + pc_delta network using 7 principal components and 20 clusters
#python3 main_clusters.py -e 4 -b 12 -pl $PLOT_FREQ -a cluster_1.ClusterNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_1_20_cl_7_pc/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -ncl 20 -npc 7 -cpath ${CLUSTER_PATH}20_clusters/
# Continue training for another 7h
#python3 main_clusters.py -e 10 -b 12 -pl $PLOT_FREQ -a cluster_1.ClusterNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_idea/cluster_1_20_cl_7_pc_14h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -ncl 20 -npc 7 -cpath ${CLUSTER_PATH}20_clusters/ --resume ${FOLDER_NAME}cluster_idea/cluster_1_20_cl_7_pc/checkpoint.pt
#Evaluate
#python3 main_clusters.py -e 10 -b 12 -pl $PLOT_FREQ -a cluster_1.ClusterNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_idea/cluster_1_20_cl_7_pc_14h/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -ncl 20 -npc 7 -cpath ${CLUSTER_PATH}20_clusters/ --resume ${FOLDER_NAME}cluster_idea/cluster_1_20_cl_7_pc_14h/all_time_best.pt --evaluate
#python3 main_clusters.py -e 4 -b 12 -pl $PLOT_FREQ -a cluster_1.ClusterNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_1_100_cl_7_pc/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -ncl 100 -npc 7 -cpath ${CLUSTER_PATH}100_clusters/

#-------------------------------------------------------------------------------
# Train semseg using decreasing radius: 6,5,4,3
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_6_r/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 180 -res 150 150 -r 6.0
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_6_r/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 120 -res 150 150 -r 5.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_6_r/checkpoint.pt
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_6_r/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 60 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_6_r/checkpoint.pt
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_6_r/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 60 -res 150 150 -r 3.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_6_r/checkpoint.pt # --evaluate

# Train semseg using radius 4
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_4_r/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_4_r/checkpoint.pt --evaluate

# Train semseg using decreasing radius: 10,8,6,4
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 180 -res 150 150 -r 10.0
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 120 -res 150 150 -r 8.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/checkpoint.pt
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 60 -res 150 150 -r 6.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/checkpoint.pt
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 60 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/checkpoint.pt
# --- Eval:
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/all_time_best.pt --evaluate
# Continue training the best model for another 7 hours
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new_14/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r_new/checkpoint.pt
# Eval model trained 14 hours
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_new_14/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r_new_14/all_time_best.pt --evaluate


# Continue training the semseg_6_s_10_r
#python3 main_semseg.py -e 10 -b 12 -pl $PLOT_FREQ -a semseg.Network -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}semseg/semseg_6_s_10_r_continued/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '5 10 15 20 25 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 300 -res 150 150 -r 4.0 --resume ${FOLDER_NAME}semseg/semseg_6_s_10_r/checkpoint.pt

# Train a pure regression CNNBiasAll with
#python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a cnn_bias_flexible.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}regression_idea/CNNBiasAll_1pf/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -pf 1 -t 420

# Train pc_reg_1_pc_5 7 more hours
#python3 main_pc_reg.py -e 10 -b 12 -pl $PLOT_FREQ -a pc_reg_1.PCNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}pca_idea/pc_reg_1_fixed_5_pc_continued/ \
#-ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' \
#-off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -npc 5 -cpath ${CLUSTER_PATH}20_clusters/ --resume ${FOLDER_NAME}pca_idea/pc_reg_1_fixed_5_pc/checkpoint.pt

# Train cluster network with 100 cl another 7 hours
#python3 main_clusters.py -e 4 -b 12 -pl $PLOT_FREQ -a cluster_1.ClusterNet -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}cluster_idea/cluster_1_100_cl_7_pc_continued/ \
#-ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' \
#-off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420 -ncl 100 -npc 7 -cpath ${CLUSTER_PATH}100_clusters/ --resume ${FOLDER_NAME}cluster_idea/cluster_1_100_cl_7_pc/checkpoint.pt

python3 main.py -e 4 -b 12 -pl $PLOT_FREQ -a more_layers_2.CNNBiasAll -p $PRINT_FREQ -d $DATASET -s ${FOLDER_NAME}remove_me/ -ipf '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -off '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30' -bl -o "Adam( model.parameters(), lr=1e-5, weight_decay=1e-5, amsgrad=True)" -t 420

echo "Train script completed."
