mkdir -p "${3}"

cd "${3}"

go mod init "github.com/alexis-moins/${2}"

git init

cobra-cli init "${2}"
