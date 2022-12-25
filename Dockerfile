FROM ros:humble
SHELL ["/bin/bash", "-c"]

RUN git clone https://github.com/barinalex/ros2pkgs.git
RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install python3-pip
RUN apt-get -y install ffmpeg libsm6 libxext6 libgl1
RUN pip3 install opencv-python
RUN source /opt/ros/humble/setup.bash && \
    cd ros2pkgs && \
    apt-get update --fix-missing && \
    rosdep install -i --from-path src --rosdistro humble -y && \
    colcon build
ENTRYPOINT ["/bin/bash"]
