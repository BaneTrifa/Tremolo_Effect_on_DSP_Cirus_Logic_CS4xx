import os
import subprocess
import itertools
import shutil

# input_streams_root == "/path/to/script/Teststreams"
input_streams_root = os.path.join(os.path.dirname(__file__), "TestStreams")
# base name of project
target = "tremolo"
# executables_root = "/path/to/script/Debug"
executables_root = os.path.join(os.path.dirname(__file__), "bin")
# compare_tool = "/path/to/script/Tools/PCMCompare.exe"
compare_tool = os.path.join(os.path.dirname(__file__), "Tools", "PCMCompare.exe")

# name of models for testing == ["model0", "model1", "model2"]
num_of_models = 2
models = [f'model{x}' for x in range(num_of_models)]


# *************************************************************************
# This tool expects the executables provited to be of the following format:
#   executables = [ f'{target}_{m}' for m in models ]
#   i.e. multitapEcho_model0
# *************************************************************************


# returns list of paths to input streams
def get_inputs():
    # Get all .wav files from input_streams_root
    # inputs = []
    # for root, dirs, files in os.walk(input_streams_root):
    #     for file in files:
    #         if file.endswith(".wav"):
    #             inputs.append(os.path.join(root, file))

    # inputs == ["/path/to/input_streams/funky_sample.wav", "/path/to/input_streams/WhiteNoise.wav"]
    inputs = [os.path.join(input_streams_root, x) for x in ['Amp_Sweep.wav', 'WhiteNoise.wav', 'Multi_Tone.wav']]

    return inputs


# returns list of lists of desired params
def get_params():

    params = [
        [0, 1],					            # enable
        [0, 1, 2, 3],                       # output mode
        ["0.999", "0", "0.501187"],	        # input gain
        ["0.999", "0", "0.707946"]          # headroom gain
    ]

    return params


################################################################################
### DO NOT EDIT BELOW THIS LINE
################################################################################

# test_outputs = "/path/to/script/test_outputs"
test_outputs = os.path.join(os.path.dirname(__file__), "test_outputs")

# logs = "/path/to/script/logs"
logs = os.path.join(os.path.dirname(__file__), "logs")

# invalid_logs = "/path/to/script/invalid_logs"
invalid_logs = os.path.join(os.path.dirname(__file__), "invalid_logs")

def get_cases():
    cases = []
    params = get_params()
    combinations = list(itertools.product(*params))
    # for args in combinations:
    #     for i in get_inputs():
    #         case = (i, args)
    #         cases.append(case)

    cases = list(itertools.product(get_inputs(), combinations))

    return cases


def run_compare(in_file, out_file, log_file):
    cmd = f'"{compare_tool}" -b24 "{in_file}" "{out_file}"'
    print(cmd)
    log_file.write(cmd + "\n")

    proc_data = subprocess.run(cmd, capture_output=True, shell=True)

    log_file.write(proc_data.stderr.decode() + "\n")
    log_file.write(proc_data.stdout.decode() + "\n")


def execute_cmd(cmd):
    proc_data = subprocess.run(cmd, capture_output=True, shell=True)

    if proc_data.stdout:
        print(proc_data.stdout.decode())

    if proc_data.stderr:
        print(proc_data.stderr.decode())


def execute_test(exe, in_file, out_file, add_args):
    add_params = " ".join(str(arg) for arg in add_args)

    cmd = f'"{exe}" "{in_file}" "{out_file}" {add_params}'
    print(cmd)
    execute_cmd(cmd)


def run_test(case):
    in_fname, _ = os.path.splitext(os.path.basename(case[0]))

    test_name = in_fname
    for param in case[1]:
        test_name = f'{test_name}_{param}'

    test_dir = os.path.join(test_outputs, test_name)
    os.makedirs(test_dir, exist_ok=True)
    os.makedirs(logs, exist_ok=True)

    out_files = []
    for m in models:
        exe = os.path.join(executables_root, f'{target}_{m}.exe')
        out_file = os.path.join(test_dir, f'out_{test_name}_{m}.wav')
        out_files.append(out_file)
        execute_test(exe, case[0], out_file, case[1])

    if models.__len__() > 1:
        with open(os.path.join(logs, f'compare_log_{test_name}.txt'), 'w') as log_file:
            run_compare(out_files[0], out_files[1], log_file)

            if models.__len__() > 2:
                run_compare(out_files[1], out_files[2], log_file)


def run_tests(cases):
    for case in cases:
        run_test(case)


def extract_differences():
    os.makedirs(invalid_logs, exist_ok=True)

    for file_path in os.listdir(logs):
        src = os.path.join(logs, file_path)
        dst = os.path.join(invalid_logs, file_path)

        values = []
        with open(src, 'r') as file:
            for line in file:
                values.append(line.strip())     # trim line and add to append values list

            positions = [1, 4, 8, 11] if num_of_models == 3 else [1, 4]
            for pos in positions:
                if values[pos] != 'No differences encountered!':
                    shutil.copy(src, dst)


if __name__ == "__main__":
    shutil.rmtree(test_outputs, ignore_errors=True)
    shutil.rmtree(logs, ignore_errors=True)
    shutil.rmtree(invalid_logs, ignore_errors=True)
    
    cases = get_cases()
    
    # print(cases)
    
    run_tests(cases)

    extract_differences()

















