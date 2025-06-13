## 文档说明

### 消息定义
- **消息名称**: `CustomMessage`
- **字段**:
  - `float32 data`: 浮点数示例（如传感器数据）
  - `string text`: 字符串示例（如状态信息）

### 通信流程
1. **话题名称**: `custom_topic`
2. **C++发布器** 发送消息，**Python订阅器** 接收并打印。

### 常见问题
- **错误：消息未找到**
  确保工作空间已编译并通过 `source devel/setup.bash` 加载环境。
- **Python导入错误**
  检查 `scripts/python_subscriber.py` 是否具有可执行权限，确认功能包路径在 `PYTHONPATH` 中。
- **消息字段不匹配**
  修改 `.msg` 文件后需重新编译功能包。

---

## 测试验证
1. 在三个终端中分别运行：
   - `roscore`
   - `rosrun custom_pkg cpp_publisher`
   - `rosrun custom_pkg python_subscriber.py`
2. 观察终端输出是否显示正确数据。