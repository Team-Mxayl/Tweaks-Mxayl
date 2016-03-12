//Quartz Dust
    <ore:dustNetherQuartz>.add(<Magneticraft:item.dustQuartz>);
    mods.magneticraft.Grinder.addRecipe(<appliedenergistics2:item.ItemMultiMaterial>,<appliedenergistics2:item.ItemMultiMaterial:2>, null, 0.1, null, 0.1);
//botania
    mods.botania.PureDaisy.removeRecipe(<Botania:livingrock>);
    mods.thaumcraft.Crucible.addRecipe("ASPECTS", <Botania:livingrock>, <Thaumcraft:blockCosmeticSolid:6>, "praecantatio 2, victus 1, sensus 1");
    mods.botania.PureDaisy.removeRecipe(<Botania:livingwood>);
    mods.thaumcraft.Crucible.addRecipe("ASPECTS", <Botania:livingwood>, <Thaumcraft:blockMagicalLog>, "praecantatio 2, victus 1, sensus 1");

//BloodMagic
    recipes.remove(<AWWayofTime:Altar>);
    mods.thaumcraft.Arcane.addShaped("ASPECTS", <AWWayofTime:Altar>, "aer 50, terra 50, ignis 50, aqua 50, ordo 50, perditio 50", 
    																			[[<Botania:manaResource>, <Botania:manaResource:2>, <Botania:manaResource>], 
                                           [<Thaumcraft:ItemResource:2>, <Botania:runeAltar>, <Thaumcraft:ItemResource:2>],
                                           [<Thaumcraft:blockCosmeticSolid:6>, <Thaumcraft:blockStoneDevice:1>, <Thaumcraft:blockCosmeticSolid:6>]]);
    mods.bloodmagic.Altar.removeRecipe(<AWWayofTime:blankSlate>);
    mods.bloodmagic.Altar.addRecipe(<AWWayofTime:blankSlate>, <Thaumcraft:blockCosmeticSolid:6>, 1, 1000);
    mods.bloodmagic.Altar.removeRecipe(<AWWayofTime:weakBloodOrb>);
    mods.bloodmagic.Altar.addRecipe(<AWWayofTime:weakBloodOrb>, <Botania:manaResource:9>, 1, 2000);
    mods.bloodmagic.Altar.removeRecipe(<AWWayofTime:apprenticeBloodOrb>);
    mods.bloodmagic.Altar.addRecipe(<AWWayofTime:apprenticeBloodOrb>, <Botania:manaResource:4>, 2, 5000);
    mods.bloodmagic.Altar.removeRecipe(<AWWayofTime:magicianBloodOrb>);
    mods.bloodmagic.Altar.addRecipe(<AWWayofTime:magicianBloodOrb>, <Botania:storage:2>, 3, 25000);

//Railcraft
    recipes.remove(<Railcraft:machine.alpha:12>);
    recipes.addShaped(<Railcraft:machine.alpha:12> * 6,[[<minecraft:soul_sand>, <minecraft:soul_sand>, <minecraft:soul_sand>],
    												                            [<OpenBlocks:wrench>, <minecraft:magma_cream>, <OpenBlocks:wrench>],
    												                            [<minecraft:nether_brick>, <minecraft:nether_brick>, <minecraft:nether_brick>]]);
	
//Magneticraft	
    recipes.removeShaped(<Magneticraft:item.ingotCarbide>,[[<minecraft:coal>,<minecraft:coal>,<minecraft:coal>],
    													                             [<minecraft:coal>,<Magneticraft:item.ingotTungsten>,<minecraft:coal>],
    													                             [<minecraft:coal>,<minecraft:coal>,<minecraft:coal>]]);
    mods.railcraft.BlastFurnace.addRecipe(<Magneticraft:item.ingotTungsten>, false, false, 2560, <Magneticraft:item.ingotCarbide>*8);
    recipes.remove(<Magneticraft:chasis>);
    recipes.addShaped(<Magneticraft:chasis>*8, [[null,<Railcraft:part.plate:1>,null],
    											                      [<Railcraft:part.plate:1>,<Magneticraft:machine_housing>,<Railcraft:part.plate:1>],
    											                      [null,<Railcraft:part.plate:1>,null]]);
    									
//AppliedEnergistics
    recipes.remove(<appliedenergistics2:tile.BlockInscriber>);
    mods.thaumcraft.Arcane.addShaped("ASPECTS", <appliedenergistics2:tile.BlockInscriber>, "terra 8, ordo 8, perditio 8", 
    																			[[<Thaumcraft:ItemResource:2>, <minecraft:sticky_piston>, <Thaumcraft:ItemResource:2>], 
                                           [null, null, <appliedenergistics2:item.ItemMultiPart:16>],
                                           [<Thaumcraft:ItemResource:2>, <minecraft:sticky_piston>, <Thaumcraft:ItemResource:2>]]);
