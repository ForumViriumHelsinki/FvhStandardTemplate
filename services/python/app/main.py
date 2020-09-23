import time


def say_hello():
    for i in range(5):
        print(f'Hello {i} times!')
        time.sleep(1)


if __name__ == '__main__':
    say_hello()
