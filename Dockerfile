# FROM python:3.11

# # making app folder
# WORKDIR /app

# # copying files
# COPY . .

# # installing requirements
# RUN apt-get update 
# RUN apt-get install ffmpeg -y
# RUN pip install --upgrade pip 
# RUN pip install -r ./requirements.txt 

# # launching gradio app 
# ENV GRADIO_SERVER_NAME="0.0.0.0"
# EXPOSE 7860
# ENTRYPOINT python ./run.py

FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu22.04
RUN apt-get update && \
         apt-get install -y \
           ffmpeg git pip python3 python-is-python3
RUN git clone https://github.com/C0untFloyd/roop-unleashed
WORKDIR /roop-unleashed
RUN pip install -r requirements.txt && \
         pip uninstall -y onnxruntime-gpu && \
         pip install onnxruntime-gpu==1.15.1
ENV GRADIO_SERVER_NAME="0.0.0.0"
EXPOSE 7860
ENTRYPOINT ["python", "run.py"]"
