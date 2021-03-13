FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes
ENV PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    make \
    wget \
    libfontconfig1-dev \
    libfreetype6-dev \
    ghostscript \
    build-essential \
    git \
    git-lfs && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# For latexindent
RUN apt-get update && \
    apt-get install -y --no-install-recommends perl && \
    curl -L http://cpanmin.us | perl - App::cpanminus && \
    cpanm YAML::Tiny && \
    cpanm File::HomeDir && \
    cpanm Unicode::GCString && \
    cpanm Log::Log4perl && \
    cpanm Log::Dispatch && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /tmp/install-tl-unx && \
    wget -O - ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz \
    | tar -xzv -C /tmp/install-tl-unx --strip-components=1 && \
    /bin/echo -e 'selected_scheme scheme-basic\ntlpdbopt_install_docfiles 0\ntlpdbopt_install_srcfiles 0' \
    > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl \
    --profile /tmp/install-tl-unx/texlive.profile && \
    rm -r /tmp/install-tl-unx

RUN tlmgr update --self && \
    tlmgr install \
    collection-bibtexextra \
    collection-fontsextra \
    collection-fontsrecommended \
    collection-langenglish \
    collection-langjapanese \
    collection-latexextra \
    collection-latexrecommended \
    collection-mathscience \
    latexindent \
    latexmk \
    texcount

WORKDIR /workdir
