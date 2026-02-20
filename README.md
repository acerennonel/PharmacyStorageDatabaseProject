# PharmacyStorageDatabaseProject

Projeyi nasıl çalıştırabilirsiniz: (Bu adımları, Windows işletim sistemine sahip bir bilgisayarda yapmanızı önerilir.)

* Şu sitedeki dosyayı indiriniz ve o uygulamayı kurunuz: https://go.microsoft.com/fwlink/?linkid=2344626&clcid=0x41f&culture=tr-tr&country=tr

* Sonra şu sitedeki dosyayı indiriniz ve o uygulamayı da kurunuz: https://aka.ms/ssms/22/release/vs_SSMS.exe

* Sonra SQL Server Management Studio (SSMS) uygulamasını açınız ve bağlantı kısmında "Connection String" kısmına geliniz ve şu text'i yazınız: Data Source=localhost;Initial Catalog=master;Integrated Security=True;Persist Security Info=False;Pooling=False;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Command Timeout=0

* Ardından "Connect" tuşuna basıp bağlanınız.

* Ardından bu repoda bulunan "Pharmacy Project Section 1 Group 4.zip" dosyasının içindekileri, bilgisayarınızın masaüstü bölümüne çıkartınız.

* Ardından çıkartmış olduğunuz dosyalardan "Pharmacy Query.sql" dosyasını SSMS'te açınız ve içindeki komutları çalıştırınız. Her beş satır boşluk aralığa kadar tek seferde komutları çalıştırabilirsiniz. (Bütün komutları teker teker çalıştırınız, aralarında 5 satır boşluk bulunan komutları beraber çalıştırmayınız.)

* Ardından şu sitedeki dosyayı indiriniz ve o uygulamayı kurunuz: https://visualstudio.microsoft.com/tr/thank-you-downloading-visual-studio/?sku=Community&channel=Stable&version=VS18&source=VSLandingPage&cid=2500&passive=false

* Ardından Visual Studio Installer uygulamasını açınız ve oradan Visual Studio Community'yi kurunuz. Kurarken "ASP.NET ve web geliştirme" ile ".NET Multi-platform App UI geliştirmesi" seçeneklerini seçiniz ve kurunuz.

* Ardından daha öncesinde çıkarmış olduğunuz dosyalardan "CMPE232" klasörünü açınız. O klasörde bulunan "CMPE232.slnx" dosyasına sağ tık yapınız ve "Visual Studio'da çalıştır" seçeneğine tıklayınız. Açılan Visual Studio ekranında, ekranın üst kısmındaki çalıştırma butonuyla projeyi çalıştırabilirsiniz.

#Projede kullanılan library'ler

Entity Framework 6.5.1
Microsoft.AspNetCore.App.Internal.Assets 10.0.1
Microsoft.AspNetCore.Components.QuickGrid.EntityFrameworkAdapter 10.0.1
Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore 10.0.1
Microsoft.EntityFrameworkCore.SqlServer 10.0.1
Microsoft.EntityFrameworkCore.Tools 10.0.1
Microsoft.VisualStudio.Web.CodeGeneration.Design 10.0.1

Bu proje; Ayşe Ceren Önel, Bartu Girgin, Bilgi Çağlar Bozkurt ve Selin Simge Kemeriz tarafından yapılmıştır.