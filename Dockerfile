FROM texlive/texlive:latest AS builder

WORKDIR /workspace
COPY . .

RUN mkdir -p out && \
    cd cv && \
    pdflatex -output-directory=../out -interaction=nonstopmode main.tex && \
    pdflatex -output-directory=../out -interaction=nonstopmode main.tex

FROM scratch AS export
COPY --from=builder /workspace/out/main.pdf /main.pdf
