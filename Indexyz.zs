/*
        MineTweaker Script
        Create By.Indexyz
        2016-2-20
        Version.Release.1
 */
# Import Space
    import minetweaker.item.IItemStack;
    import mods.nei.NEI;
    import mods.thaumcraft.Crucible;
    import mods.thaumcraft.Arcane;
    import mods.thaumcraft.Infusion;
    import mods.railcraft.RockCrusher;
    import mods.railcraft.Rolling;
    import mods.railcraft.BlastFurnace;
    import mods.projecte.PhiloStone;
    import mods.projecte.KleinStar;
# Var Space
    var IronPlate     = <Railcraft:part.plate>;
    var SteelPlate    = <Railcraft:part.plate:1>;
    var TinPlate      = <Railcraft:part.plate:2>;
    var CopperPlate   = <Railcraft:part.plate:3>;
    var IronWrench    = <OpenBlocks:wrench>;
    var SteelIngot    = <ore:ingotSteel>;
    var OreSteelPlate = <ore:plateSteel>;
# Add item that you want to remove here!
    var baneditems = 
    [
    # Because not IC2 support now!
    /*
        <IC2:itemPartCircuit>,f
        <IC2:itemToolCutter>,
        <IC2:itemToolForgeHammer>,
        <IC2:blockMachine>,
        <IC2:blockCrop>,    
    */
        <Magneticraft:InfiniteWater>,
        <appliedenergistics2:tile.BlockQuartzGrowthAccelerator>,
        <ae2stuff:Grower>,
    /*
        <advgenerators:TurbineBladeBronze>,
        <advgenerators:TurbineRotorBronze>,
        <advgenerators:TurbineKitBronze>,
    */
        <Botania:pool:2>,
        <ImmersiveEngineering:stoneDecoration:1>,
        <ImmersiveEngineering:stoneDecoration:2>,
     #  <ImmersiveEngineering:stoneDecoration:6>
    ] as IItemStack[];
    for i, item in baneditems 
    {
        var baneditem = baneditems[i];
        recipes.remove(baneditem);
        NEI.hide(baneditem);    
    }
# Ore Dictionary
    <ore:slimeball>.addAll(<ore:itemRubber>);
    # For RC to support plate Ore Dictionary
        <ore:plateIron>.add(IronPlate);
        <ore:plateSteel>.add(SteelPlate);
# Minecraft Modify
    # Var Space
        var Redstone    = <ore:dustRedstone>;
        var BlockIron   = <minecraft:iron_block>;
        var Sand        = <ore:sand>;
        var Glass       = <ore:blockGlass>;
        var RedStone    = <ore:dustRedstone>;
        var Stick       = <ore:stickWood>;
        var IronIngot   = <ore:ingotIron>;
    # Furnace Recipes
        furnace.remove(Glass);
        PhiloStone.removePhiloSmelting(<minecraft:glass>);
        mods.railcraft.BlastFurnace.addRecipe(<minecraft:sand>,true,false,5,<minecraft:glass>);
        Crucible.addRecipe("ASPECTS",<minecraft:glass>,<minecraft:sand>,"terra 1");
    # Crafting Fix
        recipes.remove(IronWrench);
        recipes.addShaped(IronWrench,[[null,IronIngot,IronIngot],
                                      [IronIngot,IronIngot,IronIngot],
                                      [IronIngot,IronIngot,null]]);
# StorageSilo Modify
    recipes.remove(<storageSilo:storagesilo>);
    recipes.addShaped(<storageSilo:storagesilo>,[[<ore:chest>,<ore:chest>,<ore:chest>],
                                                 [<ore:chest>,IronWrench,<ore:chest>],
                                                 [<ore:chest>,<ore:chest>,<ore:chest>]]);
    mods.thaumcraft.Arcane.addShaped("ASPECTS", <storageSilo:storagesilo>, "ordo 8, aer 2", [[<ore:chest>,<ore:chest>,<ore:chest>],
                                                                                              [<ore:chest>,null,<ore:chest>],
                                                                                             [<ore:chest>,<ore:chest>,<ore:chest>]]);
# RailCraft Modify
    # Var Space
        var RCBlastFurnace = <Railcraft:machine.alpha:12>;
    # Recipes
        recipes.remove(<Railcraft:machine.beta>);
        mods.railcraft.Rolling.addShaped(<Railcraft:machine.beta>, [[IronPlate, IronPlate, null], 
                                                                    [IronPlate, IronPlate, null],
                                                                    [null, null, null]]);
        recipes.remove(<Railcraft:machine.beta:13>);
        mods.railcraft.Rolling.addShaped(<Railcraft:machine.beta:13>, [[SteelPlate, SteelPlate, null], 
                                                                       [SteelPlate, SteelPlate, null],
                                                                       [null, null, null]]);
# MagnetiCraft Modify
    # Var Space
        var CopperCable       = <Magneticraft:item.cable_low>;
        var CopperCableNormal = <Magneticraft:item.cable_medium>;
        var CopperCableHigh   = <Magneticraft:item.cable_high>;
        var CopperCoil        = <Magneticraft:item.heavy_copper_coil>;
        var CopperWire        = <Magneticraft:item.copper_wire>;
        var CopperHeatCoil    = <Magneticraft:item.heatcoil_copper>;
        var IronHeatCoil      = <Magneticraft:item.heatcoil_iron>;
        var WHeatCoil         = <Magneticraft:item.heatcoil_tungsten>;
        var Diode             = <Magneticraft:diode>;
        var MachineBlock      = <Magneticraft:machine_housing>;
        var EnergyIO          = <Magneticraft:MB_EnergyIO>;
        var Chasis            = <Magneticraft:chasis>;
    # Normal Machine Recipes
        recipes.remove(<Magneticraft:firebox>);
        recipes.addShaped(<Magneticraft:firebox>,[[<Railcraft:part.plate:3>,<Magneticraft:item.heat_cable>,<Railcraft:part.plate:3>],
                                                  [<Magneticraft:item.heat_cable>,<Magneticraft:item.heatcoil_copper>,<Magneticraft:item.heat_cable>],
                                                  [<Railcraft:part.plate:3>,<Magneticraft:item.heat_cable>,<Railcraft:part.plate:3>]]);

        recipes.remove(<Magneticraft:heater>);
        recipes.addShaped(<Magneticraft:heater>, [[<ore:ingotCarbide>,CopperPlate,<ore:ingotCarbide>],
                                                  [CopperPlate,<Magneticraft:item.heatcoil_copper>,CopperPlate],
                                                  [<ore:ingotCarbide>,CopperPlate,<ore:ingotCarbide>]]);

        recipes.remove(MachineBlock);
        recipes.addShaped(MachineBlock,[[SteelPlate,<ore:ingotCarbide>,SteelPlate],
                                        [<ore:ingotCarbide>,IronWrench,<ore:ingotCarbide>],
                                        [SteelPlate,<ore:ingotCarbide>,SteelPlate]]);
        recipes.remove(Chasis);
        recipes.addShaped(Chasis,[[SteelPlate,SteelPlate,SteelPlate],
                                  [SteelPlate,MachineBlock,SteelPlate],
                                  [SteelPlate,SteelPlate,SteelPlate]]);
    # Items Recipes
        recipes.remove(CopperCable);
        recipes.addShaped(CopperCable,[[<ore:itemRubber>,CopperPlate,<ore:itemRubber>],
                                      [],
                                      []]);
        recipes.remove(CopperCoil);
        recipes.addShaped(CopperCoil,[[CopperPlate,CopperPlate,CopperPlate],
                                      [CopperPlate,CopperCable,CopperPlate],
                                      [CopperPlate,CopperPlate,CopperPlate]]);
        recipes.remove(EnergyIO);
        recipes.addShaped(EnergyIO,[[CopperWire,CopperWire,CopperWire],
                                    [CopperWire,Chasis,CopperWire],
                                    [CopperWire,CopperWire,CopperWire]]);
# RotaryCraft Modify
    # Var Space
         var CraftingTable   = <RotaryCraft:rotarycraft_item_machine:75>;
         var RoCBlastFurnace = <RotaryCraft:rotarycraft_item_machine:45>;
         var HASAAxis        = <RotaryCraft:rotarycraft_item_shaftcraft:2>;
         var HASAGear        = <RotaryCraft:rotarycraft_item_shaftcraft:4>;
         var IngotBedRock    = <ore:RotaryCraft:ingotBedrock>;
         var HSLAIngot       = <ore:ingotHSLA>;
         var HSLAIngot_NOD   = <RotaryCraft:rotarycraft_item_shaftcraft:1>;
         var RoCScreen       = <RotaryCraft:rotarycraft_item_borecraft:5>;
         var RoCChip         = <RotaryCraft:rotarycraft_item_borecraft:4>;
         var RoCPowerModel   = <RotaryCraft:rotarycraft_item_misccraft:2>;
         var RoCHotItem      = <RotaryCraft:rotarycraft_item_misccraft:2>;
    # Machine Recipes
        recipes.remove(CraftingTable);
        recipes.addShaped(CraftingTable,[[null,IronWrench,null],
                                         [IronWrench,MachineBlock,IronWrench],
                                         [null,IronWrench,null]]);
        recipes.remove(RoCBlastFurnace);
        recipes.addShaped(RoCBlastFurnace,[[<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>],
                                           [Diode,<minecraft:furnace>,Diode],
                                           [<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>,<Magneticraft:heat_resistance>]]);
    # Item Recipes
      recipes.remove(<Railcraft:firestone.cut>);
    recipes.remove(<Railcraft:firestone.refined:4999>);
    Rolling.addShaped(<Railcraft:firestone.cut>,[[<Railcraft:firestone.raw>]]);
    Rolling.addShaped(<Railcraft:firestone.cut>,[[<Railcraft:firestone.cracked:*>]]);
    BlastFurnace.addRecipe(<Railcraft:firestone.cut>, false, false, 1280, <Railcraft:firestone.refined:4999>);
# AE2 Modify
    # Var Space
        var CertusQCrystal     = <ore:crystalCertusQuartz>;
        var FluixCrystal       = <ore:crystalFluix>;
        var EndQCrystal        = <ore:gemQuartz>;
        var Silicon            = <ore:itemSilicon>;

        var PureCertusQCrystal = <appliedenergistics2:item.ItemMultiMaterial:10>;
        var PureFluixCrystal   = <appliedenergistics2:item.ItemMultiMaterial:12>;
        var PureEndQCrystal    = <appliedenergistics2:item.ItemMultiMaterial:11>;
        var CertusQuartzSeed   = <appliedenergistics2:item.ItemCrystalSeed>;
        var NetherQuartzSeed   = <appliedenergistics2:item.ItemCrystalSeed:600>;
        var FluixSeed          = <appliedenergistics2:item.ItemCrystalSeed:1200>;
        var FluixGlassCable    = <appliedenergistics2:item.ItemMultiPart:16>;

        var Inscriber          = <appliedenergistics2:tile.BlockInscriber>;
        var CraftingUnit       = <appliedenergistics2:tile.BlockCraftingUnit>;
        var FormationCore      = <appliedenergistics2:item.ItemMultiMaterial:43>;
        var AnnihilationCore   = <appliedenergistics2:item.ItemMultiMaterial:44>;
        var AEInterface        = <appliedenergistics2:tile.BlockInterface>;
        var GoldCircuit        = <appliedenergistics2:item.ItemMultiMaterial:22>;
        var CertusCircuit      = <appliedenergistics2:item.ItemMultiMaterial:23>;
        var DiamondCircuit     = <appliedenergistics2:item.ItemMultiMaterial:24>;
        var SiliconPCB         = <appliedenergistics2:item.ItemMultiMaterial:20>;

        var Storage1K          = <appliedenergistics2:item.ItemBasicStorageCell.1k>;
        var Storage4K          = <appliedenergistics2:item.ItemBasicStorageCell.4k>;
        var Storage16K         = <appliedenergistics2:item.ItemBasicStorageCell.16k>;
        var Storage64K         = <appliedenergistics2:item.ItemBasicStorageCell.64k>;
     # Pure Crystal
        # RaliCraft Blast Furnace
        mods.railcraft.BlastFurnace.addRecipe(CertusQuartzSeed, true, false, 130, PureCertusQCrystal);
        mods.railcraft.BlastFurnace.addRecipe(FluixSeed          , true, false, 130, PureFluixCrystal);
        mods.railcraft.BlastFurnace.addRecipe(NetherQuartzSeed, true, false, 130, PureEndQCrystal);
        # TC Recipes
        Crucible.addRecipe("ASPECTS", PureCertusQCrystal, CertusQCrystal, "vitreus 2");
        Crucible.addRecipe("ASPECTS", PureFluixCrystal  , FluixCrystal  , "vitreus 2");
        Crucible.addRecipe("ASPECTS", PureEndQCrystal   , EndQCrystal   , "vitreus 2");
    # Get Machine
        recipes.remove(Inscriber);
        # Tech Recipes
        recipes.addShaped(Inscriber,[[<Railcraft:part.plate:1>,<minecraft:sticky_piston>,<Railcraft:part.plate:1>],
                                     [null,null,FluixGlassCable],
                                     [<Railcraft:part.plate:1>,<minecraft:sticky_piston>,<Railcraft:part.plate:1>]]);
        /*
        # Magic Recipes
        Arcane.addShaped("ASPECTS", Inscriber, "ordo 8, terra 8", [[<ore:quicksilver>, <minecraft:sticky_piston>, <ore:quicksilver>], 
                                                                     [null, null, FluixGlassCable],
                                                                     [<ore:quicksilver>, <minecraft:sticky_piston>, <ore:quicksilver>]]);
        */
    # Auto Crafting Recipes
        recipes.remove(FormationCore);
        recipes.addShaped(FormationCore * 2,[[PureFluixCrystal,PureCertusQCrystal,PureFluixCrystal],
                                             [PureCertusQCrystal,Diode,PureCertusQCrystal],
                                             [PureFluixCrystal,PureCertusQCrystal,PureFluixCrystal]]);
        recipes.remove(AnnihilationCore);
        recipes.addShaped(AnnihilationCore * 2,[[PureFluixCrystal,PureEndQCrystal,PureFluixCrystal],
                                                [PureEndQCrystal,Diode,PureEndQCrystal],
                                                [PureFluixCrystal,PureEndQCrystal,PureFluixCrystal]]);
        recipes.remove(CraftingUnit);
        recipes.addShaped(CraftingUnit, [[GoldCircuit,FluixGlassCable,CertusCircuit],
                                         [CopperCoil,AEInterface,CopperCoil],
                                         [CertusCircuit,FluixGlassCable,GoldCircuit]]);
# Adv Generators Modify
    # Var Space
        var IronFrame          = <advgenerators:IronFrame>;
        var IronBlade          = <advgenerators:TurbineBladeIron>;
        var SteelBlade         = <advgenerators:TurbineBladeSteel>;
        var IronTubing         = <advgenerators:IronTubing>;
        var RedstoneIronWiring = <advgenerators:IronWiring>;
        var Controller         = <advgenerators:Controller>;
        var PressureValve      = <advgenerators:PressureValve>;
    # Item Recipes
        recipes.remove(IronFrame);
        recipes.addShaped(IronFrame,[[null,IronPlate,null],
                                     [IronPlate,null,IronPlate],
                                     [null,IronPlate,null]]);
        recipes.remove(SteelBlade);
        recipes.addShaped(SteelBlade,[[null,SteelPlate,SteelPlate],
                                      [null,SteelPlate,SteelPlate],
                                      [null,null,SteelPlate]]);
        recipes.remove(IronTubing);
        recipes.addShaped(IronTubing * 8,[[IronPlate,<ore:blockGlass>,IronPlate],
                                          [IronPlate,<ore:blockGlass>,IronPlate],
                                          [IronPlate,<ore:blockGlass>,IronPlate]]);
        recipes.remove(Controller);
        recipes.addShaped(Controller,[[CopperCable,CopperCable,CopperCable],
                                      [Diode,CertusCircuit,Diode],
                                      [CopperCable,CopperCable,CopperCable]]);
        recipes.remove(RedstoneIronWiring);
        recipes.addShaped(RedstoneIronWiring * 8,[[IronPlate,Redstone,IronPlate],
                                                  [Redstone,IronWrench,Redstone],
                                                  [IronPlate,Redstone,IronPlate]]);
        recipes.remove(PressureValve);
        recipes.addShaped(PressureValve,[[null,IronPlate,null],
                                         [IronTubing,IronTubing,IronTubing],
                                         [null,IronPlate,null]]);
        recipes.remove(IronBlade);
        recipes.addShaped(IronBlade,[[null,IronPlate,IronPlate],
                                     [null,IronPlate,IronPlate],
                                     [null,null,IronPlate]]);
# Oepn Computer Modify
    # Var Space
        var UnWorkPCB  = <OpenComputers:item:30>;
        var Disk       = <OpenComputers:item:19>;
        var Transistor = <OpenComputers:item:23>;
    # Item Recipes
        recipes.remove(UnWorkPCB);
        recipes.addShaped(UnWorkPCB,[[null,SiliconPCB,null],
                                     [SiliconPCB,SteelPlate,SiliconPCB],
                                     [null,SiliconPCB,null]]);
        recipes.remove(Disk);
        recipes.addShaped(Disk,[[null,null,null],
                                [SiliconPCB,Storage1K,SiliconPCB],
                                [null,null,null]]);
        recipes.remove(Transistor);
        recipes.addShapeless(Transistor,[IronPlate,GoldCircuit]);
# Bot Modify
    # var Recipes
        var Altar                  = <Botania:altar>;
        var MagicPool              = <Botania:pool>;
        var LiveRock               = <Botania:livingrock>;

        var GaiaIngot              = <ore:gaiaIngot>;
        var ElvenIngot             = <ore:ingotElvenElementium>;
        var ManaIngot              = <ore:ore:ingotManasteel>;
        var TerraIngot             = <ore:ingotTerrasteel>;

        var WhiteMysticalPetal     = <Botania:petal>;
        var OrangeMysticalPetal    = <Botania:petal:1>;
        var MagentaMysticalPetal   = <Botania:petal:2>;
        var LightBlueMysticalPetal = <Botania:petal:3>;
        var YellowMysticalPetal    = <Botania:petal:4>;
        var LimeMysticalPetal      = <Botania:petal:5>;
        var PinkMysticalPetal      = <Botania:petal:6>;
        var GrayMysticalPetal      = <Botania:petal:7>;
        var LightGrayMysticalPetal = <Botania:petal:8>;
        var CyanMysticalPetal      = <Botania:petal:9>;
        var PurpleMysticalPetal    = <Botania:petal:10>;
        var BlueMysticalPetal      = <Botania:petal:11>;
        var BrownMysticalPetal     = <Botania:petal:12>;
        var GreenMysticalPetal     = <Botania:petal:13>;
        var RedMysticalPetal       = <Botania:petal:14>;
        var BlackMysticalPetal     = <Botania:petal:15>;
        
        # Items
            var MysticalPetal = 
            [
                WhiteMysticalPetal,
                OrangeMysticalPetal,
                MagentaMysticalPetal,
                LightBlueMysticalPetal,
                YellowMysticalPetal,
                LimeMysticalPetal,
                PinkMysticalPetal,
                GrayMysticalPetal,
                LightGrayMysticalPetal,
                CyanMysticalPetal,
                PurpleMysticalPetal,
                BlueMysticalPetal,
                BrownMysticalPetal,
                GreenMysticalPetal,
                RedMysticalPetal,
                BlackMysticalPetal
            ] as IItemStack[];

            var PoolCraftList = 
            [
                BlockIron,
                BlockIron,
                BlockIron,
                BlockIron,
                <ForgeMicroblock:sawIron>
            ] as IItemStack[];
    # Item Recipes
        recipes.remove(Altar);
        Infusion.addRecipe("ASPECTS", <Thaumcraft:blockMetalDevice>, MysticalPetal, "victus 64, lux 64"     , Altar    , 5);
        recipes.remove(MagicPool);
        Infusion.addRecipe("ASPECTS", LiveRock                     , PoolCraftList, "victus 64, potentia 64", MagicPool, 5);
# BuildCraft Modify
    # Var Space
        var TankBlock = <BuildCraft|Factory:tankBlock>;
# EnderStorge Modify
    # Var Space
        # Wools
            var WoolWhite           = <minecraft:wool:0>;
            var WoolOrange          = <minecraft:wool:1>;
            var WoolMagenta         = <minecraft:wool:2>;
            var WoolLightBlue       = <minecraft:wool:3>;
            var WoolYellow          = <minecraft:wool:4>;
            var WoolLime            = <minecraft:wool:5>;
            var WoolPink            = <minecraft:wool:6>;
            var WoolGray            = <minecraft:wool:7>;
            var WoolLightGray       = <minecraft:wool:8>;
            var WoolCyan            = <minecraft:wool:9>;
            var WoolPurple          = <minecraft:wool:10>;
            var WoolBlue            = <minecraft:wool:11>;
            var WoolBrown           = <minecraft:wool:12>;
            var WoolGreen           = <minecraft:wool:13>;
            var WoolRed             = <minecraft:wool:14>;
            var WoolBlack           = <minecraft:wool:15>;
        # Ender Chests
            var EnderChestWhite     = <EnderStorage:enderChest:0>;
            var EnderChestOrange    = <EnderStorage:enderChest:273>;
            var EnderChestMagenta   = <EnderStorage:enderChest:546>;
            var EnderChestLightBlue = <EnderStorage:enderChest:819>;
            var EnderChestYellow    = <EnderStorage:enderChest:1092>;
            var EnderChestLime      = <EnderStorage:enderChest:1365>;
            var EnderChestPink      = <EnderStorage:enderChest:1638>;
            var EnderChestGray      = <EnderStorage:enderChest:1911>;
            var EnderChestLightGray = <EnderStorage:enderChest:2184>;
            var EnderChestCyan      = <EnderStorage:enderChest:2457>;
            var EnderChestPurple    = <EnderStorage:enderChest:2730>;
            var EnderChestBlue      = <EnderStorage:enderChest:3003>;
            var EnderChestBrown     = <EnderStorage:enderChest:3276>;
            var EnderChestGreen     = <EnderStorage:enderChest:3549>;
            var EnderChestRed       = <EnderStorage:enderChest:3822>;
            var EnderChestBlack     = <EnderStorage:enderChest:4095>;
        # Ender Pouches
            var EnderPouchWhite     = <EnderStorage:enderPouch:0>;
            var EnderPouchOrange    = <EnderStorage:enderPouch:273>;
            var EnderPouchMagenta   = <EnderStorage:enderPouch:546>;
            var EnderPouchLightBlue = <EnderStorage:enderPouch:819>;
            var EnderPouchYellow    = <EnderStorage:enderPouch:1092>;
            var EnderPouchLime      = <EnderStorage:enderPouch:1365>;
            var EnderPouchPink      = <EnderStorage:enderPouch:1638>;
            var EnderPouchGray      = <EnderStorage:enderPouch:1911>;
            var EnderPouchLightGray = <EnderStorage:enderPouch:2184>;
            var EnderPouchCyan      = <EnderStorage:enderPouch:2457>;
            var EnderPouchPurple    = <EnderStorage:enderPouch:2730>;
            var EnderPouchBlue      = <EnderStorage:enderPouch:3003>;
            var EnderPouchBrown     = <EnderStorage:enderPouch:3276>;
            var EnderPouchGreen     = <EnderStorage:enderPouch:3549>;
            var EnderPouchRed       = <EnderStorage:enderPouch:3822>;
            var EnderPouchBlack     = <EnderStorage:enderPouch:4095>;
        # Ender Tanks
            var EnderTankWhite      = <EnderStorage:enderChest:4096>; 
            var EnderTankOrange     = <EnderStorage:enderChest:4369>; 
            var EnderTankMagenta    = <EnderStorage:enderChest:4642>;
            var EnderTankLightBlue  = <EnderStorage:enderChest:4915>;
            var EnderTankYellow     = <EnderStorage:enderChest:5188>;
            var EnderTankLime       = <EnderStorage:enderChest:5461>;
            var EnderTankPink       = <EnderStorage:enderChest:5734>;
            var EnderTankGray       = <EnderStorage:enderChest:6007>;
            var EnderTankLightGray  = <EnderStorage:enderChest:6280>;
            var EnderTankCyan       = <EnderStorage:enderChest:6553>;
            var EnderTankPurple     = <EnderStorage:enderChest:6826>;
            var EnderTankBlue       = <EnderStorage:enderChest:7099>;
            var EnderTankBrown      = <EnderStorage:enderChest:7372>;
            var EnderTankGreen      = <EnderStorage:enderChest:7645>;
            var EnderTankRed        = <EnderStorage:enderChest:7918>;
            var EnderTankBlack      = <EnderStorage:enderChest:8191>;
        # Item List
            var Wools = 
            [
                WoolWhite,
                WoolOrange,
                WoolMagenta,
                WoolLightBlue,
                WoolYellow,
                WoolLime,
                WoolPink,
                WoolGray,
                WoolLightGray,
                WoolCyan,
                WoolPurple,
                WoolBlue,
                WoolBrown,
                WoolGreen,
                WoolRed,
                WoolBlack
            ] as IItemStack[];

            var EnderChests = 
            [
                EnderChestWhite,
                EnderChestOrange,
                EnderChestMagenta,
                EnderChestLightBlue,
                EnderChestYellow,
                EnderChestLime,
                EnderChestPink,
                EnderChestGray,
                EnderChestLightGray,
                EnderChestCyan,
                EnderChestPurple,
                EnderChestBlue,
                EnderChestBrown,
                EnderChestGreen,
                EnderChestRed,
                EnderChestBlack
            ] as IItemStack[];

            var EnderTanks = 
            [
                EnderTankWhite,
                EnderTankOrange,
                EnderTankMagenta,
                EnderTankLightBlue,
                EnderTankYellow,
                EnderTankLime,
                EnderTankPink,
                EnderTankGray,
                EnderTankLightGray,
                EnderTankCyan,
                EnderTankPurple,
                EnderTankBlue,
                EnderTankBrown,
                EnderTankGreen,
                EnderTankRed,
                EnderTankBlack
            ] as IItemStack[];

            var EnderPouchs = 
            [
                EnderPouchWhite,
                EnderPouchOrange,
                EnderPouchMagenta,
                EnderPouchLightBlue,
                EnderPouchYellow,
                EnderPouchLime,
                EnderPouchPink,
                EnderPouchGray,
                EnderPouchLightGray,
                EnderPouchCyan,
                EnderPouchPurple,
                EnderPouchBlue,
                EnderPouchBrown,
                EnderPouchGreen,
                EnderPouchRed,
                EnderPouchBlack
            ] as IItemStack[];
    # Item Recipes
        for i, Wool in Wools 
        {
            var EnderChest = EnderChests[i];
            var EnderTank  = EnderTanks[i];
            var EnderPouch = EnderPouchs[i];

            recipes.remove(EnderChest);
            recipes.remove(EnderTank);
            recipes.remove(EnderPouch);
            # Technology Recipes
                recipes.addShaped(EnderChest,[[IngotBedRock,Wool,IngotBedRock],
                                              [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
                                              [IngotBedRock,<ore:pearlEnderEye>,IngotBedRock]]);
                recipes.addShaped(EnderTank,[[IngotBedRock,Wool,IngotBedRock],
                                             [<ore:rodBlaze>,TankBlock,<ore:rodBlaze>],
                                             [IngotBedRock,<ore:pearlEnderEye>,IngotBedRock]]);
                
                recipes.addShaped(EnderPouch,[[HSLAIngot,Wool,HSLAIngot],
                                              [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
                                              [HSLAIngot,<ore:pearlEnderEye>,HSLAIngot]]);
            # Magic Recipes
                recipes.addShaped(EnderChest,[[GaiaIngot,Wool,GaiaIngot],
                                              [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
                                              [GaiaIngot,<ore:pearlEnderEye>,GaiaIngot]]);
                recipes.addShaped(EnderTank,[[GaiaIngot,Wool,GaiaIngot],
                                             [<ore:rodBlaze>,TankBlock,<ore:rodBlaze>],
                                             [GaiaIngot,<ore:pearlEnderEye>,GaiaIngot]]);
                
                recipes.addShaped(EnderPouch,[[ElvenIngot,Wool,ElvenIngot],
                                              [<ore:rodBlaze>,<storageSilo:storagesilo>,<ore:rodBlaze>],
                                              [ElvenIngot,<ore:pearlEnderEye>,ElvenIngot]]);
        }
# Blod Magic Modify
    # Var Space
        var BM_Altar         = <AWWayofTime:Altar>;
        var SacrificialKnife = <AWWayofTime:sacrificialKnife>;
        var OutRouting       = <AWWayofTime:outputRoutingFocus>;
        var InputRouting     = <AWWayofTime:inputRoutingFocus>;
        var MagicDust        = <AWWayofTime:magicales>;
        var LifeHolder       = <AWWayofTime:bloodMagicBaseItems:31>;
    # Item Modify
    /*
        recipes.remove(BM_Altar);
        recipes.addShaped(BM_Altar,[[null,<ore:gemDiamond>,null],
                                    [GaiaIngot,LiveRock,GaiaIngot]]);
    */
        recipes.remove(SacrificialKnife);
        recipes.addShaped(SacrificialKnife,[[<ore:blockGlass>,<ore:blockGlass>,<ore:blockGlass>],
                                            [null,TerraIngot,<ore:blockGlass>],
                                            [TerraIngot,null,<ore:blockGlass>]]);
# Project E Modify
    # Var Space
        var PhiloStone           = <ProjectE:item.pe_philosophers_stone>;
        var IronRing             = <ProjectE:item.pe_ring_iron_band>;

        var LowConvarenceDust    = <ProjectE:item.pe_covalence_dust>;
        var NormalConvarenceDust = <ProjectE:item.pe_covalence_dust:1>;
        var HighConvarenceDust   = <ProjectE:item.pe_covalence_dust:2>;
    # Item Modify
        recipes.remove(PhiloStone);
        recipes.remove(IronRing);
        recipes.remove(LowConvarenceDust);
        recipes.remove(NormalConvarenceDust);
        recipes.remove(HighConvarenceDust);
        # Magic Recipes
            recipes.addShaped(PhiloStone,[[<ore:ingotIron>,<ore:ingotIron>,<ore:ingotIron>],
                                          [OutRouting,<AWWayofTime:voidSigil>,InputRouting],
                                          [<ore:ingotIron>,<ore:ingotIron>,<ore:ingotIron>]]);
            recipes.addShaped(IronRing,[[TerraIngot,TerraIngot,TerraIngot],
                                        [TerraIngot,null,TerraIngot],
                                        [TerraIngot,TerraIngot,TerraIngot]]);
            Crucible.addRecipe("ASPECTS",LowConvarenceDust,MagicDust,"metallum 1,permutatio 1");
            recipes.addShaped(NormalConvarenceDust,[[LowConvarenceDust,LowConvarenceDust,LowConvarenceDust],
                                                    [LowConvarenceDust,LifeHolder,LowConvarenceDust],
                                                    [LowConvarenceDust,LowConvarenceDust,LowConvarenceDust]]);
            recipes.addShaped(HighConvarenceDust,[[NormalConvarenceDust,NormalConvarenceDust,NormalConvarenceDust],
                                                  [NormalConvarenceDust,<AWWayofTime:energyBazooka>,NormalConvarenceDust],
                                                  [NormalConvarenceDust,NormalConvarenceDust,NormalConvarenceDust]]);
        # Tech Recipes
            recipes.addShaped(PhiloStone,[[IngotBedRock,RoCScreen,IngotBedRock],
                                          [IngotBedRock,RoCChip,IngotBedRock],
                                          [IngotBedRock,RoCPowerModel,IngotBedRock]]);
            recipes.addShaped(IronRing,[[IngotBedRock,IngotBedRock,IngotBedRock],
                                        [IngotBedRock,null,IngotBedRock],
                                        [IngotBedRock,IngotBedRock,IngotBedRock]]);
            RockCrusher.addRecipe(HSLAIngot_NOD,false,false,[LowConvarenceDust],[1.0]);
            recipes.addShaped(NormalConvarenceDust,[[LowConvarenceDust,LowConvarenceDust,LowConvarenceDust],
                                                    [LowConvarenceDust,IngotBedRock,LowConvarenceDust],
                                                    [LowConvarenceDust,LowConvarenceDust,LowConvarenceDust]]);
            recipes.addShaped(HighConvarenceDust,[[NormalConvarenceDust,NormalConvarenceDust,NormalConvarenceDust],
                                                  [NormalConvarenceDust,RoCHotItem,NormalConvarenceDust],
                                                  [NormalConvarenceDust,NormalConvarenceDust,NormalConvarenceDust]]);
# Matter Overdrive Modify
    # Var Space
        var TritaniumPlate = <mo:tritanium_plate>;
        var TritaniumIngot = <mo:tritanium_ingot>;
        var CircuitMK1     = <mo:isolinear_circuit>;
        var Battery        = <mo:battery>;
        var Dilithium      = <ore:gemDilithium>;
        var Magnet         = <mo:s_magnet>;
    # Item Modify
        recipes.remove(TritaniumPlate);
        Rolling.addShaped(TritaniumPlate * 4, [[TritaniumIngot, TritaniumIngot, null], 
                                               [TritaniumIngot, TritaniumIngot, null],
                                               [null, null, null]]);
        recipes.remove(CircuitMK1);
        recipes.addShaped(CircuitMK1,[[CopperCable,Diode,CopperCable]]);
        recipes.remove(Battery);
        recipes.addShaped(Battery,[[null,CopperCable,null],
                                   [TritaniumPlate,Dilithium,TritaniumPlate],
                                   [TritaniumPlate,Dilithium,TritaniumPlate]]);
        recipes.remove(Magnet);
        recipes.addShaped(Magnet,[[TritaniumPlate,RedStone,TritaniumPlate],
                                  [CopperCable,CircuitMK1,CopperCable],
                                  [TritaniumPlate,RedStone,TritaniumPlate]]);
        recipes.remove(<mo:tritanium_axe>);
        recipes.addShaped(<mo:tritanium_axe>,[[TritaniumPlate,TritaniumPlate,null],
                                              [TritaniumPlate,Stick,null],
                                              [null,Stick,null]]);
        recipes.remove(<mo:tritanium_pickaxe>);
        recipes.addShaped(<mo:tritanium_pickaxe>,[[TritaniumPlate,TritaniumPlate,TritaniumPlate],
                                                  [null,Stick,null],
                                                  [null,Stick,null]]);
        recipes.remove(<mo:tritanium_hoe>);
        recipes.addShaped(<mo:tritanium_hoe>,[[TritaniumPlate,TritaniumPlate,null],
                                              [null,Stick,null],
                                              [null,Stick,null]]);
# IE Modify
    # Var Space
        var SteelComponent  = <ImmersiveEngineering:material:12>;
        var LowCoil         = <ImmersiveEngineering:coil>;
        var NormalCoil      = <ImmersiveEngineering:coil:1>;
        var HighCoil        = <ImmersiveEngineering:coil:2>;
        var RadiatorBlock   = <ImmersiveEngineering:metalDecoration:4>;
        var HeavyBlock      = <ImmersiveEngineering:metalDecoration:5>;
        var GeneratorBlock  = <ImmersiveEngineering:metalDecoration:6>;
        var LightBlock      = <ImmersiveEngineering:metalDecoration:7>;
        var AdvBlastFurnace = <ImmersiveEngineering:stoneDecoration:6>;
        var EnginerTool     = <ImmersiveEngineering:tool>;
    # Item Recipes
        # Stop Tool to craft plate
            recipes.remove(<ImmersiveEngineering:metal:38>);
            recipes.remove(<ImmersiveEngineering:metal:30>);
            recipes.remove(<ImmersiveEngineering:metal:36>);
            recipes.remove(<ImmersiveEngineering:metal:33>);
            recipes.remove(<ImmersiveEngineering:metal:32>);  
        recipes.remove(SteelComponent);
        recipes.addShaped(SteelComponent,[[SteelIngot,null,SteelIngot],
                                          [null,TritaniumPlate,null],
                                          [SteelIngot,null,SteelIngot]]);
        recipes.remove(LowCoil);
        recipes.addShaped(LowCoil,[[null,CopperCable,null],
                                   [CopperCable,Stick,CopperCable],
                                   [null,CopperCable,null]]);
        recipes.remove(NormalCoil);
        recipes.addShaped(NormalCoil,[[null,CopperCableNormal,null],
                                      [CopperCableNormal,Stick,CopperCableNormal],
                                      [null,CopperCableNormal,null]]);
        recipes.remove(HighCoil);
        recipes.addShaped(HighCoil,[[null,CopperCableHigh,null],
                                    [CopperCableHigh,Stick,CopperCableHigh],
                                    [null,CopperCableHigh,null]]);
        recipes.remove(EnginerTool);
        recipes.addShaped(EnginerTool,[[null,OreSteelPlate,null],
                                       [null,Stick,OreSteelPlate],
                                       [Stick,null,null]]);
        recipes.remove(AdvBlastFurnace);
        recipes.addShaped(AdvBlastFurnace,[[OreSteelPlate,OreSteelPlate,OreSteelPlate],
                                           [null,RCBlastFurnace,null],
                                           [OreSteelPlate,OreSteelPlate,OreSteelPlate]]);