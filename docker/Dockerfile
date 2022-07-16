FROM pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel

# 一般ユーザ名を設定
ENV USER_NAME=duser

# apt-get
ENV DEBIAN_FRONTEND noninteractive
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update -qq
RUN apt-get install sudo
RUN apt-get install -y \
 			curl libopencv-dev lsof git sudo tar tmux tree vim wget && \
 		apt-get clean && \
 		rm -rf /var/lib/apt/lists/* && \
 		rm -rf /var/cache/apk/*

# python
ENV WORK_PATH /workspace
WORKDIR $WORK_PATH
ENV PYTHONPATH "/workspace:${PYTHONPATH}"
ENV PIP_OPTIONS "--no-cache-dir --progress-bar off"
COPY docker/requirements.txt $WORK_PATH/docker/
RUN pip install ${PIP_OPTIONS} -r $WORK_PATH/docker/requirements.txt && \
    pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 -f https://download.pytorch.org/whl/torch_stable.html && \
		pip install ${PIP_OPTIONS} -U setuptools==59.5.0 

# USER duser
# sudoを使用できるようにする
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# 一般ユーザがユーザ/グループを追加できるようにする
# entrypoint.sh内でパーミッションを元に戻す
RUN chmod u+s /usr/sbin/useradd \
    && chmod u+s /usr/sbin/groupadd

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
