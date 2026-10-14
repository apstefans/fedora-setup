#!/usr/bin/env bash
set -euo pipefail

echo "Installing LaTeX and PDF tools..."

sudo dnf install -y \
    latexmk \
    texlive-scheme-basic \
    texlive-collection-latexrecommended \
    texlive-collection-latexextra \
    texlive-collection-mathscience \
    texlive-circuitikz \
    texlive-siunitx \
    texlive-texcount \
    zathura \
    zathura-pdf-poppler

echo "LaTeX installation complete."
