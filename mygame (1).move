/// Oyun modülü.
module Mygame::Mygame {

    /// Oyuncu veri yapısı.
    resource Player {
        id: u64,
        health: u64,
        attack_power: u64,
        defense_power: u64,
    }

    /// Canavar veri yapısı.
    resource Monster {
        id: u64,
        health: u64,
        attack_power: u64,
        defense_power: u64,
    }

    /// Savaş durumu.
    resource BattleState {
        player: Player,
        monster: Monster,
        is_over: bool,
    }

    /// Yeni bir oyuncu oluştur.
    public fun createPlayer(id: u64, health: u64, attack_power: u64, defense_power: u64): Player {
        Player {
            id,
            health,
            attack_power,
            defense_power,
        }
    }

    /// Yeni bir canavar oluştur.
    public fun createMonster(id: u64, health: u64, attack_power: u64, defense_power: u64): Monster {
        Monster {
            id,
            health,
            attack_power,
            defense_power,
        }
    }

    /// Savaşı başlat.
    public fun startBattle(player: &Player, monster: &Monster): BattleState {
        BattleState {
            player: *player,
            monster: *monster,
            is_over: false,
        }
    }

    /// Oyuncunun saldırısı.
    public(script) fun playerAttack(battle_state: &mut BattleState) {
        assert(!battle_state.is_over, 777);

        // Oyuncunun saldırısı
        let player_damage = battle_state.player.attack_power;
        battle_state.monster.health = battle_state.monster.health.saturating_sub(player_damage);

        // Canavarın saldırısı
        let monster_damage = battle_state.monster.attack_power;
        battle_state.player.health = battle_state.player.health.saturating_sub(monster_damage);

        // Savaş durumu kontrolü
        if battle_state.player.health == 0 || battle_state.monster.health == 0 {
            battle_state.is_over = true;
        }
    }

    /// Oyuncunun durumu.
    public fun getPlayerState(battle_state: &BattleState): Player {
        battle_state.player
    }

    /// Canavarın durumu.
    public fun getMonsterState(battle_state: &BattleState): Monster {
        battle_state.monster
    }

    /// Savaş durumu.
    public fun getBattleState(battle_state: &BattleState): BattleState {
        *battle_state
    }
}
