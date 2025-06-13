import socket
import threading

clients = {}  # 存储用户名与对应的客户端套接字
pairs = {}    # 存储用户间的配对关系
waiting_queue = []  # 等待配对的用户队列

def handle_client(client_socket):
    username = None
    try:
        # 接收客户端发送的用户名
        username = client_socket.recv(1024).decode('utf-8')
        if username in clients:
            client_socket.send("Username is already taken. Please restart.".encode('utf-8'))
            client_socket.close()
            return
        clients[username] = client_socket
        print(f"{username} 已连接")

        # 将用户加入等待队列并进行配对
        waiting_queue.append(username)
        if len(waiting_queue) >= 2:
            user1 = waiting_queue.pop(0)
            user2 = waiting_queue.pop(0)
            pairs[user1] = user2
            pairs[user2] = user1
            # 通知双方配对成功
            clients[user1].send(f"已与 {user2} 配对，可以开始聊天。".encode('utf-8'))
            clients[user2].send(f"已与 {user1} 配对，可以开始聊天。".encode('utf-8'))

        # 循环接收消息并转发
        while True:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            if username in pairs:
                partner = pairs[username]
                if partner in clients:
                    clients[partner].send(f"[{username}] {message}".encode('utf-8'))
                else:
                    client_socket.send("错误：配对用户已断开连接。".encode('utf-8'))
            else:
                client_socket.send("等待配对中，请稍候...".encode('utf-8'))
    except Exception as e:
        print(f"发生错误：{e}")
    finally:
        # 清理资源
        if username:
            if username in clients:
                del clients[username]
            if username in pairs:
                partner = pairs[username]
                del pairs[partner]
                del pairs[username]
                if partner in clients:
                    clients[partner].send("配对已断开。".encode('utf-8'))
            if username in waiting_queue:
                waiting_queue.remove(username)
            client_socket.close()
            print(f"{username} 已断开连接")

def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(('0.0.0.0', 5555))
    server.listen(5)
    print("服务器已启动，等待客户端连接...")
    while True:
        client_socket, addr = server.accept()
        print(f"接收到来自 {addr} 的新连接")
        client_thread = threading.Thread(target=handle_client, args=(client_socket,))
        client_thread.start()

if __name__ == "__main__":
    main()
