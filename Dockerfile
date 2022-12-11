FROM ros:humble
SHELL ["/bin/bash", "-c"]

RUN git clone https://github.com/barinalex/ros2pkgs.git
RUN source /opt/ros/humble/setup.bash && \
    cd ros2pkgs && \
    apt-get update --fix-missing && \
    rosdep install -i --from-path src --rosdistro humble -y && \
    colcon build
ENTRYPOINT ["/bin/bash"]
