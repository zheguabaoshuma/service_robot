import socket
import threading

def receive_messages(sock):
    while True:
        try:
            message = sock.recv(1024).decode('utf-8')
            print(message)
        except:
            break

def main():
    username = input("请输入用户名：")
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(('localhost', 5555))
    sock.send(username.encode('utf-8'))

    # 启动接收消息的线程
    threading.Thread(target=receive_messages, args=(sock,), daemon=True).start()

    # 发送消息
    while True:
        message = input()
        sock.send(message.encode('utf-8'))

if __name__ == "__main__":
    main()
