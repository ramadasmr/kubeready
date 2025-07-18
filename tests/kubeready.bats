setup() {
  DIR="$(dirname $( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd ))"
  PATH="$PATH:$DIR"
}

@test "[TEST] can run the script" {
    run kubeready
}

@test "[TEST] prints help message with -h" {
    run kubeready -h
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
}

@test "[TEST] fails with invalid arg" {
    run kubeready --invalid
    [ "$status" -ne 0 ]
    [[ "$output" == *"Invalid option:"* ]]
}
