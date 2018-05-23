using Gestor.DTO.DTO.Solicitud;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gestor.DAO.DAO.Mail
{
    public class MailDAO
    {
        public static string SendMail(List<NotificacionAprobacionSolicitudDTO> Enviar)
        {
            string resultado = "";
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            mmsg.From = new System.Net.Mail.MailAddress("gerencia.gestorea@gmail.com");

            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials = new System.Net.NetworkCredential("gerencia.gestorea@gmail.com", "gerencia.123");

            //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail

            cliente.Port = 587;
            cliente.EnableSsl = true;
            cliente.Host = "smtp.gmail.com";  //Para Gmail 
            /*
           foreach (var item in Enviar)
           {

               mmsg.To.Add(item.Correo);

           }
           */
            //destinatarios
            Enviar.ForEach(c =>
            {
                mmsg.To.Add(c.Correo);
                mmsg.Body = c.Mensaje;
                mmsg.Subject = c.Asunto;

                try
                {
                    //Enviamos el mensaje      
                    cliente.Send(mmsg);
                    resultado = "Correo enviado";
                }
                catch (System.Net.Mail.SmtpException ex)
                {
                    //Aquí gestionamos los errores al intentar enviar el correo
                    resultado = ex.Message;
                }

            });

            return resultado;
        }
    }
}
