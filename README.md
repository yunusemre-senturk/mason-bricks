# Mason



## Mason Nedir?

Flutter'da mason_cli kütüphanesi, hızlı ve tekrar kullanılabilir class, widget setleri oluşturmak için tasarlanmış bir araçtır. Adından da anlaşılacağı üzere tuğla mantığında kullanılmaktadır. Tek bir tuğla ile değil birkaç tanesi ile belirli bir yapı oluşturmak için iyi bir yöntemdir. 

## Mason Nasıl Kurulur?

1.	Terminal satırına ‘dart pub global activate mason_cli’ yazılarak indirilir
2.	Cihazın her noktasında kullanabilmek için path kısmına export PATH="$PATH":"$HOME/.pub-cache/bin" bu yazıldıktan sonra kaydedilir 
3.	Bilgisayarın belirli bir kısmına dosya oluşturulur
4.	Terminal satırından o dosyanın içerisine gidildikten sonra mason init komutu çalıştırılır
5.	Komut çalıştıktan sonra ‘mason.yaml’ dosyası oluşacaktır.
     <br>
     <img width="197" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/d142f418-825e-4fb9-9635-8d52de7d2744">
    
6.	Oluşturduğunuz dosyayı ide programında açtıktan sonra dosyaların oluşması ve dağınık halde olmaması için ayrı bir klasör açıyoruz ve bu dosyanın içerisine giriyoruz 
     <br><img width="177" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/592ec774-0ea9-49f0-9ef7-4f5efa8b82aa">
    <br> <img width="169" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/1c3ac5ae-acb0-4a3b-befb-af89da4b19c2">


 
7.	Oluşturduğumuz  dosyanın içerisine girdikten sonra mason new “xxxxx”  yazdıktan sonra bricks ile alakalı gerekli dosyaları oluşmaktadır
     <br><img width="381" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/99839361-f2ca-4819-b76e-b14fc359490f">
     <br><img width="187" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/051c9eb2-5be1-4054-8b84-f2efe0378a44">
8.	mason.yaml dosyasına girip kurduğumuz projenin yolunu tanıtmamız gerekmekte 
     <br><img width="266" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/03142216-d547-468b-99b5-962ae5046ec4">
     
9.	Bu yolu belirttikten sonra ‘mason get’ komutunu çalıştırıyoruz. Bu komut projenin bilgisayardaki yolunu belirtiyor
     <br><img width="414" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/5807f398-4bd1-44ba-bcd0-c4098dba0fc0">



## Mason Nasıl Kullanılır?

1.	Dosya kurulumları tamamlandıktan sonra ‘__bricks__’ dosyasının içerisine oluşturmak istediğimiz dosyaları, klasörler oluşturuyoruz. Örnek olarak HELLO.md dosyası bulunmakta.
     <br><img width="188" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/81fc0912-cb16-44ba-bdc0-3f9aa82a6978">


2.	Bu dosyanın ismine de bağlı olarak burada kullanıdğımız mimarinin içerisinde kullandığımız repository dosyasını oluşturacağız.

3.	Her şeyden ‘brick.yaml’ dosyasına gidip brick kullanmak istediğimizde yapılacak işlemlerle alakalı değişiklikleri yapmamız gerekmekte.
    <br><img width="247" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/a0cc9022-1ee9-4f7e-ab1e-600657e91a22">

4.	Burada kullanabileceğimiz veri tipleri ve bu tipleri kullanırken nasıl kullanmamız gerektiği ile alakalı belirli yönlendirmeler var. Gerekli değişiklikleri yaptıktan sonraki son hali şu şekildedir.
     <br><img width="213" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/7a2b748e-9b5a-4c6a-a375-93809015bb6f">

5.	Brick özelliğini kullandığımızda 2 adet soru soracak. İlki projenin ismi, ikincisi de repository nin ismi olacak. Sorduğumuz soruların cevapların dinamik şekilde isimlendirmede kullanacağız. Projenin ismini sormamızın sebebi kullanacağımız projelerin içerisinde import kodlarının da otomatik şekilde oluşmasını istediğimizden kaynaklı. 
6.	Bu değişiklikleri yaptıktan sonra artık hangi dosyaların oluşmasını istediğimize karar verip dosyaların içerisinde değişiklik yapabiliriz. 
    <br><img width="162" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/33bd42d9-dea3-4d44-b380-9ba93974cc9c">
    <br><img width="375" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/72f573f8-8a56-46e0-856a-838129665ac9">


7.	Yaptığımız işlem ‘__bricks__’ dosyasının içerisine bir adet dosya oluşturup bu dosyanın ismini de brick i kullanmak istediğimiz de sorduğumuz sorduğumuz ‘name’ i veriyoruz kullanım şekli ‘ {{name}} ’ şeklinde olmalıdır. Verilen isminin hangi notasyon ile yazılmasını istiyorsak ‘.snakeCase()’ gibi veriyoruz. Notasyonlar aşağıda mevcuttur.


## Github üzerinden bricks kullanımı

1.	Kullanmak istediğimiz projenin içerisine gidip terminale ‘mason init’ komutunu çalıştırıyoruz
2.	Kullanmak istediğimiz github hesabının linkini veriyoruz örneğin: 
“mason add repository --git-url https://github.com/yunusemre-senturk/mason-bricks  --git-path ./bricks/repository” terminalde bu komut satırını çalıştırıyoruz burada dikkat etmemiz gereken birkaç husus var. ‘mason add’ dedikten sonra verdiğimiz url nin içerisinde bulunan hangi bricks i kullanacaksak  ‘brick.yaml’ daki en tepede bulunan ‘name’ kısmını vermemiz lazım. 

 
3.	Terminal de çalıştırdıktan sonra şöyle bir çıktı alacaksınız 
 
sonrasında 1 tane dosya 1 tane de klasör daha oluşturulacak
mason-lock.json ve .mason klasörü içinde bricks.json. Buralar otomatik olarak sizin verdiğiniz url ve path i ekleyerek projenizde mason ı kullanmanızı sağlıyor.

4.	Farklı bir brick kullanmak istediğinizde de terminal satırı için verdiğim komutu değiştirip enter a bastığınızda otomatik olarak yenisini ekliyor ve bu şekilde birden fazla brick i kullanma şansınız oluyor.



## Mason'da Kullanılacak Notasyonlar
<br>
<br><img width="724" alt="image" src="https://github.com/yunusemre-senturk/mason-bricks/assets/85076777/e1c4e1fe-5c35-4b85-b71f-093a502490a9">


