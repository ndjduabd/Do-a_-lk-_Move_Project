# Mygame

Mygame, Move programlama dilinde yazılmış basit bir oyun modülüdür. Bu modül, oyuncu ve canavar arasında savaşan bir oyun mantığı içerir. Oyuncu ve canavar, sağlık, saldırı gücü ve savunma gücü gibi özelliklere sahip kaynak yapılarıdır. Savaş durumu, oyuncu ve canavarın durumlarını ve savaşın bitip bitmediğini tutan bir kaynak yapıdır. Modül, oyuncu ve canavar oluşturmak, savaşı başlatmak, oyuncunun saldırısını gerçekleştirmek ve oyuncu, canavar ve savaş durumlarını almak için fonksiyonlar sunar.

## Nasıl Kullanılır

Bu modülü kullanmak için, Move derleyicisi veya yorumlayıcısı gibi bir araca ihtiyacınız vardır. Move dilinin nasıl çalıştığı hakkında daha fazla bilgi için [bu sayfayı](https://medium.com/@erkam_dev/github-profilimizin-tan%C4%B1t%C4%B1m%C4%B1n%C4%B1-readme-%C3%B6ne-%C3%A7%C4%B1karabilecek-i%CC%87yile%C5%9Ftirmeler-e9c5e3fc5eae) ziyaret edebilirsiniz. Modülü projenize dahil etmek için, modül dosyasını (`mygame.move`) projenizin kaynak kodu klasörüne kopyalayın. Modülü projenizde kullanmak için, `use Mygame::Mygame;` ifadesi ile modülü çağırın. Modülün sunduğu fonksiyonları kullanarak oyuncu ve canavar oluşturun, savaşı başlatın ve oyuncunun saldırısını gerçekleştirin. Oyuncu, canavar ve savaş durumlarını almak için ilgili fonksiyonları kullanın. Savaş durumunun `is_over` alanı `true` olana kadar savaşa devam edin.

## Örnek Kod

Aşağıda, modülü kullanarak basit bir oyun akışı gerçekleştiren bir örnek kod verilmiştir:

```move
use Mygame::Mygame;

script {
    fun main() {
        // Oyuncu ve canavar oluştur
        let player = Mygame::createPlayer(1, 100, 20, 10);
        let monster = Mygame::createMonster(2, 80, 15, 5);

        // Savaşı başlat
        let mut battle_state = Mygame::startBattle(&player, &monster);

        // Savaş bitene kadar oyuncunun saldırısını gerçekleştir
        while (!battle_state.is_over) {
            Mygame::playerAttack(&mut battle_state);

            // Oyuncu, canavar ve savaş durumlarını al
            let player_state = Mygame::getPlayerState(&battle_state);
            let monster_state = Mygame::getMonsterState(&battle_state);
            let battle_state = Mygame::getBattleState(&battle_state);

            // Oyuncu, canavar ve savaş durumlarını yazdır
            // (Bu kısım, Move dilinde yazılmamıştır, sadece örnek amaçlıdır)
            print(player_state);
            print(monster_state);
            print(battle_state);
        }

        // Savaş sonucunu yazdır
        // (Bu kısım, Move dilinde yazılmamıştır, sadece örnek amaçlıdır)
        if (player_state.health == 0) {
            print("Canavar kazandı!");
        } else if (monster_state.health == 0) {
            print("Oyuncu kazandı!");
        } else {
            print("Savaş berabere bitti!");
        }
    }
}
