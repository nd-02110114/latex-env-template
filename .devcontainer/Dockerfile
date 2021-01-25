FROM paperist/alpine-texlive-ja:latest

# latexindent関連のインストール
RUN apk --no-cache add \
    git \
    miniperl \
    perl-utils \
    perl-log-log4perl \
    perl-log-dispatch \
    perl-namespace-autoclean \
    perl-specio \
    perl-unicode-linebreak \
    curl \
    wget \
    make && \
    cd /usr/local/bin && \
    curl -L https://cpanmin.us/ -o cpanm && \
    chmod +x cpanm && \
    cpanm -n App::cpanminus && \
    cpanm -n File::HomeDir && \
    cpanm -n Params::ValidationCompiler && \
    cpanm -n YAML::Tiny && \
    cpanm -n Unicode::GCString

# デフォルトの海外のサーバーは、ダウンロードに時間がかかるため、国内のCTANのミラーサーバーにリンクを張り替える
# ベースイメージは、collection-latexextra, collection-fontsrecommended, collection-langjapanese を含む
ENV CTAN_REPO http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/
RUN tlmgr update --repository=${CTAN_REPO} --self && \
    tlmgr --repository=${CTAN_REPO} install \
        collection-bibtexextra \
        collection-langenglish \
        collection-fontsextra \
        collection-latexrecommended \
        collection-mathscience \
        latexindent \
        texcount \
        detex
