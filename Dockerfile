FROM fedora:30
LABEL maintainer="karim.dridi@gmail.com"

WORKDIR /app

RUN yum upgrade -y && \
    yum install -y wget gcc g++ make zlib-devel openssl-devel bzip2-devel sqlite-devel mysql-devel && \
    wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz && \
    tar -xzf Python-3.6.9.tgz && \
    cd Python-3.6.9 && \
    ./configure --enable-optimizations && \
    make -j8 altinstall && \
    cd .. && \
    rm -rf Python-3.6.9 Python-3.6.9.tgz && \
    /usr/local/bin/python3.6 -m venv --prompt "Masterclass: NLP" /app && \
    source /app/bin/activate && \
    pip install --upgrade pip && \
    pip install wheel==0.34.2 && \
    pip install jupyterlab && \
    pip install cssselect && \
    pip install lxml && \
    pip install wikipedia && \
    pip install scrapy && \
    pip install selenium && \
    pip install bs4 && \
    pip install smart-open==1.10.0 && \
    pip install lxml && \
    pip install gensim && \
    pip install pandas && \
    pip install nltk && \
    pip install sklearn && \
    pip install tensorflow==1.5.0 && \
    pip install pattern==3.6.0 && \
    pip install pyemd

RUN source /app/bin/activate && \
    pip install progressbar2

EXPOSE 8888
VOLUME /notebooks

WORKDIR /notebooks

CMD ["/app/bin/jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888"]