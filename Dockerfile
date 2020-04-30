FROM fedora:30
LABEL maintainer="karim.dridi@gmail.com"

RUN yum upgrade -y && \
    yum install -y wget gcc make zlib-devel openssl-devel bzip2-devel sqlite-devel

WORKDIR /masterclass/downloads
RUN wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz

RUN tar -xzf Python-3.6.9.tgz && \
    cd Python-3.6.9 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    cd .. && \
    rm -rf Python-3.6.9

RUN /usr/local/bin/python3.6 -m venv --prompt "Masterclass: NLP" /masterclass/NLP && \
    source /masterclass/NLP/bin/activate && \
    python --version

RUN source /masterclass/NLP/bin/activate && \
    pip install --upgrade pip && \
    pip install wheel==0.34.2 && \
    pip install jupyterlab

RUN source /masterclass/NLP/bin/activate && \
    pip install cssselect && \
    pip install lxml && \
    pip install wikipedia && \
    pip install scrapy && \
    pip install selenium && \
    pip install bs4

RUN source /masterclass/NLP/bin/activate && \
    pip install smart-open==1.10.0 && \
    pip install lxml && \
    pip install gensim && \
    pip install pandas && \
    pip install nltk && \
    pip install sklearn

RUN source /masterclass/NLP/bin/activate && \
    pip install tensorflow==1.5.0

RUN yum upgrade -y && \
    yum install -y mysql-devel

RUN source /masterclass/NLP/bin/activate && \
    pip install pattern==3.6.0

EXPOSE 8888
VOLUME /notebooks
WORKDIR /notebooks

CMD ["/masterclass/NLP/bin/jupyter", "notebook", "--allow-root", "--ip=0.0.0.0", "--port=8888"]