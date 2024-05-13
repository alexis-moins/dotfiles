# Information about the project are passed as arguments in the following way:
#
# $1 - Name of the space the project must be created in.
#
# $2 - name of the project. Once this script ends, the directory
#      ${HOME}/${PM_HOME}/${1}/${2} should have been created.
#
# $3 - absolute path to the project. It corresponds to the following
#      pattern evaluated: ${HOME}/${PM_HOME}/${1}/${2}.

mkdir -p "${3}"

cd "${3}"

go mod init "github.com/alexis-moins/${2}"

git init

cobra-cli init "${2}"
