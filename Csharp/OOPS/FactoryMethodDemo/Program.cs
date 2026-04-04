using System;
using System.ComponentModel.DataAnnotations;

namespace FactoryMethodDemo
{
    interface INotification
    {
        // Every notification type should know how to send itself.
        void Send();
    }
    
    class EmailNotification : INotification
    {
        public void Send()
        {
            Console.WriteLine("Email Notification sent successfully");
        }
    }

    class SmsNotification : INotification
    {
        public void Send()
        {
            Console.WriteLine("SMS Notification sent successfully");
        }
    }
    class PhNotification : INotification
    {
        public void Send()
        {
            Console.WriteLine("Phone Notification sent");
        }
    }

    class NotificationFactory
    {
        // Factory method: creates the right object based on user choice.
        public static INotification CreateNotification(string type)
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
            // Client code only asks for a type; factory handles object creation details.
            INotification notification;

            notification = NotificationFactory.CreateNotification("sms");
            notification.Send();
        }
    }
}