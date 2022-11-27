import sys
import subprocess
import random
import math

random.seed(1337)

for _ in range(500):
    input_ = random.randint(-50000, 50000)/1000
    if input_ == 0:
    	continue
    result1 = subprocess.run(
        [sys.argv[1]], capture_output=True, text=True, input=str(input_)
    )
    result2 = (math.exp(input_) + math.exp(-input_)) / (math.exp(input_) - math.exp(-input_))
    if (abs(float(result1.stdout) - result2) > abs(result2/1000)):
        print("ERROR: OUTPUT DOES NOT MATCH")
        print("input:", input_)
        print("output:", result1.stdout)
        print("correct:", result2)
        print("difference:", abs(float(result1.stdout) - abs(result2)))
        exit()
print("ALL TESTS PASSED, RESULTS WITHIN ACCEPTABLE MARGIN")
