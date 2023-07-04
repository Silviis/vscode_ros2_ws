FROM osrf/ros:humble-desktop-full
ENV USERNAME ros

# Set your ZSH theme here
ARG ZSH_THEME=agnoster

# Add new user as a sudoer.
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME

RUN apt update -y && apt install nano net-tools zsh git curl openssh-server -y
RUN runuser -l $USERNAME -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'

# ZSH
RUN sed -i "s!robbyrussell!${ZSH_THEME}!g" /home/$USERNAME/.zshrc  # Replace default theme
RUN echo "source /opt/ros/humble/setup.zsh" >> /home/$USERNAME/.zshrc  # Source ROS installation
RUN echo "FILE=/workspaces/vscode_ros2_ws/install/setup.zsh && test -f \$FILE && source \$FILE" >> /home/$USERNAME/.zshrc  # Source ROS workspace
RUN echo "export NO_AT_BRIDGE=1" >> /home/$USERNAME/.zshrc  
RUN echo "# argcomplete for ros2 & colcon " >> /home/$USERNAME/.zshrc  
RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> /home/$USERNAME/.zshrc  
RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> /home/$USERNAME/.zshrc  
RUN echo "cd /workspaces/vscode_ros2_ws" >> /home/$USERNAME/.zshrc  # Change default directory to home directory
RUN echo "alias ws='cd /workspaces/vscode_ros2_ws'" >> /home/$USERNAME/.zshrc
RUN chsh -s /bin/zsh $USERNAME

