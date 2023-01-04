import rclpy
from rclpy.node import Node

from sensor_msgs.msg import Image


class ImageSubscriber(Node):

    def __init__(self):
        super().__init__('image_subscriber')
        self.subscription = self.create_subscription(Image, 'image', self.callback, 10)

    def callback(self, msg):
        self.get_logger().info(f"Received image. encoding: {msg.encoding}")
        self.get_logger().info(f"Height: {msg.height}; Width: {msg.width}")


def main(args=None):
    rclpy.init(args=args)
    image_subscriber = ImageSubscriber()
    rclpy.spin(image_subscriber)
    image_subscriber.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()