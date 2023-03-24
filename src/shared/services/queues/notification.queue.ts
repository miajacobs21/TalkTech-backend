
import { INotificationJobData } from '@root/features/notificiations/interfaces/notification.interface';
import { BaseQueue } from '@root/shared/services/queues/base.queue';
import { notificationWorker } from '@root/shared/workers/notification.worker';

class NotificationQueue extends BaseQueue {
  socketIONotificationObject(socketIONotificationObject: any, arg1: string) {
    throw new Error('Method not implemented.');
  }
  constructor() {
    super('notifications');
    this.processJob('updateNotification', 5, notificationWorker.updateNotification);
    this.processJob('deleteNotification', 5, notificationWorker.deleteNotification);
  }

  public addNotificationJob(name: string, data: INotificationJobData): void {
    this.addJob(name, data);
  }
}

export const notificationQueue: NotificationQueue = new NotificationQueue();
