-- Name: Dernier Contact
-- Description: GN co-organise par l'Imaginarium Tremens et l'Association des Bidouilleurs Libristes
-- Type: Mission

-- Init is run when the scenario is started. Create your initial world
function init()
    -- Create the main ship for the players.
    player = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Atlantis")
    player:setPosition(135000, 29000):setRotation(180):setCallSign("Epsilon")
    player:setJumpDrive(false)

    --research_station = SpaceStation():setTemplate("Small Station"):setFaction("Human Navy")
    --research_station:setPosition(23500, 16100):setCallSign("Research-1")
    main_station = SpaceStation():setTemplate("Medium Station"):setFaction("Human Navy")
    main_station:setPosition(135000, 28500):setCallSign("Europa-2")

    x_enemy_station = -62500
    y_enemy_station = -13000
    enemy_station = SpaceStation():setTemplate("Large Station"):setFaction("Exuari")
    enemy_station:setPosition(x_enemy_station, y_enemy_station):setCallSign("Europa-1")
    --neutral_station = SpaceStation():setTemplate("Small Station"):setFaction("Independent")
    --neutral_station:setPosition(9100,-35400):setCallSign("Refugee-X")
    
    --Nebula that hide the enemy station.
    Nebula():setPosition(-34300,  8000)
    Nebula():setPosition(-34000,  -700)
    Nebula():setPosition(-32000,-10000)
    Nebula():setPosition(-24000,-14300)
    Nebula():setPosition(-28600,-21900)

    --Random nebulae in the system
    Nebula():setPosition( -8000,-38300)
    Nebula():setPosition( 24000,-30700)
    Nebula():setPosition( 42300,  3100)
    Nebula():setPosition( 49200, 10700)
    Nebula():setPosition(  3750, 31250)
    Nebula():setPosition(-39500, 18700)

    --Reference asteroid
    refAsteroid = Asteroid():setPosition(1500, 5000):setSize(200)

    --First asteroid belt
    placeRandom(Asteroid, 500, 1500, -40000, 8000, -17000, 4000)
    placeRandom(VisualAsteroid, 250, 1500, -40000, 8000, -17000, 4000)
    placeRandom(Asteroid, 500, 8000, -17000, -14000, 31000, 4000)
    placeRandom(VisualAsteroid, 250, 8000, -17000, -14000, 31000, 4000)
    placeRandom(Asteroid, 250, -14000, 31000, -49000, 48000, 4000)
    placeRandom(VisualAsteroid, 150, -14000, 31000, -49000, 48000, 4000)

    --Second asteroid belt
    placeRandom(Asteroid, 800, -10000, -18000, -27500, 19000, 3000)
    placeRandom(VisualAsteroid, 450, -10000, -18000, -27500, 19000, 3000)
    placeRandom(Asteroid, 600, -27500, 19000, -44500, 28000, 3000)
    placeRandom(VisualAsteroid, 350, -27500, 19000, -44500, 28000, 3000)
    placeRandom(Asteroid, 600, -16000, -43000, -10000, -18000, 3000)
    placeRandom(VisualAsteroid, 350, -16000, -43000, -10000, -18000, 3000)

    --Wormhole
    hole = WormHole():setPosition(130000,30000):setTargetPosition(7400, 6900)
    hole:onTeleportation(callbackWormhole)
	
    -- Create the defense for the station
    CpuShip():setTemplate("Starhammer II"):setFaction("Exuari"):setPosition(x_enemy_station+random(-2000,2000), y_enemy_station+random(-2000,2000)):setJumpDrive(false):orderDefendTarget(enemy_station)
    CpuShip():setTemplate("Phobos T3"):setFaction("Exuari"):setPosition(x_enemy_station+random(-2000,2000), y_enemy_station+random(-2000,2000)):setJumpDrive(false):orderDefendTarget(enemy_station)
    enemy_dreadnought = CpuShip():setTemplate("Atlantis X23"):setFaction("Exuari")
    enemy_dreadnought:setPosition(x_enemy_station+random(-2000,2000), y_enemy_station+random(-2000,2000)):orderDefendTarget(enemy_station)
    CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setPosition(x_enemy_station+random(-2000,2000), y_enemy_station+random(-2000,2000)):setJumpDrive(false):orderDefendTarget(enemy_dreadnought)
    CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setPosition(x_enemy_station+random(-2000,2000), y_enemy_station+random(-2000,2000)):setJumpDrive(false):orderDefendTarget(enemy_dreadnought)
    CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setPosition(x_enemy_station+random(-2000,2000), y_enemy_station+random(-2000,2000)):setJumpDrive(false):orderDefendTarget(enemy_dreadnought)

    --Stationary fleet in sector E3
    First_fleet_ship1 = CpuShip():setTemplate("Adder MK5"):setFaction("Exuari"):setJumpDrive(false):setPosition(-24800, -3800):setRotation(20)
    First_fleet_ship2 = CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setJumpDrive(false):setPosition(-23000, -600):setRotation(20)
    First_fleet_ship3 = CpuShip():setTemplate("Adder MK5"):setFaction("Exuari"):setJumpDrive(false):setPosition(-22000, -2600):setRotation(20)
    First_fleet_ship4 = CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setJumpDrive(false):setPosition(-20000, -7700):setRotation(330)
    First_fleet_ship1:orderIdle()
    First_fleet_ship2:orderIdle()
    First_fleet_ship3:orderIdle()
    First_fleet_ship4:orderIdle()

    --Second fleet
    Second_fleet_ship1 = CpuShip():setTemplate("Adder MK5"):setFaction("Exuari"):setJumpDrive(false):setPosition(-43500, -8000):setRotation(20)
    Second_fleet_ship2 = CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setJumpDrive(false):setPosition(-41000, -3750):setRotation(85)
    Second_fleet_ship3 = CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setJumpDrive(false):setPosition(-43000, -13100):setRotation(20)
    Second_fleet_ship4 = CpuShip():setTemplate("MT52 Hornet"):setFaction("Exuari"):setJumpDrive(false):setPosition(-53000, -8500):setRotation(90)
    Second_fleet_ship1:orderStandGround()
    Second_fleet_ship2:orderStandGround()
    Second_fleet_ship3:orderStandGround()
    Second_fleet_ship4:orderStandGround()
    
    --Start off the mission by sending a transmission to the player
    main_station:sendCommsMessage(player, [[Ici le Haut Commandement Terrien. Message a la mission Epsilon.

La station Europa-2 restera en position et vous servira de relais de communication quantique a partir de maintenant.

Les rebelles de la mission Europa-1 disposent d'un arsenal nucleaire et empechent la Terre de beneficier des ressources de la lune Europa.

Partez a la poursuite de ces rebelles, et eliminez-les.]])
    --Set the initial mission state
    mission_state = missionStartState
end

function callbackWormhole(delta)
    main_station:sendCommsMessage(player, [[callbackWormhole]])
    mission_state = missionPassWormhole
end

function missionStartState(delta)
    if distance(player, main_station) > 1500 then
        main_station:sendCommsMessage(player, [[Le secteur G11 abrite un trou de ver qui vous menera au plus pres de la ceinture d'asteroides.

    C'est ce trou de ver qui a ete emprunte par la mission Europa-1. Traversez-le!]])
    mission_state = missionWaitWormhole
    end
end

function missionWaitWormhole(delta)
end

function missionPassWormhole(delta)
    if distance(player, refAsteroid) < 5000 then
        main_station:sendCommsMessage(player, [[Vous devriez arriver à proximité du champ d'asteroides.

    Continuez vers le secteur E3, et montrez-nous ce que vaut votre pilote!]])
    mission_state = missionPassAsteroidBelt
    end
end

function missionPassAsteroidBelt(delta)
    if distance(player, First_fleet_ship1) < 5000 or distance(player, First_fleet_ship2) < 5000 or distance(player, First_fleet_ship3) < 5000 or distance(player, First_fleet_ship4) < 5000 then
        main_station:sendCommsMessage(player, [[Ca y est ! Rebelles en vue !

    Donnez-leur une bonne lecon !!!]])
    mission_state = missionFirstEnemyDestroyed
    end
end

function missionFirstEnemyDestroyed(delta)
    if not First_fleet_ship1:isValid() or not First_fleet_ship2:isValid() or not First_fleet_ship3:isValid() or not First_fleet_ship4:isValid() then
        main_station:sendCommsMessage(player, [[Un de moins ! Etrange qu'ils ne se defendent pas...

    Peu importe, continuez l'elimination !]])
    mission_state = missionFirstFleetDestroyed
    end
end

function missionFirstFleetDestroyed(delta)
    if not First_fleet_ship1:isValid() and not First_fleet_ship2:isValid() and not First_fleet_ship3:isValid() and not First_fleet_ship4:isValid() then
        main_station:sendCommsMessage(player, [[Bien joue, Epsilon !

    Curieuse attitude de la flotte rebelle. Leurs vaisseaux n'ont pas riposte. Ils n'ont meme pas bouge ! Comme si personne ne se trouvait a bord...

    L'ennemi a peut-etre dispose ces vaisseaux comme leurres. Restez prudents.]])
        main_station:sendCommsMessage(player, [[La mission n'est pas terminee. La zone au-dela du secteur E3 est dissimulee par une nebuleuse.

    Le gros de la flotte rebelle, ainsi que le relais Europa-1, se trouve dans la zone aveugle.

    Poursuivez la mission, et eliminez une bonne fois pour toutes les mutins.]])
        mission_state = missionPassNebula
    end
end

function missionPassNebula(delta)
    if distance(player, Second_fleet_ship1) < 5000 or distance(player, Second_fleet_ship2) < 5000 or distance(player, Second_fleet_ship3) < 5000 or distance(player, Second_fleet_ship4) < 5000 then
        main_station:sendCommsMessage(player, [[...cation diff... ...leuse...

    ...psilon! V...tendez?...]])
        main_station:sendCommsMessage(player, [[...

    ...]])
        mission_state = missionSecondFleetFight1
    end
end

function missionSecondFleetFight1(delta)
    --Jupiter is learning. Now its ships can move !
    if not Second_fleet_ship1:isValid() or not Second_fleet_ship2:isValid() or not Second_fleet_ship3:isValid() or not Second_fleet_ship4:isValid() then
        if Second_fleet_ship1:isValid() then
            Second_fleet_ship1:orderAttack(player)
        end
        if Second_fleet_ship2:isValid() then
            Second_fleet_ship2:orderAttack(player)
        end
        if Second_fleet_ship3:isValid() then
            Second_fleet_ship3:orderAttack(player)
        end
        if Second_fleet_ship4:isValid() then
            Second_fleet_ship4:orderAttack(player)
        end
        mission_state = missionSecondFleetFight2
    end
end

function missionSecondFleetFight2(delta)
    --Only one survivor. Jupiter is learning to fly!
    survivor_count = 0
    if Second_fleet_ship1:isValid() then
        survivor_count = survivor_count+1
    end
    if Second_fleet_ship2:isValid() then
        survivor_count = survivor_count+1
    end
    if Second_fleet_ship3:isValid() then
        survivor_count = survivor_count+1
    end
    if Second_fleet_ship4:isValid() then
        survivor_count = survivor_count+1
    end
    if survivor_count <= 1 then
        if Second_fleet_ship1:isValid() then
            Second_fleet_ship1:orderDefendTarget(enemy_station)
        end
        if Second_fleet_ship2:isValid() then
            Second_fleet_ship2:orderDefendTarget(enemy_station)
        end
        if Second_fleet_ship3:isValid() then
            Second_fleet_ship3:orderDefendTarget(enemy_station)
        end
        if Second_fleet_ship4:isValid() then
            Second_fleet_ship4:orderDefendTarget(enemy_station)
        end
        if enemy_dreadnought:isValid() then
            enemy_dreadnought:orderAttack(player)
        end
        mission_state = nil
    end
end



function update(delta)
    --When the player ship, or the research station is destroyed, call it a victory for the Exuari
    if not player:isValid() or not main_station:isValid() then
        victory("Exuari")
        return
    end
    if not enemy_station:isValid() then
        victory("Human Navy")
        return
    end
    
    if mission_state ~= nil then
        mission_state(delta)
    end
end

function distance(obj1, obj2)
    local x1, y1 = obj1:getPosition()
    local x2, y2 = obj2:getPosition()
    local xd, yd = (x1 - x2), (y1 - y2)
    return math.sqrt(xd * xd + yd * yd)
end

-- Place random objects in a line, from point x1,y1 to x2,y2 with a random distance of random_amount
function placeRandom(object_type, amount, x1, y1, x2, y2, random_amount)
    for n=1,amount do
        local f = random(0, 1)
        local x = x1 + (x2 - x1) * f
        local y = y1 + (y2 - y1) * f
        
        local r = random(0, 360)
        local distance = random(0, random_amount)
        x = x + math.cos(r / 180 * math.pi) * distance
        y = y + math.sin(r / 180 * math.pi) * distance

        object_type():setPosition(x, y)
    end
end
