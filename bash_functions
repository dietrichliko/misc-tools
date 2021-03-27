# to be sourced by .bashrc

# Activate environment variables and virtual environment

dotenv () {
    if [ -e ./.env ]; then
      set +a
      . ./.env
      set -a
    fi
    [[ -e ./.venv/bin/activate ]] && . ./.venv/bin/activate
}

# pretty print for path variables

path() { 
    echo "PATH="
    echo -e " - ${PATH//:/\n - }"
}

pypath() {
    echo "PYTHONPATH="
    [[ ! -z "$PYTHONPATH" ]] && echo -e " - ${PYTHONPATH//:/\n - }"
}

ldpath() {
    echo "LD_LBRARY_PATH="
    [[ ! -z "$LD_LBRARY_PATH" ]] && echo -e " - ${LD_LIBRARY_PATH//:/\n -} "
}

# LCG SW Stack http://lcginfo.cern.ch/

lcg_setup() {
    local vers=${1:-'LCG_99'}
    local arch=${2:-'x86_64-centos7-gcc10-opt'}
    echo "Setting up $vers $arch ..." >&2
    source /cvmfs/sft.cern.ch/lcg/views/setupViews.sh $vers $arch
}

# https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideCrab

setup_crab() {
    echo "Setting up CRAB ..." >&2
    source /cvmfs/cms.cern.ch/common/crab-setup.sh
}

# ganga https://github.com/ganga-devs/ganga

ganga() {
    /cvmfs/ganga.cern.ch/Ganga/install/LATEST/bin/ganga "$@"
}

# https://anaconda.org/

conda() {
    echo "Setting up conda ..." >&2
    eval "$('/software/2020/software/anaconda3/2019.10/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    conda "$@"
}