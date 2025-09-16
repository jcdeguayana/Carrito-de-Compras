using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

using System.Net.Mail;
using System.Net;
using System.IO;

namespace CapaBusiness
{
    public class CN_Resources
    {

        // Genera una clave aleatoria de 6 caracteres
        public static string GenerarClave()
        {
            string clave = Guid.NewGuid().ToString("N").Substring(0, 6);
            return clave;
        }
        public static string ConvertirSha256(string texto)
        {
            StringBuilder Sb = new StringBuilder();

            using (SHA256 hash = SHA256.Create())
            {
                Encoding enc = Encoding.UTF8;
                byte[] result = hash.ComputeHash(enc.GetBytes(texto));

                foreach (byte b in result)
                    Sb.Append(b.ToString("x2"));
            }

            return Sb.ToString();
        }

        // Envía un correo electrónico
        public static bool EnviarCorreo(string correo, string asunto, string mensaje)
        {
            bool resultado = false;

            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(correo);
                mail.From = new MailAddress("jcdeguayanamunozsalas@gmail.com");
                mail.Subject = asunto;
                mail.Body = mensaje;

                SmtpClient smtp = new SmtpClient();
                smtp.Credentials = new NetworkCredential("jcdeguayanamunozsalas@gmail.com", "zfbt psyn isek lywq");
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;

                smtp.Send(mail);
                resultado = true;
            }
            catch (Exception)
            {
                resultado = false;
            }

            return resultado;
        }
    }
}
