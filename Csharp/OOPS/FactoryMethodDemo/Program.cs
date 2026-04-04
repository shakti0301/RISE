using System;
using System.ComponentModel.DataAnnotations;

namespace FactoryMethodDemo
{
    interface INotification
    {
        void send();
    }
    
    class EmailNotification : INotification
    {
        public void send()
        {
            Console.WriteLine("Email Notification sent successfully");
        }
    }

    class SmsNotification : INotification
    {
        public void send()
        {
            Console.WriteLine("SMS Notification sent successfully");
        }
    }
    class PhNotification : INotification
    {
        public void send()
        {
            Console.WriteLine("Phone Notification sent");
        }
    }

    class NotificationFactory
    {
        public static INotification CreateNotification(String type)
        {
            if(type == "email")
                return new EmailNotification();
            else if (type == "sms")
                return new SmsNotification();
            else if (type == "phone")
                return new PhNotification();
            else
                throw new Exception("Invalid input");
        }
    }
    class Program
    {
        static void Main()
        {
            INotification notification;

            notification = NotificationFactory.CreateNotification("sms");
            notification.send();
        }
    }
}