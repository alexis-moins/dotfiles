# Author: Alexis Moins
# Creation: 03 feb 2022

# Get the current python virtual env
python-venv() {
    # If we are in a virtal environment
    if [ -n "${VIRTUAL_ENV}" ]; then
        # Fetch the python version
        python_version="$(python --version)"

        # Create the prompt
        venv_prompt="%F{8} using 📦 ${python_version}%f "

        # Print the value of ${venv_prompt} to standard out.
        printf "%s" "${venv_prompt}"
    fi
}

