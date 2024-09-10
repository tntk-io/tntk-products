from root.rabbitmq import RabbitMQClient
from root.config import settings

def get_order_rabbitmq_client():
    return RabbitMQClient(host=settings.RABBITMQ_HOST, queue='order_queue')


def get_inventory_rabbitmq_client():
    return RabbitMQClient(host=settings.RABBITMQ_HOST, queue='books_queue')
