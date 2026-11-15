Scriptname CassiopeiaPapyrusExtender native hidden

; #### This file is part of the mod "Cassiopeia Papyrus Extender" (SFSE plugin) by LarannKiar ####




   ; ##### Actor #####
   ;
   ; # adds a Perk to these actors
   ; # ( returns how many actors have the perk on function end )
Int Function AddPerkToAll(Actor[] akActors, Perk akPerk) native global
   ;
   ; # returns true if animation processing is disabled for this actor
   ; # ( see PauseAnimations and ResumeAnimations for more info )
Bool Function AreAnimationsPaused(Actor akActor) native global
   ;
   ; # returns true if there's at least one hostile within the given distance
   ; # ( hostality is checked against akActor; requires akActor and the hostiles to be 3D loaded )
Bool Function AreHostileActorsNearCustom(Actor akActor, float afDistance) native global
   ;
   ; # calculates this actor's jump height ( i.e. how high this actor can jump )
Float Function CalculateJumpHeight(Actor akActor) native global
   ;
   ; # calculates/resets the leveled actor base data for this templated actor
Bool Function CalculateTemplateForLeveledActor(Actor akActor) native global
   ;
   ; # changes the actor process level of this actor ( use with care )
   ; # ( note: call UpdateReference3D when moving a HighActor to MiddleLow or Low then back to High as the native code doesn't reload the actor's 3D automatically after moving back to High )
   ; # aiProcessLevel: 0 = High (for loaded actors), 1 = MiddleHigh, 2 = MiddleLow, 3 = Low
Bool Function ChangeActorProcessLevel(Actor akActor, Int aiProcessLevel) native global
   ;
   ; # clears the eyetrack target
Bool Function ClearEyeTracking(Actor akActor) native global
   ;
   ; # disables this actor's collision
   ; # ( works with NPCs only )
Bool Function DisableCollision(Actor akActor, Bool abDisable = true) native global
   ;
   ; # returns true if this actor affects the Stealth Meter
Bool Function DoesAffectStealthMeter(Actor akActor) native global
   ;
   ; # evaluates the AI Package of the specified actors
   ; # ( returns how many actors' AI was evaluated until function end )
Int Function EvaluatePackageForAll(Actor[] akActors, bool abResetAI = false) native global
   ;
   ; # fades in this actor
Bool Function FadeInActor(Actor akActor) native global
   ;
   ; # fades out this actor
Bool Function FadeOutActor(Actor akActor) native global
   ;
   ; # flags the actor's path invalid
Bool Function ForcePathFailure(Actor akActor) native global
   ;
   ; # returns how many Active Effects this actor has
   ; # ( returns -1 if akActor is None )
   ; # ( returns -2 if the actor's Active Effect data cannot be accessed at all, e.g. actor IsDisabled() )
Int Function GetActiveEffectCount(Actor akActor) native global
   ;
Struct ActiveEffectData
	String sType
	MagicEffect BaseEffect
	Form MagicItem
	Float fDuration
	Float fElapsedTime
	Float fMagnitude
	ActorValue ResistanceValue
	Int iEffectItemUniqueID
	String ActiveEffectMemoryAddress
EndStruct
   ;
   ; # returns this actor's Active Effects
   ; # ( sType is the base effect's object class name e.g. "PeakValueModifierEffect" )
   ; # ( iEffectItemUniqueID is the UniqueID of the Base Effect's Effect Item currently applied to the actor )
   ; # ( see ActiveMagicEffect.psc for more info )
ActiveEffectData[] Function GetActiveEffects(Actor akActor) native global
   ;
   ; # 3D Update flags are technically stored in an uint16_t; the native code sets 3D Update flags to request additional ( or just simply specify the ) 3D updates for the next actor update phase
   ; # ( actor updates happen constantly; when the update phase is complete, the native code automatically unsets the flag if the update request identified by the flag was processed )
   ; # ai3DUpdateFlag:
   ;     Flag values used for Fallout 4 ( Starfield flags are unknown ), here for reference only:
   ;     1 = Model
   ;     2 = Skin
   ;     4 = Head
   ;     8 = Face
   ;     16 = Scale
   ;     32 = Skeleton
   ;     64 = InitDefault
   ;     128 = SkyCellSkin
   ;     256 = Havok
   ;     512 = DontAddOutfit
   ;     1024 = KeepHead
   ;     2048 = Dismemberment
   ;
   ; # returns true if this 3D Update flag is set
Bool Function Get3DUpdateFlag(Actor akActor, Int ai3DUpdateFlag) native global
   ;
   ; # returns the 3D Update flags value ( uint16_t )
Int Function Get3DUpdateFlags(Actor akActor) native global
   ;
   ; # returns the min/max world coordinates of this actor's collision shape in a float array
   ; # ( 8 elements: min x, y, z, w then max x, y, z, w )
Float[] Function GetActorCollisionShapePosition(Actor akActor) native global
   ;
   ; # returns the gun state
Float Function GetActorGunState(Actor akActor) native global
   ;
   ; # returns the actors currently being detected by this actor; can be filtered for LOS
Actor[] Function GetActorsDetectedBy(Actor akDetecter, bool abMustHaveLOS = false) native global
   ;
   ; # returns the actors currently detecting this actor; can be filtered for LOS
Actor[] Function GetActorsDetecting(Actor akDetected, bool abMustHaveLOS = false) native global
   ;
   ; # returns this actor's Follow AI Package target reference ( if any )
ObjectReference Function GetAIFollowTargetRef(Actor akActor) native global
   ;
   ; # returns this actor's AI Package target reference ( if any )
ObjectReference Function GetAITargetRef(Actor akActor) native global
   ;
   ; # returns the active Anim Face Archetype
Keyword Function GetAnimFaceArchetype(Actor akActor) native global
   ;
   ; # returns the editor defined Anim Face Archetype
Keyword Function GetAnimFaceArchetypeEditorDefined(Actor akActor) native global
   ;
   ; # returns the ActorBase that holds this actor's appearance data
ActorBase Function GetAppearanceSource(Actor akActor) native global
   ;
Struct DialogueLineData
	Bool bValid
	TopicInfo theTopicInfo
	Topic theTopic
	Quest theQuest
	Int iResponseIndex
	String sResponseText
	Bool bIsLastResponse
	Keyword theAnimFaceArchetype
EndStruct
   ;
   ; # returns information about this actor's currently spoken dialogue line
   ; # ( bValid = true means dialogue info exists, so the actor IsTalking )
   ; # ( note: this is faster than the GetLastSaid functions )
DialogueLineData Function GetDialogueLineData(Actor akActor) native global
   ;
   ; # returns this actor's Current Package target reference ( if any )
ObjectReference Function GetCurrentPackageTargetRef(Actor akActor) native global
   ;
   ; # returns the Factions of this actor
Faction[] Function GetFactions(Actor akActor) native global
   ;
   ; # returns this actor's HeadParts
HeadPart[] Function GetHeadParts(Actor akActor) native global
   ;
   ; # returns the headtrack target
ObjectReference Function GetHeadTrackTarget(Actor akActor) native global
   ;
   ; # returns the actors currently being processed in HighActorProcessLevel
Actor[] Function GetHighActors() native global
   ;
   ; # returns the knock state
Float Function GetKnockStateEnum(Actor akActor) native global
   ;
   ; # returns the last said Topic Info of this actor
TopicInfo Function GetLastSaidTopicInfo(Actor akActor) native global
   ;
   ; # returns the Anim Face Archetype of the last said Topic Info of this actor
Keyword Function GetLastSaidTopicInfoAnimArchetypeKeyword(Actor akActor) native global
   ;
   ; # returns the Difficulty of this Leveled Actor ( 0 - 4; 4 = "not leveled" )
Int Function GetLeveledCharacterModifier(Actor akLeveledActor) native global
   ;
   ; # returns the loaded ammo count of this actor's equipped weapon
Int Function GetLoadedAmmoCount(Actor akActor) native global
   ;
   ; # returns the Magic Effects of this actor
MagicEffect[] Function GetMagicEffects(Actor akActor) native global
   ;
   ; # returns the movement state ( values > 0.0 means the actor is moving )
Float Function GetMovementState(Actor akActor) native global
   ;
   ; # returns the Perk Rank
   ; # ( valid Perk Rank values: 1 - 4 )
   ; # ( returns 0 if akActor doesn't have akPerk )
   ; # ( returns -1 if akActor or akPerk is None )
Int Function GetPerkRank(Actor akActor, Perk akPerk) native global
   ;
   ; # returns the Perks of this actor
Perk[] Function GetPerks(Actor akActor) native global
   ;
   ; # returns this actor's sex ( 0 = male, 1 = female, -1 = non binary )
Int Function GetSex(Actor akActor) native global
   ;
   ; # returns the speaking Anim Face Archetype
Keyword Function GetSpeakingAnimArchetype(Actor akActor) native global
   ;
   ; # returns the Spells of this actor
Spell[] Function GetSpells(Actor akActor) native global
   ;
   ; # calculates the threat ratio between akSubject and akTarget based on the vanilla combat strength formula
Float Function GetThreatRatio(Actor akSubject, Actor akTarget) native global
   ;
   ; # returns true if this actor is a templated actor
   ; # aiTemplateFlag: -1 = base template; rests are unknown; can be used to filter by Face, Faction, Keyword etc. templates
Bool Function GetUsesLeveledTemplate(Actor akActor, Int aiTemplateFlag = -1) native global
   ;
   ; # returns the velocity of this reference on the specified axis ( x, y, z )
Float Function GetVelocity(ObjectReference akReference, String asAxis) native global
   ;
   ; # calculates the Damage Output ( Electromagnetic, Energy, Physical ) of all equipped Weapon forms
Float Function GetWornItemsDamageOutputElectromagnetic(Actor akActor, Bool abCountExplosives = false) native global
Float Function GetWornItemsDamageOutputEnergy(Actor akActor, Bool abCountExplosives = false) native global
Float Function GetWornItemsDamageOutputPhysical(Actor akActor, Bool abCountExplosives = false) native global
   ;
   ; # calculates the Resistances ( against Electromagnetic, Energy, Physical damage ) of all equipped Armor forms
Float Function GetWornItemsDamageResistanceElectromagnetic(Actor akActor) native global
Float Function GetWornItemsDamageResistanceEnergy(Actor akActor) native global
Float Function GetWornItemsDamageResistancePhysical(Actor akActor) native global
   ;
   ; # returns true if this actor has no collision
Bool Function HasNoCollision(Actor akActor) native global
   ;
   ; # returns true if the native Crowd Manager considers this actor Crowd
Bool Function IsCrowdActor(Actor akActor) native global
   ;
   ; # returns true if this actor is dying
Bool Function IsDying(Actor akActor) native global
   ;
   ; # returns true if this actor is fleeing
Bool Function IsFleeing(Actor akActor) native global
   ;
   ; # returns true if this actor is floating
Bool Function IsFloating(Actor akActor) native global
   ;
   ; # returns true if this actor is holding an Anim Object
Bool Function IsHoldingAnimObject(Actor akActor) native global
   ;
   ; # returns true if this actor is search for their combat target
Bool Function IsInCombatSearch(Actor akActor) native global
   ;
   ; # returns true if this actor is in a Land Vehicle
Bool Function IsInVehicle(Actor akReference) native global
   ;
   ; # returns true if this actor is in water ( not necessarily submerged )
Bool Function IsInWater(Actor akActor) native global
   ;
   ; # returns true if this actor is jumping
Bool Function IsJumping(Actor akActor) native global
   ;
Bool Function IsMovingBackward(Actor akActor) native global
Bool Function IsMovingForward(Actor akActor) native global
Bool Function IsMovingLeft(Actor akActor) native global
Bool Function IsMovingRight(Actor akActor) native global
   ;
   ; # returns true if this actor is in alarmed state by a murder event
Bool Function IsMurderAlarmed(Actor akActor) native global
   ;
   ; # returns true if this actor is paralyzed
Bool Function IsParalyzed(Actor akActor) native global
   ;
   ; # returns true if this actor is pathing
Bool Function IsPathing(Actor akActor) native global
   ;
   ; # returns true if this actor's spacesuit helmet light is turned on
Bool Function IsSpacesuitHelmetLightOn(Actor akActor) native global
   ;
   ; # returns true if this actor's spacesuit helmet is visible
Bool Function IsSpacesuitHelmetVisible(Actor akActor) native global
   ;
   ; # returns true if this actor staggered
Bool Function IsStaggered(Actor akActor) native global
   ;
   ; # returns true if this actor is swimming
Bool Function IsSwimming(Actor akActor) native global
   ;
   ; # returns true if this actor is talking
Bool Function IsTalking(Actor akActor) native global
   ;
   ; # returns true if this actor is turning
Bool Function IsTurning(Actor akActor) native global
   ;
   ; # returns true if this actor underwater ( submerged )
Bool Function IsUnderwater(Actor akActor) native global
   ;
   ; # returns true if the land vehicle this actor is sitting in is in the air
Bool Function IsVehicleInAir(Actor akActor) native global
   ;
   ; # returns true if this actor walking
Bool Function IsWalking(Actor akActor) native global
   ;
   ; # makes this actor jump ( afJumpHeight <= 0.0 means use default jump height )
Bool Function Jump(Actor akActor, Float afJumpHeight = -1.0) native global
   ;
   ; # moves all actors to their Package Location
Bool Function MoveAllToPackageLocation(Actor[] akActors) native global
   ;
   ; # pauses animation processing for this actor
   ; # ( note that it doesn't pause AI processing; e.g. if the actor was walking when PauseAnimations was called, upon calling ResumeAnimations, they'd "teleport" to the spot where they would have walked to if animation processing wasn't disabled; call EnableAI(False) to pause AI too, if needed )
   ; # ( note that animation processing gets reenabled for all actors OnPlayerLoadGame )
   ; # ( see AreAnimationsPaused and ResumeAnimations )
Bool Function PauseAnimations(Actor akActor) native global
   ;
   ; # navigates this actor to the given coordinate
Bool Function PathToPoint(Actor akActor, float afXPos, float afYPos, float afZPos) native global
   ;
   ; # plays an Idle on this actor and skips the Idle form's Conditions
   ; # ( for example can be used to skip the GetCurrentDeliveryType conditions and play the cast Starborn Power anim on an NPC (002BACAF)  )
Bool Function PlayIdleNoConditions(Idle akIdle, Actor akActor, ObjectReference akTarget = None) native global
   ;
   ; # removes this Perk from these actors; returns how many actors does not have the perk on function end
Int Function RemovePerkFromAll(Actor[] akActors, Perk akPerk) native global
   ;
   ; # resumes animation processing for this actor
   ; # ( returns -1 on error; returns 0 if animation processing was not disabled and is running; returns 1 if animation processing was disabled and has been reenabled )
   ; # ( see AreAnimationsPaused and PauseAnimations )
Int Function ResumeAnimations(Actor akActor) native global
   ;
   ; # rotates this actor ( with turning movement animations, often seen when initiating a dialogue )
   ; # ( e.g. to ask the actor to face the player: RotateActor(akActor, akActor.GetAngleZ() + akActor.GetHeadingAngle(akTarget), 0.0) )
Bool Function RotateActor(Actor akActor, Float afAngle, Float afAngleTolerance) native global
   ;
   ; # sets/unsets this 3D Update flag
Bool Function Set3DUpdateFlag(Actor akActor, Int ai3DUpdateFlag) native global
   ;
   ; # sets an eyetarget
   ; # ( abReset: avoid resetting the actor's eyetracking if possible )
Bool Function SetEyeTarget(Actor akActor, Actor akTarget, Bool abReset = false) native global
   ;
   ; # toggles eyetracking
   ; # ( note: the vanilla code may reactivate it a few seconds later if the actor is nearby )
Bool Function SetEyeTrackingActive(Actor akActor, Bool abActive) native global
   ;
   ; # changes the active Anim Face Archetype to the one identified by this keyword
   ; # ( without changing the actor's current Anim Face Archetype keyword unlike the vanilla ChangeAnim actor functions )
Bool Function SetFaceAnimArchetype(Actor akActor, Keyword akKeyword) native global
   ;
   ; # forces this actor to enter/exit Sneak mode
Bool Function SetForceSneak(Actor akActor, bool abForceSneak) native global
   ;
   ; # turns on/off the spacesuit helmet light
Function SetHelmetLight(Actor akActor, bool abOn) native global
   ;
   ; # sets the loaded ammo count to the given value
Bool Function SetLoadedAmmoCount(Actor akActor, Int aiAmmoCount, Int aiEquipIndex = 0) native global
   ;
   ; # forces this actor to stop moving ( normally, i.e. doesn't freeze the actor )
Bool Function StopMovement(Actor akActor) native global
   ;
   ; # unequips all items (Weapons and Armors) from this actor and returns how many items were unequipped
Int Function UnequipAllThenUpdate3D(Actor akActor) native global



   ; ##### ActorBase #####
   ;
   ; # adds this head part
   ; # ( abRemovePrevious: removes any previous head part including its extra parts of the same HeadPartType )
   ; # ( abAddExtraParts: adds the extra parts of akHeadPart too )
   ; # ( returns true if akActorBase has akHeadPart on function end )
Bool Function AddHeadPart(ActorBase akActorBase, HeadPart akHeadPart, Bool abRemovePrevious = True, Bool abAddExtraParts = True) native global
   ;
   ; # returns the Min/Max Height
Float Function GetHeightMin(ActorBase akActorBase) native global
Float Function GetHeightMax(ActorBase akActorBase) native global
   ;
   ;/
   HeadPartTypes:
	0 Misc
	1 Face
	2 EyeRight
	3 Hair
	4 FacialHair
	5 Scar
	6 Eyebrows
	7 Jewelry
	8 Meatcaps
	9 Teeth
	10 HeadRear
	11 ExtraHair
	12 EyeLeft
	13 Eyelashes
	14 CreatureHead
	15 CreatureTorso
	16 CreatureArs
	17 CreatureLegs
	18 CreatureTail
	19 CreatureWings
   /;
   ; # returns the head part with the given head part type
HeadPart Function GetHeadPart(ActorBase akActorBase, Int aeHeadPartType) native global
   ;
   ; # returns true if this actor base has the specified head part
Bool Function HasHeadPart(ActorBase akActorBase, HeadPart akHeadPart) native global
   ;
   ; # removes this head part
   ; # ( returns true if akActorBase does not have akHeadPart on function end )
Bool Function RemoveHeadPart(ActorBase akActorBase, HeadPart akHeadPart, Bool abRemoveExtraParts = True) native global

   ;
   ; # sets the Min/Max Height
Bool Function SetHeightMin(ActorBase akActorBase, Float afValue) native global
Bool Function SetHeightMax(ActorBase akActorBase, Float afValue) native global



   ; ##### ActorValue #####
   ;
   ; # returns true if this actor value can be modified in a Papyrus script
Bool Function CanBeModifiedInScripts(ActorValue akActorValue) native global



   ; ##### Alias #####
   ;
   ; # returns the alias index ( Alias ID in Creation Kit )
Int Function GetAliasIndex(Alias akAlias) native global
   ;
   ; # returns this alias' name
String Function GetAliasName(Alias akAlias) native global
   ;
   ; # returns true if this alias is Optional
Bool Function IsOptional(Alias akAlias) native global
   ;
   ; # sets/unsets this alias Optional
Bool Function SetOptional(Alias akAlias, Bool abOptional) native global



   ; ##### Bitwise #####
   ;
Int Function BitwiseAnd(Int aiNumber1, Int aiNumber2) native global
Int Function BitwiseLeftShift(Int aiNumber1, Int aiNumber2) native global
Int Function BitwiseNot(Int aiNumber) native global
Int Function BitwiseOr(Int aiNumber1, Int aiNumber2) native global
Int Function BitwiseRightShift(Int aiNumber1, Int aiNumber2) native global
Int Function BitwiseXor(Int aiNumber1, Int aiNumber2) native global
Int Function SetBit(Int aiNumber, Int aiBit) native global
Int Function UnsetBit(Int aiNumber, Int aiBit) native global



   ; ##### Camera #####
   ;
Bool Function IsInAutoVanityMode() native global
Bool Function IsInFirstPerson() native global
Bool Function IsInFlightCam() native global
Bool Function IsInIronSightsCam() native global
Bool Function IsInPhotoMode() native global
Bool Function IsInShipActionCam() native global
Bool Function IsInShipCombatOrbitCam() native global
Bool Function IsInShipFarTravelCam() native global
Bool Function IsInShipTargetingCam() native global
Bool Function IsInThirdPerson() native global



   ; ##### Cell #####
   ;
   ; # returns true if this cell is fully loaded
Bool Function GetCellLoaded(Cell akCell) native global
   ;
   ; # returns how many references are in this cell
Int Function GetCellReferenceCount(Cell akCell) native global



   ; ##### CharGen & FaceGen Utils #####
   ;
   ;
   ; ### CharGen ###
   ;
   ; # CharGen ( character appearance ) data is technically ActorBase data as per vanilla design.
   ; # Which means, any changes to an actor's appearance are written to their appearance source actor base form.
   ; # To identify the appearance source actor base, call GetAppearanceSource().
   ; # Note that appearance changes are stored in save games ( see RestoreAppearance to restore the vanilla appearance ).
   ; # The "Set" functions such as SetHairColor don't reload CharGen data ( so they don't update appearance upon calling them ). Either update it with UpdateAppearance or reload the Actor's 3D ( e.g. Disable-Enable ).
   ;
   ;
   ; # Note that UpdateAppearance doesn't update facial tints ( such as makeup ). If facial tints look off after calling UpdateAppearance, call UpdateSkinTone ~0.2-0.5 AI update seconds after, e.g.:
   ;
   ; Function SetHairColorDirtyBlonde(Actor akActor)
   ; 	 SetHairColor(akActor, "DirtyBlonde")				; set hair color
   ; 	 UpdateAppearance(akActor)						; reload chargen data
   ; 	 Float fAITime = GetAIUpdateTimer()				; get AI Update time
   ; 	 While ( fAITime + 0.5 >= GetAIUpdateTimer() )		; wait for native code to update AI processing for all actors for at least 0.5 seconds ( should be enough for the vanilla code to complete UpdateAppearance )
   ; 	 	Utility.Wait(0.10)
   ; 	 EndWhile
   ; 	 UpdateSkinTone(akActor)						; once chargen data is reloaded and appearance is updated, update the skin tone
   ; EndFunction
   ;
   ; Function SetEyeColorBlue(Actor akActor)
   ; 	 SetEyeColor(akActor, "Blue")						; set eye color
   ; 	 UpdateSkinTone(akActor)						; eye color can be updated by UpdateSkinTone and not UpdateAppearance, see below
   ; EndFunction
   ;
   ;
String Function GetEyebrowColor(Actor akActor) native global
String Function GetEyeColor(Actor akActor) native global
String Function GetFacialHairColor(Actor akActor) native global
String Function GetHairColor(Actor akActor) native global
String Function GetJewelryColor(Actor akActor) native global
String Function GetTeethColor(Actor akActor) native global
   ;
Bool Function SetEyebrowColor(Actor akActor, String asColor) native global
Bool Function SetEyeColor(Actor akActor, String asColor) native global
Bool Function SetFacialHairColor(Actor akActor, String asColor) native global
Bool Function SetHairColor(Actor akActor, String asColor) native global
Bool Function SetJewelryColor(Actor akActor, String asColor) native global
Bool Function SetTeethColor(Actor akActor, String asColor) native global
   ;
   ;
   ;
   ; ### CharGen Misc. ###
   ;
   ; # returns the Body Weight values ( Thin, Muscular, Heavy ) in a 3-element float array
Float[] Function GetBodyWeight(Actor akActor) native global
   ;
   ; # returns the skin tone index ( 0 - 8 )
Int Function GetSkinTone(Actor akActor) native global
   ;
   ; # updates the full appearance
   ; # ( note that this is demanding )
Bool Function UpdateAppearance(Actor akActor, int aiUpdateFlags = 0x28, bool abTreatAsRaceChange = false) native global
   ;
   ; # updates the chargen ( facial ) appearance
Bool Function UpdateChargenAppearance(Actor akActor) native global
   ;
   ; # updates the Skin Tone ( including facial tints, makeup ) and eye color
Bool Function UpdateSkinTone(Actor akActor) native global
   ;
   ; # restores vanilla appearance
   ; # ( returns false if akActor is None or if both bool parameters are false )
   ; # ( does not reload the actor's vanilla appearance data from their Source Plugin .esm after calling it; only after the game is reopened )
   ; # ( use with care; avoid calling it on actors with templated appearance )
Bool Function RestoreAppearance(Actor akActor, Bool abFacialAppearance = true, Bool abBodyScale = true) native global
   ;
   ; # sets Body Weight values
Bool Function SetBodyWeight(Actor akActor, Float afThin, Float afMuscular, Float afHeavy) native global
   ;
   ; # sets Body Weight values ( array version; afBodyWeightValues must have 3 elements: Thin, Muscular, Heavy )
Bool Function SetBodyWeightFromArray(Actor akActor, Float[] afBodyWeightValues) native global
   ;
   ; # changes the skin tone index ( 0 - 8 )
   ; # ( no need to call UpdateSkinTone afterward, it applies the new Skin Tone immediatelly )
Bool Function SetSkinTone(Actor akActor, int aiSkinToneIndex) native global
   ;
   ;
   ;
   ; ### FaceGen ###
   ;
   ; # FaceGen refers to the vanilla game systems that construct facial data and manage facial animations.
   ; # Overriding facial morphs with the FaceGen functions below such as ApplyFacialExpression don't change actor appearance permanently ( unlike the CharGen functions above ). They are temporal overrides.
   ; # Temporal, because the vanilla animation system would immediatelly continue to run the actor's vanilla animations ( usually their Anim Archetype and Anim Face Archetype ).
   ; # To prevent this, PauseAnimations must be called before overriding facial expression or morphs. See PauseAnimations, ResumeAnimations and AreAnimationsPaused.
   ; # For reference, to queue a new facial animation to play, see the anim face archetype modifier functions like SetFaceAnimArchetype ( from Cassiopeia ) and ChangeAnimFaceArchetype ( vanilla Actor.psc ).
   ;
   ;
   ; To change an actor's facial expression to "Apologetic" for ~5 seconds:
   ;
   ; Function SetApologetic(Actor akActor) Global
   ; 	Form facialExpression_Apologetic = Game.GetFormFromFile(0x0020D3A3, "Starfield.esm")	; get the vanilla facial expression form
   ; 	PauseAnimations(akActor)														; pause animation processing for the NPC
   ; 	ApplyFacialExpression(akActor, facialExpression_Apologetic)							; apply the facial expression form
   ; 	Utility.Wait(5.0)																; keep the applied expression for ~5 seconds
   ; 	ResumeAnimations(akActor)														; reenable animation processing; vanilla code will continue to run the actor's vanilla animations ( and restore their previous facial expression )
   ; EndFunction
   ;
   ;
   ; To change an actor's facial animation to the "Apologetic" Anim Archetype without adding the archetype keyword:
   ;
   ; Function SetApologeticFaceAnimArchetype(Actor akActor) Global
   ; 	Keyword AnimFaceArchetypeApologetic = Game.GetFormFromFile(0x00118A4D, "Starfield.esm") as Keyword
   ; 	SetFaceAnimArchetype(akActor, AnimFaceArchetypeApologetic)
   ; EndFunction
   ;
   ;
   ; To change an actor's facial animation to the "Apologetic" Anim Archetype with adding the archetype keyword:
   ;
   ; Function SetApologeticFaceAnimArchetypeVANILLA(Actor akActor) Global
   ; 	Keyword AnimFaceArchetypeApologetic = Game.GetFormFromFile(0x00118A4D, "Starfield.esm") as Keyword
   ; 	akActor.ChangeAnimFaceArchetype(AnimFaceArchetypeApologetic)
   ; EndFunction
   ;
   ;
   ;
   ; # applies a facial expression form ( its all morphs ) to an actor
Bool Function ApplyFacialExpression(Actor akActor, Form akFacialExpressionData) native global
   ;
   ; # copies the facial expression from an actor to another
Bool Function CopyFacialExpression(Actor akSourceActor, Actor akTargetActor) native global
   ;
   ; # exports all facial morphs to a txt file ( in the EXE folder ). You can use this function to see all facial morphs names.
Bool Function ExportMorphMap(Actor akActor) native global
   ;
   ; # get a single morph value
Float Function GetMorphValue(Actor akActor, String asMorphName) native global
   ;
   ; # get multiple morph values ( an actor has 100 expression related facial morphs )
Float[] Function GetMorphValues(Actor akActor) native global
   ;
   ; # reads this Facial Expression Data form's all morphs values and names ( arrays have the same size )
String[] Function ReadFacialExpressionDataMorphNames(Form akFacialExpressionData) native global
Float[] Function ReadFacialExpressionDataMorphValues(Form akFacialExpressionData) native global
   ;
   ; # reads a single morph value
Float Function ReadMorphValue(Form akFacialExpressionData, String asMorphName) native global
   ;
   ; # sets all facial morphs to 0 ( i.e. to "neutral" face )
Bool Function ResetFacialExpression(Actor akActor) native global
   ;
   ; # set a single morph value
Bool Function SetMorphValue(Actor akActor, String asMorphName, float afValue) native global
   ;
   ; # set multiple morph values
Bool Function SetMorphValues(Actor akActor, String[] asMorphNames, float[] afValues) native global
   ;
   ; # all facial morphs of this actor will be written to this Facial Expression Data form
Bool Function StoreFacialExpression(Actor akActor, Form akFacialExpressionData) native global
   ;
   ; # writes a single morph value
Bool Function WriteMorphValue(Form akFacialExpressionData, String asMorphName, float afValue) native global



   ; ##### Console #####
   ;
   ; # clears the Console log
Bool Function ClearConsoleLog() native global
   ;
   ; # print this line in the Console log
Bool Function PrintToConsoleLog(String asText) native global



   ; ##### DefaultObject #####
   ;
   ; # returns the form assigned to this Default Object
Form Function GetDefaultObjectForm(Form akDefaultObject) native global
   ;
   ; # sets/unsets the form assigned to this Default Object
Bool Function SetDefaultObjectForm(Form akDefaultObject, Form akForm) native global



   ; ##### Events #####
   ;
   ; # scripts can be filtered by the event sender forms
   ; # ( see CassiopieaPapyrusEvents.txt for details )
Bool Function AddNativeEventFilter(String asScriptName, String asEventName, Form[] akFormFilter) native global
Form[] Function GetNativeEventFilteredForms(String asScriptName, String asEventName) native global
Bool Function IsRegisteredForNativeEvent(String asScriptName, String asEventName) native global
   ;
Bool Function RemoveAllNativeEventFilters(String asScriptName, String asEventName) native global
   ;
   ; # debug use only
Int Function RegisterForAllNativeEvents(String asScriptName) native global
   ;
Bool Function RegisterForNativeEvent(String asScriptName, String asEventName, Form[] akFormFilter = None) native global
Bool Function RemoveNativeEventFilter(String asScriptName, String asEventName, Form[] akFormFilter) native global
   ;
Bool Function UnregisterForAllNativeEvents(String asScriptName) native global
Bool Function UnregisterForNativeEvent(String asScriptName, String asEventName) native global







   ; ##### Favorites #####
   ;
   ; # returns true if this form is a Favorite Item
Bool Function IsFavorite(Form akForm) native global
   ;
   ; # returns the Favorite Slot of this form ( Favorite Slot values: 0 - 9 )
Int Function GetFavoriteSlot(Form akForm) native global
   ;
   ; # returns the Favorite Item in this Favorite Slot
Form Function GetFavoriteInSlot(Int aiFavoriteSlot) native global
   ;
   ; # returns all Favorite Items ( note that the element order in the returned array does not correspond to forms' Favorite Slots )
Form[] Function GetFavorites() native global



   ; ##### Form #####
   ;
   ; # adds a keyword to this form
Bool Function AddKeywordToForm(Form akForm, Keyword akKeyword) native global
   ;
   ; # returns true if these two form arrays contain the same forms
Bool Function DoesContainSameForms(Form[] akForms1, Form[] akForms2) native global
   ;
   ; # returns all forms with the given form type, with optional last override plugin filter
Form[] Function GetAllFormsByFormType(Int aiFormType, String asLastOverriderPluginName = "") native global
   ;
   ; # returns the change flags as hex
String Function GetChangeFlagsAsHex(Form akForm) native global
   ;
   ; # returns the change flags as int
Int Function GetChangeFlagsAsInt(Form akForm) native global
   ;
   ; # finds a form by HexFormID
Form Function GetFormByHexFormID(String asHexFormID) native global
   ;
   ; # returns this form's Console description
   ; # ( e.g. for Sarah, "ACHR Form '' (00005986) to NPC_ form '' (00005983) in Cell 'CityNewAtlantisLodgeInt' (0006BB29)" )
String Function GetFormDescription(Form akForm) native global
   ;
   ; # returns the EditorID
String Function GetFormEditorID(Form akForm) native global
   ;
   ; # returns the form flags as hex
String Function GetFormFlagsAsHex(Form akForm) native global
   ;
   ; # returns the form flags as int
Int Function GetFormFlagsAsInt(Form akForm) native global
   ;
Struct FormLinkData
	Form LinkedForm
	Keyword LinkKeyword
EndStruct
   ;
   ; # returns the form links of this form
FormLinkData[] Function GetFormLinks(Form akForm) native global
   ;
   ; # returns all forms in this form list in a form array
Form[] Function GetFormListAllForms(FormList akFormList) native global
   ;
   ; # returns the form type as int
Int Function GetFormTypeAsInt(Form akForm) native global
   ;
   ; # returns the form type as string ( e.g. "STAT", "FURN", "NPC_" )
String Function GetFormTypeAsString(Form akForm) native global
   ;
   ; # finds forms by their EditorID
   ; # ( note: using the all forms map is expensive )
Form[] Function GetFormsByEditorID(String asEditorID, Bool abUseAllFormsMap = false) native global
   ;
   ; # returns all forms with the given Full Name ( TESFullName )
   ; # ( using the optional form type filter recommended as this operation is quite expensive )
Form[] Function GetFormsByTESFullName(String asFullName, Int aiFormType = -1) native global
   ;
   ; # returns true if the given change flag is set ( e.g. 0x1 is the temporary [T] )
   ; # ( change flag is another type of flag forms can have ) 
Bool Function GetIsChangeFlagSet(Form akForm, Int aiFlag) native global
   ;
   ; # returns true if the given form flag is set ( e.g. 0x400 is the persistence flag )
Bool Function GetIsFormFlagSet(Form akForm, Int aiFlag) native global
   ;
   ; # returns the Object Bounds if the form has this value ( SF1Edit >> OBND - Object Bounds )
Float[] Function GetObjectBounds(Form akForm) native global
   ;
Struct PropertySheetData
	Form propertyForm
	Float fValue
	Int iValue
EndStruct
   ;
   ; # returns the property sheet
PropertySheetData[] Function GetPropertySheet(Form akForm) native global
   ;
   ; # returns this form's Full Name ( TESFullName )
String Function GetTESFullName(Form akForm) native global
   ;
   ; # returns true if this base form has the specified Base Form Component ( such as "BGSDisplayCase" or "BGSAnimationGraph_Component" )
Bool Function HasBaseFormComponent(Form akForm, String asBaseFormComponent) native global
   ;
   ; # returns true if this form is runtime created ( i.e. formID starts with FF )
Bool Function IsCreated(Form akForm) native global
   ;
   ; # returns true if this form ( can be Weapon, Ammo, Armor, Race, etc. ) is Playable
Bool Function IsPlayable(Form akForm) native global
   ;
   ; # returns the last overrider plugin of this form ( the one that determines this form's data; in SF1Edit the record conflict winner )
String Function LookupLastOverriderPlugin(Form akForm) native global
   ;
   ; # returns the source plugin of this form ( the one this form's record lives in )
String Function LookupSourcePlugin(Form akForm) native global
   ;
   ; # removes a keyword from this form
Bool Function RemoveKeywordFromForm(Form akForm, Keyword akKeyword) native global
   ;
   ; # set/unset a change flag
Bool Function SetChangeFlag(Form akForm, Bool abSet, Int aiFlag) native global
   ;
   ; # set/unset a form flag
Bool Function SetFormFlag(Form akForm, Bool abSet, Int aiFlag) native global
   ;
   ; # replaces the elements in this form's form link array with the elements in the specified array
Bool Function SetFormLinks(Form akForm, FormLinkData[] akFormLinks) native global
   ;
   ; # replaces the elements in this form's property sheet with the elements in the specified array
Bool Function SetPropertySheet(Form akForm, PropertySheetData[] akPropertySheet) native global
   ;
   ; # sets this form's Full Name ( TESFullName )
Bool Function SetTESFullName(Form akForm, String asName) native global
   ;
   ; # sets the Playable flag on this form
Bool Function SetPlayable(Form akForm, Bool abSet) native global



   ; ##### Furniture #####
   ;
   ; # returns how many furniture markers this furniture has
Int Function GetFurnitureMarkerCount(Furniture akFurniture) native global
   ;
   ; # returns the furniture marker keyword ( i.e. the keyword an NPC must have to be able to interact with it )
Keyword Function GetFurnitureMarkerKeyword(Furniture akFurniture, Int aiMarkerID) native global
   ;
   ; # sets a furniture marker keyword
   ; # ( note: akMarkerKeyword can be None )
Bool Function SetFurnitureMarkerKeyword(Furniture akFurniture, Int aiMarkerID, Keyword akMarkerKeyword) native global



   ; ##### Game #####
   ;
   ; # returns true after the player purchases their first Land Vehicle
Bool Function AreVehiclesUnlocked() native global
   ;
   ; # returns true if the player can pilot the specified spaceship reference
Bool Function CanPlayerPilotShip(ObjectReference akSpaceshipReference) native global
   ;
   ; # disables all Menu renderers
Function DisableMenuRenderers(bool abDisable) native global
   ;
   ; # disables/enables Land Vehicle placement
   ; # ( can be used to prevent the vanilla code to spawn the land vehicle when the player exits their landed homeship )
   ; # ( see IsPlayerLandVehiclePlacementDisabled() )
Function DisablePlayerLandVehiclePlacement(Bool abDisable) native global
   ;
   ; # enables/disables distant LOD objects
Bool Function EnableDistantLOD(bool abEnable) native global
   ;
   ; # returns the HUD actors ( actors eligible to be shown on the HUD )
   ; # ( abShownOnly: to return only the one whose stats are actually visible on the HUD )
Actor[] Function GetActorsOnHUD(Bool abShownOnly = False) native global
   ;
   ; # returns the seconds passed after the first save game load ( note: it does not tick in menu mode )
Float Function GetAIUpdateTimer() native global
   ;
   ; # returns the position ( x, y, z ) of the world camera
Float[] Function GetCameraPosition() native global
   ;
   ; # returns the closest Outpost Beacon or Decorate activator ref
ObjectReference Function GetClosestWorkshop() native global
   ;
   ; # returns the Console selected reference
ObjectReference Function GetConsoleRef() native global
   ;
   ; # returns the Constructible Object of the selected/currently viewed item mod in the workbench menu
ConstructibleObject Function GetCraftingMenuRecipe() native global
   ;
   ; # returns the activatable reference in the crosshair
ObjectReference Function GetCrosshairRef() native global
   ;
   ; # returns all existing Crowd actors
Actor[] Function GetCrowdActors() native global
   ;
   ; # returns the Autopilot target in Cruise Mode
   ; # ( may be a Cell or a Planet form )
Form Function GetCruiseModeAutopilotTarget() native global
   ;
   ; # returns the Latitude ( uses the player's planet surface position )
Float Function GetCurrentWorldSpaceLatitude() native global
   ;
   ; # returns the Longitude ( uses the player's planet surface position )
Float Function GetCurrentWorldSpaceLongitude() native global
   ;
Struct CustomMarkerData
	Bool bValid
	Float fPosX
	Float fPosY
	Float fPosZ
	Location CurrentLocation
	Cell ParentCell
	WorldSpace ParentWorldSpace
EndStruct
   ;
   ; # returns the location and position of the Custom Marker placeable in the Surface Map menu
   ; # ( bValid = true means the Custom Marker exists )
CustomMarkerData Function GetCustomMarkerPosition() native global
   ;
   ; # returns the Galaxy Cell
Cell Function GetGalaxyCell() native global
   ;
   ; # returns the game date in an Int[], the 7 elements are as follows:
   ; # year, month, day, local hour and minute, UT hour and minute
Int[] Function GetGameDate() native global
   ;
   ; # returns the current time scale ( 0.0: paused - 1.0: normal )
Float Function GetGlobalTimeMultiplier() native global
   ;
   ; # returns the target time scale ( can be handy after calling SetGlobalTimeMultiplier )
Float Function GetGlobalTimeMultiplierTarget() native global
   ;
   ; # returns the Handscanner distance
   ; # ( works while the MonocleMenu is open )
Float Function GetHandscannerScanDistance() native global
   ;
   ; # returns the Handscanner target reference
   ; # ( the reference must support Scanning )
   ; # ( does not work with Resource Veins and non interactable references )
ObjectReference Function GetHandscannerTargetRef() native global
   ;
   ; # returns the interface language index
Int Function GetInterfaceLanguageIndex() native global
   ;
   ; # returns the actor the SLM command was most recently called with ( e.g. actor with FormID 0x59A9 if "SLM 59A9 2" )
Actor Function GetLastSLMTarget() native global
   ;
   ; # returns all loaded Cells
Cell[] Function GetLoadedCells() native global
   ;
   ; # returns all references in the loaded cells
   ; # ( recommended to be used for debug only )
ObjectReference[] Function GetLoadedReferences() native global
   ;
   ; # returns how many References are in Pack-In Cells
   ; # ( asPluginName is optional; if empty, then it checks all Pack-In Cells; if not, then only the ones which are defined in the specified plugin )
Int Function GetPackInCellReferenceCount(String asPluginName) native global
   ;
   ; # returns the actors selectable in Photo Mode ( requires IsMenuOpen("PhotoModeMenu") == true )
Actor[] Function GetPhotoModeActors() native global
   ;
   ; # returns how many Digipicks are in the player's inventory
Int Function GetPlayerDigipickCount() native global
   ;
   ; # returns how many follower actors the player has
Int Function GetPlayerFollowerCount() native global
   ;
   ; # returns the pilot seat reference of the player's homeship
ObjectReference Function GetPlayerHomeSpaceshipPilotSeatRef() native global
   ;
   ; # returns the player's current Land Vehicle
   ; # ( the Land Vehicle is often spawned and deleted by the vanilla code at runtime so it may or may not exist depending on where the player is )
ObjectReference Function GetPlayerLandVehicle() native global
   ;
   ; # returns the current speed of the player's ship
Int Function GetPlayerSpaceshipCurrentSpeed() native global
   ;
   ; # returns the most recently calculated Fuel Consumption after the player selected a planet or system in the Galaxy menu
Float Function GetPlayerSpaceshipFuelConsumption() native global
   ;
   ; # returns the Grav Jump Range of the player's ship
   ; # only works after a planet or system is selected in the Galaxy menu
Float Function GetPlayerSpaceshipMaxFuelRange() native global
   ;
   ; # returns the weapon charge level of the player's ship
   ; # aiWeaponIndex: 1 = left, 2 = top, 3 = right ( as seen on the Ship HUD )
Int Function GetPlayerSpaceshipWeaponCapacity(int aiWeaponIndex) native global
   ;
   ; # returns the weapon type of the player's ship as string ( e.g. MSL, LAS )
String Function GetPlayerSpaceshipWeaponType(int aiWeaponIndex) native global
   ;
   ; # returns the angle between this reference and the camera's heading in degrees - in the range from -180 to 180
   ; # ( it is basically akReference.GetHeadingAngle(WorldCamera), i.e. the reverse of vanilla Game.GetCameraHeadingAngle() )
Float Function GetReferenceCameraHeadingAngle(ObjectReference akReference) native global
   ;
   ; # returns the total Reference Handle count
Int Function GetReferenceHandleCount() native global
   ;
   ; # returns the target selected in the Spaceship Reticle
   ; # ( may be a Map Marker object reference, Planet or Star form )
Form Function GetReticleTarget() native global
   ;
   ; # returns the sorted actors from the HighActorProcessLevel
Actor[] Function GetSortedHighActors() native global
   ;
   ; # "1 day on the player's current planet how many UT hours?"
   ; # ( 0th element is hour, 1st is minute )
   ; # ( e.g. on Jemison: UTHourPerLocalDay = 50 hours; UTHourPerLocalHour = 2 hours and 5 minutes )
Int[] Function GetUTHourPerLocalDay() native global
Int[] Function GetUTHourPerLocalHour(bool abIgnorefMaxUTHourPerLocalHour) native global
   ;
   ; # VehicleCamStates: 1 = 1st person, 2 = 3rd person ( zoomed in ), 3 = 3rd person ( zoomed out )
Int Function GetVehicleCameraState() native global
   ;
   ; # returns the actors currently seen by the player
Actor[] Function GetVisibleActors() native global
   ;
   ; # returns true if any companion is talking
Bool Function IsAnyCompanionTalking() native global
   ;
   ; # returns true if this BA2 archive is in the .\\Starfield\\Data folder
   ; # ( asFileName expects only the file name like "ShatteredSpace - Textures.ba2" )
Bool Function IsBA2ArchivePresent(String asFileName) native global
   ;
   ; # returns true if AI Detection ( TDetect command ) is on
Bool Function IsGlobalAIDetectionOn() native global
   ;
   ; # returns true if the HUD Watch shows an environmental alert
Bool Function IsHUDWatchAlertActive() native global
   ;
   ; # returns true if God Mode ( TGM command ) is on
Bool Function IsInGodMode() native global
   ;
   ; # returns true if the player's Land Vehicle can be spawned by the vanilla code
   ; # ( see DisablePlayerLandVehiclePlacement() )
Bool Function IsPlayerLandVehiclePlacementDisabled() native global
   ;
   ; # returns true is the player's ship is in reverse
Bool Function IsPlayerSpaceshipFlyingBackward() native global
   ;
   ; # opens the Surface Map menu; returns false if the GalaxyStarMapMenu ( which the Surface Map is technically part of ) is already open
Bool Function OpenSurfaceMap() native global
   ;
   ; # plays an UI menu sound ( e.g. UIMenuGeneralOK, UIMenuGeneralActivateFailure )
Function PlayMenuSound(String asSoundName) native global
   ;
   ; # plays a Wwise Event form by its Default Object ( e.g. SpaceshipFarTravelArrivalSound_DO [DFOB:00045644] )
Bool Function PlayDefaultObjectWwiseEventForm(Form akDefaultObject) native global
   ;
   ; # changes the Camera State
   ; # Use with care; camera states rely on complex hardcoded behaviors to function properly,
   ; # so changing the camera state this way doesn't work with all cameras.
   ;
   ; # Camera States:
   ;   0 = First Person Camera State
   ;   1 = Auto Vanity Camera State
   ;   2 = VATS Camera State
   ;   3 = Iron Sights Camera State
   ;   4 = Player Camera Transition Camera State
   ;   5 = Tween Menu Camera State
   ;   6 = Third Person Camera State ( do not use )
   ;   7 = Vehicle Camera State
   ;   8 = Flight Camera State
   ;   9 = Ship Far Travel Camera State
   ;   10 = Ship Action Camera State
   ;   11 = Ship Targeting Camera State
   ;   12 = Ship Combat Orbit Camera State
   ;   13 = Free Walk Camera State
   ;   14 = Free Advanced Camera State
   ;   15 = Free Fly Camera State
   ;   16 = Free Tethered Camera State
   ;   17 = Dialogue Camera State
   ;   18 = Workshop Iso Camera State
   ;   19 = Photo Mode Camera State
   ;   20 = Third Person Camera State
   ;   21 = Furniture Camera State
   ;   22 = Horse Camera State
   ;   23 = Bleedout Camera State
   ;
Function SetCameraState(Int aeCameraState) native global
   ;
   ; # sets the Autopilot target in Cruise Mode
   ; # ( must be a Cell or a Planet form )
   ; # ( valid Cell form is for example "Starstation RE-939" [0003DBEC] )
   ; # ( make sure the target form is located in the same star system as the player )
Bool Function SetCruiseModeAutopilotTarget(Form akForm = None) native global
   ;
   ; # shows/hides the first person model in first person mode
Bool Function SetFirstPersonModelVisible(Bool abVisible) native global
   ;
   ; # changes the time scale ( first param affects everything and everyone except the player; the second param only affects the player )
Bool Function SetGlobalTimeMultiplier(Float afGlobalTimeMultiplier, Float afPlayerRelativeTimeMultiplier) native global
   ;
   ; # sets the Spaceship Reticle target
   ; # ( must be a Map Marker object reference, Planet or Star form )
Bool Function SetReticleTarget(Form akForm = None) native global
   ;
   ; # requests the vanilla code to create a ScreenShot
   ; # ( as per vanilla design, they are saved in ..\\Documents\\My Games\\Starfield\\NonPhotoModeScreenshots )
Function TakePhoto(Bool abHDR = false) native global



   ; ##### GameSettings #####
   ;
Bool Function GetINISettingBool(String asSetting) native global
Float Function GetINISettingFloat(String asSetting) native global
Int Function GetINISettingInt(String asSetting) native global
String Function GetINISettingString(String asSetting) native global
Int Function GetINISettingUInt(String asSetting) native global
   ;
Bool Function SetGameSettingBool(String asSetting, Bool abValue) native global
Bool Function SetGameSettingFloat(String asSetting, Float afValue) native global
Bool Function SetGameSettingInt(String asSetting, Int aiValue) native global
Bool Function SetGameSettingString(String asSetting, String asValue) native global
Bool Function SetGameSettingUInt(String asSetting, Int auValue) native global



   ; ##### HeadPart #####
   ;
   ; # returns the extra HeadParts
HeadPart[] Function GetExtraHeadParts(HeadPart akHeadPart) native global



   ; ##### INI #####
   ;
   ; # returns true if this INI file exists
   ; # ( asININame must not include the file extension )
   ; # ( file extension must be ".ini" )
Bool Function DoesIniExist(String asINIPath, String asININame) native global
   ;
   ; # reads an INI setting ( INI key )
String Function ReadIni(String asINIPath, String asININame, String asSection, String asKey) native global
   ;
   ; # writes this INI setting ( INI key ) to the specified INI file
   ; # ( if the INI key already exists, it overwrites its value )
Bool Function WriteIni(String asINIPath, String asININame, String asSection, String asKey, String asValue) native global



   ; ##### Input #####
   ;
   ;
   ; # aiControlMappingIndex:
   ;	 0 - 74
   ;	 0 = main
   ;	 1 = console
   ;	 73 = land vehicle
   ;     rests are undecoded
   ;     ( usually control maps are assigned to menus so the same key can be used for different controls depending on which menu receives the input )
   ;
   ; # aiKeyCode:
   ;     ( key codes are Virtual Key-Codes, see https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes )
   ;     ( use ExportControlMappings() to print all control maps to Cassiopeia a file )
   ;
   ; # writes the full ControlMap to a file
Function ExportControlMappings(String asFilePath, String asFileName) native global
   ;
   ; # returns the Control Name of this key
String Function GetControlNameByKeyCode(Int aiKeyCode, Int aiControlMappingIndex = -1) native global
   ;
   ; # returns how long this key by the given Control Name has been pressed
Float Function GetHoldTimeByControlName(String asControlName) native global
   ;
   ; # returns how long this key by the given Key Code has been pressed
Float Function GetHoldTimeByKeyCode(Int aiKeyCode) native global
   ;
   ; # returns the Key Name ("Friendly Name") of this key
String Function GetKeyNameByKeyCode(Int aiKeyCode) native global
   ;
   ; # returns true if the key with the given Control Name is pressed
Bool Function IsControlDown(String asControlName) native global
   ;
   ; # returns true if the key with the given Key Code is pressed
Bool Function IsKeyDown(Int aiKeyCode) native global
   ;
   ; # opens the TextInputMenu
   ; # ( asHeader and asBody can be empty strings )
   ; # ( you need to register for the event TextInputMenu_EndEditText to receive the input text, see CassiopeiaPapyrusEvents.txt )
Bool Function OpenTextInputMenu(String asHeader, String asBody) native global



   ; ##### Inventory Utils #####
   ;
   ; # returns the base forms of reference's inventory items
   ; # ( abMatchInventoryList = True means the returned array will retain the item order
   ; #   so that the array index can be used as aiItemIndex for the functions below;
   ; #   abMatchInventoryList = False means the function simply returns the base forms )
   ;
   ; # drops the Nth item
ObjectReference Function DropNthItem(ObjectReference akReference, Int aiItemIndex, Int aiCount = 1) native global
   ;
   ; # equips the Nth item
Bool Function EquipNthItem(Actor akActor, Int aiItemIndex, Bool abPreventRemoval = false, Bool abSilent = false) native global
   ;
   ; # returns the armor addons of the Nth armor item at the given stack 
ArmorAddon[] Function GetArmorAddonsOfArmorItem(ObjectReference akReference, Int aiItemIndex) native global
   ;
   ; # returns the names of all items in the item stack
String[] Function GetDisplayNameOfAllItemsInStack(ObjectReference akReference, Int aiItemIndex, Bool abCanReturnBaseName = true) native global
   ;
   ; # returns the name of the Nth item at the given stack
String Function GetDisplayNameOfItem(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0, Bool abCanReturnBaseName = true) native global
   ;
   ; # returns the base forms of this actor's equipped inventory items
Form[] Function GetEquippedInventoryItems(Actor akActor) native global
   ;
   ; # returns the Item Indexes of this actor's equipped inventory items
Int[] Function GetEquippedItemIndexes(Actor akActor) native global
   ;
   ; # returns the Item Indexes of all Favorite items in this reference's inventory
Int[] Function GetFavoriteItemIndexes(ObjectReference akReference) native global
   ;
   ; # returns the Item Indexes of all Featured Items in this reference's inventory
Int[] Function GetFeaturedItemIndexes(ObjectReference akReference) native global
   ;
   ; # returns how many inventory items this reference has
Int Function GetInventoryItemCount(ObjectReference akReference) native global
   ;
   ; # returns the base forms of reference's inventory items
   ; # ( abMatchInventoryList = True means the returned array will retain the item order
   ; #   so that the array index can be used as aiItemIndex for the functions below;
   ; #   abMatchInventoryList = False means the function simply returns the base forms )
Form[] Function GetInventoryItems(ObjectReference akReference, Bool abMatchInventoryList = false) native global
   ;
   ; # returns how many stacks the Nth item has
Int Function GetItemStackCount(ObjectReference akReference, Int aiItemIndex) native global
   ;
   ; # returns the keywords of the Nth item at the given stack
Keyword[] Function GetKeywordsOfItem(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns the ItemIndex ( aiItemIndex ) and Stack ( aiStack ) of the first item with the given item base
Int[] Function GetItemIndexAndStackByBase(ObjectReference akReference, Form akItemBase) native global
   ;
   ; # returns the ItemIndex ( aiItemIndex ) and Stack ( aiStack ) of the first item with the given name
Int[] Function GetItemIndexAndStackByName(ObjectReference akReference, String asItemName) native global
   ;
   ; # returns the ItemIndex ( aiItemIndex ) and Stack ( aiStack ) of the first item which has the given keyword
Int[] Function GetItemIndexAndStackByKeyword(ObjectReference akReference, Keyword akKeyword) native global
   ;
   ; # returns the base object of the Nth item
Form Function GetNthItemBaseObject(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # calculates the Damage Output ( Electromagnetic, Energy, Physical ) of the Nth ( Weapon ) item
Float Function GetNthItemDamageOutputElectromagnetic(ObjectReference akReference, int aiItemIndex, int aiStack, Bool abCountExplosives = false) native global
Float Function GetNthItemDamageOutputEnergy(ObjectReference akReference, int aiItemIndex, int aiStack, Bool abCountExplosives = false) native global
Float Function GetNthItemDamageOutputPhysical(ObjectReference akReference, int aiItemIndex, int aiStack, Bool abCountExplosives = false) native global
   ;
Struct DamageResistanceData
	ActorValue ResistanceAV
	Float fDamage
EndStruct
   ;
   ; # returns the Damage Outputs of the Nth ( Weapon ) item
DamageResistanceData[] Function GetNthItemDamageOutputs(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns the reference of the Nth item
   ; # note: editor placed and persistent references aren't deleted by the native code when they are added to an inventory
ObjectReference Function GetNthItemReference(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # calculates the Resistances of the Nth ( Armor ) item ( against Electromagnetic, Energy, Physical damage )
Float Function GetNthItemDamageResistanceElectromagnetic(ObjectReference akReference, int aiItemIndex, int aiStack) native global
Float Function GetNthItemDamageResistanceEnergy(ObjectReference akReference, int aiItemIndex, int aiStack) native global
Float Function GetNthItemDamageResistancePhysical(ObjectReference akReference, int aiItemIndex, int aiStack) native global
   ;
   ; # returns the Resistances of the Nth ( Armor ) item
DamageResistanceData[] Function GetNthItemDamageResistances(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns the Ammo of the Nth ( Weapon ) item
Ammo Function GetNthWeaponAmmo(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns the Ammo Capacity of the Nth ( Weapon ) item
   ; # ( returns -1 if akReference is None OR the Nth item is not a Weapon OR the Nth Weapon does not have Ammunition data e.g. FragGrenade )
Int Function GetNthWeaponAmmoCapacity(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns the Override Projectile of the Nth ( Weapon ) item
Projectile Function GetNthWeaponProjectile(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns the object mods of the Nth item at the given stack
ObjectMod[] Function GetObjectModsOfItem(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0, Bool abExcludeModColls = false) native global
   ;
   ; # returns the total weight of all worn ( equipped ) Weapon and Armor inventory items
   ; # ( akItemFilter is optional; if not empty, the code will only count items that have any of the filter keywords )
Float Function GetWornItemsWeight(Actor akActor, Bool abCalcWeapons, Bool abCalcArmors, Keyword[] akItemFilter = None) native global
   ;
   ; # returns true if the Nth item is equip state locked ( i.e. equipped with abPreventRemoval = true )
Bool Function IsNthItemEquipStateLocked(Actor akActor, Int aiItemIndex) native global
   ;
   ; # returns true if the Nth item is equipped
Bool Function IsNthItemEquipped(Actor akActor, Int aiItemIndex) native global
   ;
   ; # returns true if the Nth item is Favorite
Bool Function IsNthItemFavorite(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns true if the Nth item is a Featured Item
Bool Function IsNthItemFeaturedItem(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns true if the Nth item has a Legendary mod
Bool Function IsNthItemLegendary(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns true if the Nth item is Playable
Bool Function IsNthItemPlayable(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns true if the Nth item is a Quest Item
Bool Function IsNthItemQuestItem(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # returns true if the Nth item ( Weapon ) has the Can't Drop flag
Bool Function IsNthWeaponCantDrop(ObjectReference akReference, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # prints the inventory of this reference to a file
   ; # ( e.g. asFilePath = ".\\Data\\SFSE\\"; asFileName="MyInventory.txt" )
Bool Function PrintInventoryToFile(ObjectReference akReference, String asFilePath = "", String asFileName = "") native global
   ;
   ; # removes the Nth item
Bool Function RemoveNthItem(ObjectReference akReference, Int aiItemIndex, Int aiCount = 1, Int aiTransferReason = 0, ObjectReference akOtherContainer = None) native global
   ;
   ; # sets the Ammo of the Nth item ( Weapon )
Bool Function SetNthWeaponAmmo(ObjectReference akReference, Ammo akAmmo, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # sets the Ammo Capacity of the Nth item ( Weapon )
Bool Function SetNthWeaponAmmoCapacity(ObjectReference akReference, Int aiAmmoCapacity, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # sets the Override Projectile of the Nth item ( Weapon )
Bool Function SetNthWeaponProjectile(ObjectReference akReference, Projectile akProjectile, Int aiItemIndex, Int aiStack = 0) native global
   ;
   ; # unequips the Nth item
Bool Function UnequipNthItem(Actor akActor, Int aiItemIndex, Bool abPreventEquip = false, Bool abSilent = false) native global
;/
;
; # example function that transfers all Legendary items from akSourceContainer to akDestContainer; optionally skip Favorite items and restrict to Featured Items
;
Function TransferAllLegenaryItems(ObjectReference akSourceContainer, ObjectReference akDestContainer, Bool abSkipFavorites = True, Bool abRestrictToFeaturedItems = True) Global
	If !akSourceContainer
		Debug.MessageBox("ERROR: akSourceContainer is None")
		Return None
	EndIf
	If !akDestContainer
		Debug.MessageBox("ERROR: akDestContainer is None")
		Return None
	EndIf
	String LogName = "TransferAllLegenaryItems"
	Bool bInitialPapyrusLogging = GetINISettingBool("bEnableLogging:Papyrus")
	Bool bInitialPapyrusTrace = GetINISettingBool("bEnableTrace:Papyrus")
	Utility.SetINIBool("bEnableLogging:Papyrus", True)
	Utility.SetINIBool("bEnableTrace:Papyrus", True)
	Debug.OpenUserLog(LogName)
	Int Index = GetInventoryItemCount(akSourceContainer)
	If Index == 0
		Debug.TraceUser(LogName, "WARNING: Exiting, inventory of " + akSourceContainer + " is empty. Closing log...")
		Debug.CloseUserLog(LogName)
		Return None
	EndIf
	Debug.TraceUser(LogName, "Beginning to loop " + Index + " items in the inventory of " + akSourceContainer + "...")
	Int iTransferredItemCount = 0
	While Index >= 0
		Bool bSkip = False
		If !IsNthItemLegendary(akSourceContainer, aiItemIndex = Index)
			Debug.TraceUser(LogName, " ------ cannot transfer non Legendary item " + GetDisplayNameOfItem(akSourceContainer, aiItemIndex = Index) + " of base " + GetNthItemBaseObject(akSourceContainer, aiItemIndex = Index) + " at Item Index " + Index + " to " + akDestContainer)
			bSkip = True
		EndIf
		If !bSkip && !IsNthItemPlayable(akSourceContainer, aiItemIndex = Index)
			Debug.TraceUser(LogName, " ------ cannot transfer non Playable item " + GetDisplayNameOfItem(akSourceContainer, aiItemIndex = Index) + " of base " + GetNthItemBaseObject(akSourceContainer, aiItemIndex = Index) + " at Item Index " + Index + " to " + akDestContainer)
			bSkip = True
		EndIf
		If !bSkip && abSkipFavorites && IsNthItemFavorite(akSourceContainer, aiItemIndex = Index)
			Debug.TraceUser(LogName, " ------ cannot transfer Favorite Item " + GetDisplayNameOfItem(akSourceContainer, aiItemIndex = Index) + " of base " + GetNthItemBaseObject(akSourceContainer, aiItemIndex = Index) + " at Item Index " + Index + " to " + akDestContainer)
			bSkip = True
		EndIf
		If !bSkip && abRestrictToFeaturedItems && !IsNthItemFeaturedItem(akSourceContainer, aiItemIndex = Index)
			Debug.TraceUser(LogName, " ------ cannot transfer non Featured Item " + GetDisplayNameOfItem(akSourceContainer, aiItemIndex = Index) + " of base " + GetNthItemBaseObject(akSourceContainer, aiItemIndex = Index) + " at Item Index " + Index + " to " + akDestContainer)
			bSkip = True
		EndIf
		If !bSkip
			Debug.TraceUser(LogName, " +++ transferring Legendary item " + GetDisplayNameOfItem(akSourceContainer, aiItemIndex = Index) + " of base " + GetNthItemBaseObject(akSourceContainer, aiItemIndex = Index) + " at Item Index " + Index + " to " + akDestContainer)
			If RemoveNthItem(akSourceContainer, aiItemIndex = Index, aiCount = -1, akOtherContainer = akDestContainer)
				iTransferredItemCount = iTransferredItemCount + 1
			Else
				Debug.TraceUser(LogName, "ERROR: RemoveNthItem() returned False, item couldn't be transferred.")
			EndIf
		EndIf
		Index = Index - 1
	EndWhile
	Debug.TraceUser(LogName, "Loop finished. Transferred " + iTransferredItemCount + " items. Closing log...")
	Debug.CloseUserLog(LogName)
	If !bInitialPapyrusLogging
		Utility.SetINIBool("bEnableLogging:Papyrus", False)
	EndIf
	If !bInitialPapyrusTrace
		Utility.SetINIBool("bEnableTrace:Papyrus", False)
	EndIf
	Debug.MessageBox(LogName + ": complete. Transferred " + iTransferredItemCount + " items.")
EndFunction
/;



   ; ##### Keyword #####
   ;
   ; # returns 0 or higher if this Anim Face Archetype is not allowed to loop
Int Function GetDontLoopEmotionsIndex(Keyword akKeyword) native global
   ;
   ; # returns the Linkage Name
String Function GetKeywordLinkageName(Keyword akKeyword) native global
   ;
   ; # returns all keywords with the given Keyword Type ( see vanilla Planet.psc for the enum values )
Keyword[] Function GetTypedKeywordArray(Int aeKeywordType) native global
   ;
   ; # returns VehicleKeyword (FExxxx17 from "SFBGS004.esm")
Keyword Function GetVehicleKeyword() native global
   ;
   ; # returns WorkshopItemKeyword ( 00054BA6)
Keyword Function GetWorkshopItemKeyword() native global
   ;
   ; # returns WorkshopKeyword ( 00054BA7)
Keyword Function GetWorkshopKeyword() native global



   ; ##### Math #####
   ;
   ; # returns the natural (base-e) logarithm of afBase
Float Function log(Float afBase) native global
   ;
   ; # returns the base-10 logarithm of afBase
Float Function log10(Float afBase) native global
   ;
   ; # returns the base-2 logarithm of afBase
Float Function log2(Float afBase) native global



   ; ##### MiscObject #####
   ;
Struct ItemComponentData
	Form ItemComponent
	Int iCount
EndStruct
   ;
   ; # returns the components of this misc object
ItemComponentData[] Function GetItemComponents(MiscObject akMiscObject) native global
   ;
   ; # returns true if this misc object is a LooseMod
Bool Function IsLooseMod(MiscObject akMiscObject) native global
   ;
   ; # returns true if this misc object is a Resource item ( i.e. has Resource components )
Bool Function IsResourceItem(MiscObject akMiscObject) native global
   ;
   ; # replaces the item components of this misc object with the components in the specified array
Bool Function SetItemComponents(MiscObject akMiscObject, ItemComponentData[] akItemComponents) native global



   ; ##### ObjectReference #####
   ;
   ; # attaches these references' lights; returns how many refs were processed
Int Function AttachRefLight(ObjectReference[] akReferences) native global
   ;
   ; # copies the inventory items from the source to the target inventory
   ; # ( source and target can't be the same reference )
   ; # ( aiFormTypes must include the target form types )
   ; # ( valid inventory item form types: 48 = Weapon, 34 = Armor, 54 = Aid, 40 = Misc, 57 = Note, 35  = Book, 49 = Ammo, 53 = Key )
Bool Function CopyInventoryItems(ObjectReference akSourceRef, ObjectReference akTargetRef, Int[] aiFormTypes) native global
   ;
   ; # copies all Extra Data from one reference to another
   ; # ( e.g. can be used to copy weapon instance data to another weapon reference of the same weapon base )
Bool Function CopyReferenceExtraData(ObjectReference akSourceRef, ObjectReference akTargetRef) native global
   ;
   ; # creates a reference or more references at the given coordinates of the specified base form then returns them in an array
   ; # if no Cell and WorldSpace is provided, the player's parent cell and worldspace will be used
ObjectReference[] Function CreateReferencesAtCoordinates(Form akBase, int aiCount, float afXPos, float afYPos, float afZPos, float afXAngle, float afYAngle, float afZAngle, Cell akCell = None, WorldSpace akWorldSpace = None, bool abForcePersistent = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true) native global
   ;
   ; # disables these references
Function DisableAll(ObjectReference[] akReferences) native global
   ;
   ; # returns true if this reference's inventory contains at least one Quest Item
Bool Function DoesInventoryContainQuestItem(ObjectReference akReference) native global
   ;
   ; # enables these references
Function EnableAll(ObjectReference[] akReferences, Bool abRecalcInventory = true) native global
   ;
   ; # returns the lowest unused ( and optional non-reserved ) FurnitureMarkerID that is suitable for this actor
Int Function FindUnusedFurnitureMarker(ObjectReference akFurniture, Actor akActor, Bool abIgnoreReserved = False) native global
   ;
   ; # returns the position of this reference's 3D
   ; # ( usually matches the ref's position, unless the ref is AttachTo() another ref )
Float[] Function Get3DPosition(ObjectReference akReference) native global
   ;
Struct AVStorageEntryData
	ActorValue theAV
	Float fCurrentValue
	Float fBaseValue
	Float fModifierTemporary
	Float fModifierPermanent
	Float fModifierDamage
EndStruct
   ;
   ; # returns all Actor Values of this reference
AVStorageEntryData[] Function GetActorValues(ObjectReference akReference) native global
   ;
   ; # returns the Quests whose Quest Aliases this reference is filled into
Quest[] Function GetAliasHolderQuests(ObjectReference akReference) native global
   ;
   ; # returns the Aliases that hold this reference
Alias[] Function GetAliases(ObjectReference akReference) native global
   ;
Struct LinkedRefData
	ObjectReference LinkedRef
	Keyword LinkKeyword
EndStruct
   ;
   ; # returns all linked references
LinkedRefData[] Function GetAllLinkedRefsEx(ObjectReference akReference, Keyword akKeyword = None) native global
   ;
   ; # returns all references linked to this reference
ObjectReference[] Function GetAllRefsLinkedToMe(ObjectReference akReference, Keyword akKeyword = None) native global
LinkedRefData[] Function GetAllRefsLinkedToMeEx(ObjectReference akReference, Keyword akKeyword = None) native global
   ;
   ; # returns the reference akReference is AttachTo
ObjectReference Function GetAttachToRef(ObjectReference akReference) native global
   ;
   ; # returns the current Biome of this reference
Biome Function GetCurrentBiome(ObjectReference akReference) native global
   ;
   ; # calculates the distance between two references ( AstronomicalUnits or AU )
Float Function GetDistanceAstronomicalUnits(ObjectReference akReference, ObjectReference akReference2) native global
   ;
   ; # calculates the distance between a reference and a ( loaded ) planet; optionally measured from the planet surface and not its center
Float Function GetDistanceFromCelestialBody(ObjectReference akReference, Planet akCelestialBody, Bool abSurface = true) native global
   ;
   ; # calculates the distance between two references ( Light Years, Megameter, Parsec )
Float Function GetDistanceGalacticLightYears(ObjectReference akReference, ObjectReference akReference2) native global
Float Function GetDistanceGalacticMegaMeter(ObjectReference akReference, ObjectReference akReference2) native global
Float Function GetDistanceGalacticParsec(ObjectReference akReference, ObjectReference akReference2) native global
   ;
   ; # returns the dropped item reference ( actors can drop a weapon when killed )
ObjectReference Function GetDroppedItemRef(ObjectReference akReference) native global
   ;
   ; # returns this reference's Enable State Parent
ObjectReference Function GetEnableStateParent(ObjectReference akReference) native global
   ;
   ; # returns the actor this furniture marker has been reserved for
Actor Function GetFurnitureMarkerReserver(ObjectReference akFurnitureRef, Int aiMarkerID) native global
   ;
   ; # returns the actor who uses this furniture at the given marker
Actor Function GetFurnitureMarkerUser(ObjectReference akFurnitureRef, Int aiMarkerID) native global
   ;
   ; # returns all marker reserver actors
Actor[] Function GetFurnitureReservers(ObjectReference akFurnitureRef) native global
   ;
   ; # returns all actors using this furniture
Actor[] Function GetFurnitureUsers(ObjectReference akFurnitureRef) native global
   ;
   ; # returns the Grouped Pack-In
PackIn Function GetGroupedPackIn(ObjectReference akReference) native global
   ;
   ; # returns the Keywords of this reference
Keyword[] Function GetKeywords(ObjectReference akReference) native global
   ;
   ; # returns the name of this map marker reference ( as seen in menus )
String Function GetMapMarkerName(ObjectReference akReference) native global
   ;
   ; # returns the OverrideName of a reference, if the reference has any ( if not, returns "" )
String Function GetOverrideName(ObjectReference akReference) native global
   ;
   ; # returns the Persistent Cell of this reference
Cell Function GetPersistentCell(ObjectReference akReference) native global
   ;
   ; # returns Length, Width, Height in a 3 element float array
Float[] Function GetReferenceBounds(ObjectReference akReference) native global
   ;
   ; # returns the reference specified by the reference handle
ObjectReference Function GetReferenceByHandle(Int aiReferenceHandle) native global
   ;
   ; # returns the reference handle
Int Function GetReferenceHandle(ObjectReference akReference) native global
   ;
   ; # returns the Objects Mods attached to this reference
ObjectMod[] Function GetReferenceMods(ObjectReference akReference, bool abExcludeModColls = false) native global
   ;
   ; # returns this reference name ( prefers OverrideName over TESFullName )
String Function GetReferenceName(ObjectReference akReference) native global
   ;
   ; # returns all references in this Cell
ObjectReference[] Function GetReferencesInCell(Cell akCell) native global
   ;
   ; # returns the Source Pack-In
PackIn Function GetSourcePackIn(ObjectReference akReference) native global
   ;
   ; # returns all spaceship parts (Generic Base Forms) attached to this spaceship reference
Form[] Function GetSpaceshipParts(ObjectReference akSpaceshipReference) native global
   ;
   ; # returns the workshop name of this Outpost Beacon or Decorate activator reference
String Function GetWorkshopName(ObjectReference akReference) native global
   ;
   ; # returns true if this references has all specified Papyrus scripts attached to them
Bool Function HasAllVMScripts(ObjectReference akReference, String[] asScriptNames) native global
   ;
   ; # returns true if this reference is 3D loaded and has fully initialized Anim Graph
Bool Function HasAnimGraphManager(ObjectReference akReference) native global
   ;
   ; # returns true if this references has any of the specified Papyrus scripts attached to them
Bool Function HasAnyVMScript(ObjectReference akReference, String[] asScriptNames) native global
   ;
   ; # returns true if any of this furniture's markers have been reserved
   ; # ( markers are reserved for the AI code/pathfinding; e.g. to ensure other actors won't want to travel to a furniture marker which has already been reserved for another actor while sandboxing )
   ; # ( note: the vanilla code doesn't always clear the reserved actor instantly when the actor reaches it and sits in it )
Bool Function HasFurnitureReserver(ObjectReference akFurnitureRef) native global
   ;
   ; # returns true if any actor is using ( usually sitting in ) this furniture
Bool Function HasFurnitureUser(ObjectReference akFurnitureRef) native global
   ;
   ; # returns true if this reference has VehicleKeyword
Bool Function HasVehicleKeyword(ObjectReference akReference) native global
   ;
   ; # returns true if this reference has VehicleSeatKeyword
   ; # ( Actors while sitting in a Land Vehicles have it )
Bool Function HasVehicleSeatKeyword(ObjectReference akReference) native global
   ;
   ; # initializes Havok ( physics ) for this reference
Bool Function InitHavok(ObjectReference akReference, Bool abSkipNavmeshGen = false) native global
   ;
   ; # returns true if this reference is held by any Quest Alias ( faster than GetAliases().Length > 0 )
Bool Function IsAliasedRef(ObjectReference akReference) native global
   ;
   ; # returns true if this reference can be picked by the player ( i.e. can be an inventory item )
Bool Function IsCarryable(ObjectReference akReference) native global
   ;
   ; # returns true if activating the reference in the crosshair would send a Crime event
Bool Function IsCrimeToActivate(ObjectReference akReference) native global
   ;
   ; # returns true if this Flora reference is harvested
Bool Function IsHarvested(ObjectReference akReference) native global
   ;
   ; # returns true if these two references are in the same space
   ; # ( same interior or same exterior worldspace )
Bool Function IsInSameSpace(ObjectReference akReference1, ObjectReference akReference2) native global
   ;
   ; # returns true if this map marker reference is visible on the GalaxyStarMapMenu
Bool Function IsMapMarkerVisibleOnStarMap(ObjectReference akReference) native global
   ;
   ; # returns true if this reference is on the player's homeship
Bool Function IsOnPlayerHomeSpaceship(ObjectReference akReference) native global
   ;
   ; # returns true if the vanilla code considers this reference an Outpost Beacon
Bool Function IsOutpostBeacon(ObjectReference akReference) native global
   ;
   ; # returns true if this reference is a Particle System emitter ( e.g. FXGasVent_01_Neon [REFR:000BDB74] )
Bool Function IsParticleEmitter(ObjectReference akReference) native global
   ;
   ; # returns true if this spaceship is owned by the player
Bool Function IsPlayerOwnedShip(ObjectReference akSpaceshipReference) native global
   ;
   ; # returns true if this reference is part of a spaceship reference
   ; # ( includes exterior and interior structural parts; player placed items do not count )
Bool Function IsSpaceshipPart(ObjectReference akReference) native global
   ;
   ; # returns true if this reference is temporary [T]
Bool Function IsTemporaryReference(ObjectReference akReference) native global
   ;
   ; # returns true if this reference is a Workshop/Outpost Item
Bool Function IsWorkshopItem(ObjectReference akReference) native global
   ;
   ; # moves all references to their Editor Location
Bool Function MoveAllToEditorLocation(ObjectReference[] akReferences) native global
   ;
   ; # requests the vanilla code to open the ContainerMenu
   ; # ( returns true if the request was sent, not if the menu actually opened )
   ; # ( aeContainerMode: 0 = Default, 1 = StealingFromContainer, 2 = Teammate, 3 = Workbench, 4 = PlayerShipTransfer )
   ; # ( if akHomeshipRef is specified, the Homeship will be available for transfer as well )
Bool Function OpenContainerMenu(ObjectReference akContainerRef, Int aeContainerMode = 0, ObjectReference akHomeshipRef = None) native global
   ;
   ; # renames this Outpost Beacon or Decorate activator reference
Bool Function RenameOutpost(ObjectReference akReference, String asName) native global
   ;
   ; # removes this Outpost
Bool Function RemoveOutpost(ObjectReference akOutpostReference) native global
   ;
   ; # remove these references' lights; returns how many refs were processed; note that the vanilla code may reattach them instantly
Int Function RemoveRefLight(ObjectReference[] akReferences, Bool abMagicLight = False) native global
   ;
   ; # resets this reference's inventory
Bool Function ResetInventory(ObjectReference akReference, bool abLeveledOnly, bool abSkipDefaultOutfit) native global
   ;
   ; # sets an OverrideName on this reference
Bool Function SetDisplayName(ObjectReference akReference, String asName) native global
   ;
   ; #  changes the visibility ( i.e. rendered ) state of this reference's 3D
Bool Function SetModelVisible(ObjectReference akReference, bool abVisible) native global
   ;
   ; # flags a reference as temporary [T]; which practically marks the ref to be deleted OnUnload
Function SetTemporaryReference(ObjectReference akReference, bool abSet) native global
   ;
   ; # updates this reference's 3D
Bool Function UpdateReference3D(ObjectReference akReference) native global
   ;
   ; # updates these references' lights; returns how many refs were processed
Int Function UpdateRefLight(ObjectReference[] akReferences) native global



   ; ##### Outfit #####
   ;
   ; # adds a form to this outfit
Bool Function AddToOutfitForms(Outfit akOutfit, Form akFormToAdd) native global
   ;
   ; # returns the forms in this outfit
Form[] Function GetOutfitForms(Outfit akOutfit) native global
   ;
   ; # removes all forms from this outfit
Bool Function RemoveAllOutfitForms(Outfit akOutfit) native global
   ;
   ; # removes the Nth form from this outfit ( enum starts at 0 )
Bool Function RemoveNthOutfitForm(Outfit akOutfit, Int aiIndex) native global
   ;
   ; # removes a form from this outfit
Bool Function RemoveOutfitForm(Outfit akOutfit, Form akFormToRemove) native global



   ; ##### ObjectMod #####
   ;
   ; # returns the Loose Mod ( SF1Edit >> OMOD >> LNAM - Loose Mod )
   ; # even though BGS partially cut Loose Mods during development
MiscObject Function GetLooseMod(ObjectMod akObjectMod) native global
   ;
   ; # returns true is this object mod is Legendary
Bool Function IsLegendaryMod(ObjectMod akObjectMod) native global
   ;
   ; # returns true is this object mod is a Mod Collection
Bool Function IsModCollection(ObjectMod akObjectMod) native global



   ; ##### PackIn #####
   ;
   ; # places all references found in the Pack-In's (editor defined) Cell at the given coordinates and returns the placed references in an array
   ; # Notes:
   ; # 		- it doesn't check how many references are in the Pack-In's Cell, so make sure the Cell doesn't have too many
   ; # 		- all placed references are abForcePersistent = false, abInitiallyDisabled = false, abDeleteWhenAble = true
   ; # 		- it only places the references (it doesn't link them for example even if they have linked refs defined in the editor)
   ;
ObjectReference[] Function PlacePackInAtCoordinates(PackIn akPackIn, float afXCenterPos, float afYCenterPos, float afZCenterPos, float afScale = 1.0) native global
   ;
   ; # returns the Pack-In Cell
Cell Function GetPackInCell(PackIn akPackIn) native global



   ; ##### Persistence #####
   ;
   ; # note: editing persistence is generally not recommended; these are for debug use only
   ;
   ;
   ; # removes a promoter form from this reference's persistence promoter array
Bool Function DemoteReference(ObjectReference akReference, Form akPromoter) native global
   ;
   ; # forces this reference to be persistent / removes forced persistence
   ; # ( you can optionally set abSilent to suppress the Console log feedback )
Bool Function ForcePersistent(ObjectReference akReference, bool abPersistent, bool abSilent = true) native global
   ;
   ; # returns true if the specified form is a persistence promoter of this reference
Bool Function IsPersistencePromotedBy(ObjectReference akReference, Form akForm) native global
   ;
   ; # returns true if the reference with the given HexFormID is persistent ( Console [EP] or [PP] flag )
Int Function IsPersistent(String asHexFormID) native global
   ;
   ; # returns true if the reference with the given HexFormID is Promoted Persistent ( [PP] in Console )
Bool Function IsPromotedPersistent(String asHexFormID) native global
   ;
   ; # promotes this reference to persistent by the specified form
Bool Function PromoteReference(ObjectReference akReference, Form akPromoter) native global



   ; ##### Planet #####
   ;
   ; # navigates to this planet in the GalaxyStarMapMenu; automatically opens the GalaxyStarMapMenu if not opened
Bool Function NavigateToPlanet(Planet akPlanet) native global



   ; ##### Plugin #####
   ;
   ; # returns how many active plugin ( ESM ) files the player has
Int Function GetActivePluginCount() native global
   ;
   ; # returns the names of all active plugins
String[] Function GetActivePlugins() native global
   ;
   ; # returns this plugin's Author Name
String Function GetPluginFileAuthorName(String asPluginName) native global
   ;
   ; # returns the plugin type ( enum: 1 = Full, 2 = Small, 3 = Medium )
Int Function GetPluginType(String asPluginName) native global
   ;
   ; # returns true if the specified ESM is a Full Master
Bool Function IsFullMaster(String asPluginName) native global
   ;
   ; # returns true if the specified ESM is a Medium Master
Bool Function IsMediumMaster(String asPluginName) native global
   ;
   ; # returns true if the specified ESM is a Small Master
Bool Function IsSmallMaster(String asPluginName) native global



   ; ##### Quest #####
   ;
   ; # clears all Quest Aliases
Bool Function ClearAllAliases(Quest akQuest) native global
   ;
   ; # returns true if the Quest Stage Item with the specified IDs has the Complete Quest flag
   ; # ( auiItemID = -1 means "return true if any of the Quest Stage Items of the Quest Stage has this flag )
Bool Function CompletesQuest(Quest akQuest, Int auiStageID, Int auiItemID = -1) native global
   ;
   ; # returns true if the Quest Stage Item with the specified IDs has the Fail Quest flag
   ; # ( auiItemID = -1 means "return true if any of the Quest Stage Items of the Quest Stage has this flag )
Bool Function FailsQuest(Quest akQuest, Int auiStageID, Int auiItemID = -1) native global
   ;
   ; # returns the number of Quest Stage Items the Quest Stage with the specified ID has
Int Function GetQuestStageItemCount(Quest akQuest, Int auiStageID) native global
   ;
   ; # returns all running quests
Quest[] Function GetAllRunningQuests() native global
   ;
   ; # returns all Topics of this quest
Topic[] Function GetAllTopicsByOwnerQuest(Quest akQuest) native global
   ;
   ; # returns all Location Aliases of this quest
LocationAlias[] Function GetLocAliases(Quest akQuest) native global
   ;
   ; # returns all Reference Aliases of this quest
ReferenceAlias[] Function GetRefAliases(Quest akQuest) native global
   ;
   ; # returns all Reference Collection Aliases of this quest
RefCollectionAlias[] Function GetRefColls(Quest akQuest) native global
   ;
   ; # returns true if this quest is flagged as failed
Bool Function IsQuestFailed(Quest akQuest) native global
   ;
   ; # returns true if the Quest Stage with the specified ID has the Run on Start flag
Bool Function IsRunOnStartStage(Quest akQuest, Int auiStageID) native global
   ;
   ; # returns true if the Quest Stage with the specified ID has the Run on Stop flag
Bool Function IsRunOnStopStage(Quest akQuest, Int auiStageID) native global
   ;
   ; # Papyrus version of the SetQuestAliases Console function
Bool Function SetQuestAliases(Quest akQuest) native global
   ;
   ; # sets/unsets this quest's failed flag
   ; # ( returns true if the operation was attempted )
Bool Function SetQuestFailed(Quest akQuest, bool abSet) native global



   ; ##### ReferenceAlias #####
   ;
   ; # returns the actor this RefAlias points to; returns None if the RefAlias is empty or doesn't point to an actor
Actor Function GetActorReference(ReferenceAlias akRefAlias) native global



   ; ##### RefCollectionAlias #####
   ;
   ; # adds all references to this RefColl
Bool Function AddRefsToRefColl(ObjectReference[] akReferences, RefCollectionAlias akRefCollectionAlias) native global



   ; ##### Sorter functions #####
   ;
   ; # Allows you to sort arrays of references by Condition Forms.
   ; # Internally, Cassiopiea calls native ConditionForm.IsTrue for each ref.
   ; # You can pass None to akTargetReferences if the conditions in your Condition Forms don't need a target ref.
   ; # (Most conditions don't need a target ref, an exception could be GetInSameCell).
   ; # However, if you'd like to specify target refs, it is important that the two arrays must have the same size so the code can determine which target ref belongs to which subject ref.
ObjectReference[] Function SortReferencesByConditions(ObjectReference[] akSubjectReferences, ObjectReference[] akTargetReferences, ConditionForm[] akConditionForms, bool abConjuntive) native global
   ;
   ; # additional sorter functions
ObjectReference[] Function SortReferencesByDeleted(ObjectReference[] akReferences, bool abRemoveDeleted) native global
ObjectReference[] Function SortReferencesByDistance(ObjectReference[] akReferences, float afDistance, bool abCloserThan) native global
ObjectReference[] Function SortReferencesByKeywords(ObjectReference[] akReferences, Keyword[] akKeywords, bool abMustHaveAll) native global
ObjectReference[] Function SortReferencesByName(ObjectReference[] akReferences, String asName, bool abExactMatch, bool abReversed) native global
ObjectReference[] Function SortReferencesByReferenceArray(ObjectReference[] akSubjectReferences, ObjectReference[] akTargetReferences, bool abReversed) native global



   ; ##### Spaceship Reference #####
   ;
Struct BlueprintData
	Float fPosX
	Float fPosY
	Float fPosZ
	Float fRotX
	Float fRotY
	Float fRotZ
	Int iPartID
	Form PartBase
EndStruct
   ;
   ; # returns this spaceship's Blueprints
BlueprintData[] Function GetSpaceshipBlueprints(ObjectReference akSpaceshipReference) native global
   ;
Struct SpaceshipCellData
	Cell theCell
	PackIn thePackIn
EndStruct
   ;
   ; # returns this spaceship's Interiors and Exteriors
SpaceshipCellData[] Function GetSpaceshipLinkedInteriors(ObjectReference akSpaceshipReference) native global
SpaceshipCellData[] Function GetSpaceshipLinkedExteriors(ObjectReference akSpaceshipReference) native global
   ;
   ; # example function to log all spaceship modules
   ;
   ;/
Function LogSpaceshipModules(ObjectReference akSpaceshipRef) Global
	If !akSpaceshipRef
		akSpaceshipRef = Game.GetPlayerHomeSpaceship()
	EndIf
	If !akSpaceshipRef
		Debug.MessageBox("ERROR: akSpaceshipRef is None")
		Return None
	EndIf
	String LogName = "LogSpaceshipModules"
	BlueprintData[] TheArray = GetSpaceshipBlueprints(akSpaceshipRef)
	Bool bInitialPapyrusLogging = GetINISettingBool("bEnableLogging:Papyrus")
	Bool bInitialPapyrusTrace = GetINISettingBool("bEnableTrace:Papyrus")
	Utility.SetINIBool("bEnableLogging:Papyrus", True)
	Utility.SetINIBool("bEnableTrace:Papyrus", True)
	Debug.OpenUserLog(LogName)
	Debug.TraceUser(LogName, "Beginning to loop " + TheArray.Length + " elements")
	Int Index = 0
	While Index < TheArray.Length
		;
		Debug.TraceUser(LogName, Index + " | fPosX: " + TheArray[Index].fPosX)
		Debug.TraceUser(LogName, Index + " | fPosY: " + TheArray[Index].fPosY)
		Debug.TraceUser(LogName, Index + " | fPosZ: " + TheArray[Index].fPosZ)
		Debug.TraceUser(LogName, Index + " | fRotX: " + TheArray[Index].fRotX)
		Debug.TraceUser(LogName, Index + " | fRotY: " + TheArray[Index].fRotY)
		Debug.TraceUser(LogName, Index + " | fRotZ: " + TheArray[Index].fRotZ)
		Debug.TraceUser(LogName, Index + " | iPartID: " + TheArray[Index].iPartID)
		Debug.TraceUser(LogName, Index + " | PartBase: " + TheArray[Index].PartBase)
		;
		If TheArray[Index].PartBase
			FormLinkData[] FormLinks = GetFormLinks(TheArray[Index].PartBase)
			Int Index0 = 0
			While Index0 < FormLinks.Length
				;
				Cell PackInCell = None
				If FormLinks[Index0].LinkedForm as PackIn
					PackInCell = GetPackInCell(FormLinks[Index0].LinkedForm as PackIn)
					If PackInCell
						Debug.TraceUser(LogName, "     " + Index0 + " | LinkedForm: " + FormLinks[Index0].LinkedForm + " (Pack-In Cell --> " + PackInCell + ")")
					EndIf
				EndIf
				If !PackInCell
					Debug.TraceUser(LogName, "     " + Index0 + " | LinkedForm: " + FormLinks[Index0].LinkedForm)
				EndIf
				;
				Debug.TraceUser(LogName, "     " + Index0 + " | LinkKeyword: " + FormLinks[Index0].LinkKeyword)
				Index0 = Index0 + 1
			EndWhile
		EndIf
		;
		Index = Index + 1
	EndWhile
	Debug.TraceUser(LogName, "Loop finished. Closing log...")
	Debug.CloseUserLog(LogName)
	If !bInitialPapyrusLogging
		Utility.SetINIBool("bEnableLogging:Papyrus", False)
	EndIf
	If !bInitialPapyrusTrace
		Utility.SetINIBool("bEnableTrace:Papyrus", False)
	EndIf
	Debug.MessageBox(LogName + ": complete. Processed " + TheArray.Length + " elements in TheArray.")
EndFunction
   /;



   ; ##### Spell #####
   ;
   ; # plays the equip sound of this Spell ( e.g. the power effect sound when changing the equipped Power in DataMenu >> PowersMenu )
Bool Function PlaySpellEquipSound(Spell akSpell) native global



   ; ##### TimeStamp #####
   ;
   ;
   ; # Time Stamps can be used to measure real-time, they're mostly for profiling purposes.
   ; # Once a Time Stamp is generated with GenerateTimeStamp,
   ; # GetElapsedTimeSinceTimeStamp can return how many seconds passed since the Time Stamp was generated.
   ; # A previously generated Time Stamp can be renewed with RenewTimeStamp.
   ; # A Time Stamp exists (IsTimeStampValid) as long as the player doesn't exit the game.
   ; # Exiting back to the Main Menu or loading the same or another save game doesn't remove the Time Stamp.
   ; # The generated Time Stamp's ID (aiTimeStamp) is a unique, random int32_t number.
   ;
   ;
   ; # generates a Time Stamp and returns its ID
Int Function GenerateTimeStamp() native global
   ;
   ; # returned how many seconds passed since the Time Stamp was generated (or renewed, see below)
Float Function GetElapsedTimeSinceTimeStamp(Int aiTimeStamp) native global
   ;
   ; # returns the Time Stamp as string
String Function GetTimeStampAsString(Int aiTimeStamp) native global
   ;
   ; # returns true if the Time Stamp with the given ID exists
Bool Function IsTimeStampValid(Int aiTimeStamp) native global
   ;
   ; # renews the Time Stamp
Bool Function RenewTimeStamp(Int aiTimeStamp) native global



   ; ##### Topic #####
   ;
   ; make sure the owner quest IsRunning()
   ;
   ;
   ; # returns all Topic Infos in this Topic
TopicInfo[] Function GetAllTopicInfos(Topic akTopic) native global
   ;
   ; # returns how many Topic Infos are in this Topic ( much faster than GetAllTopicInfos().Length )
Int Function GetNumTopicInfos(Topic akTopic) native global



   ; ##### TopicInfo #####
   ;
   ; make sure the owner quest IsRunning()
   ;
   ;
   ; # returns the Anim Face Archetype keyword of the nth Topic Info
Keyword Function GetNthResponseAnimFaceArchetype(TopicInfo akTopicInfo, Int aiResponseIndex, Bool abGetLast = false) native global
   ; 
   ; # returns the Response Text of the nth Topic Info; if abGetLast = true it ignores aiResponseIndex and returns the last Response Text
String Function GetNthResponseText(TopicInfo akTopicInfo, Int aiResponseIndex, Bool abGetLast = false) native global



   ; ##### UI #####
   ;
   ; # closes this menu
Bool Function CloseMenu(String asMenuName) native global
   ;
   ; # returns the value of this AS3 variable as string
   ;     examples:
   ;         string menu = "Console"
   ;         string var = "root1.AnimHolder_mc.Menu_mc.CurrentSelection.text"
   ;       the selected Console reference text
   ;         string menu = "PhotoModeMenu"
   ;         string var = "root1.Menu_mc.PanelContainer_mc.SettingsList_mc.EntryHolder_mc.Entry0.Stepper_mc.textField.text"
   ;       the first entry in the Photo Mode menu ( HUD ) ( e.g. "Free" in the Camera Type tab, Photo Mode Actor's name in Character, etc.)
   ;         string menu = "PhotoModeMenu"
   ;         string var = "root1.Menu_mc.PanelContainer_mc.SettingsList_mc.EntryHolder_mc.Entry2.currentFrame"
   ;       the current frame of the third entry ( i.e. 2 = selected entry )
   ;         string menu = "WeaponsCraftingMenu"
   ;         string var = "root1.Menu_mc.ModsDirectory_mc.ModsList_mc.EntryHolder_mc.Entry0.Installed_mc.visible"
   ;       returns whether the MovieClp property visible is true or not ( i.e. whether the mod in the first entry is installed )
String Function GetAS3VariableAsString(String asMenuName, String asVarPath) native global
   ;
   ; # ContainerMenu: returns the container menu mode ( -1 = Error/Unknown, 0 = My Inventory, 1 = Homeship, 2 = Container )
Int Function GetContainerMenuMode() native global
   ;
   ; # ContainerMenu: returns the base form of the currently selected/viewed item
Form Function GetContainerMenuSelectedItem() native global
   ;
   ; # ContainerMenu: returns the target container reference ( e.g. the companion actor when trading with a companion )
ObjectReference Function GetContainerMenuTarget() native global
   ;
   ; # returns true if this menu is open
Bool Function IsMenuOpen(String asMenuName) native global
   ;
   ; # returns true if any of the specified menus are open
Bool Function IsMenuOpenAny(String[] asMenuNames) native global
   ;
   ; # returns true if all of the specified menus are open
Bool Function IsMenuOpenAll(String[] asMenuNames) native global
   ;
   ; # opens a menu
   ; # ( note that only a few menus like the Console can be opened this way )
Bool Function OpenMenu(String asMenuName) native global
   ;
   ; # changes the value of this AS3 variable
   ; # e.g. to set the Local Time to 12:30, SetAS3Variable("DataMenu", "root1.Menu_mc.ClockWidget_mc.LocalTime_tf.text", "12:30")
   ; # boolean and arrays are not implemented yet
Bool Function SetAS3Variable(String asMenuName, String asVarPath, String asNewValue) native global
   ;
   ; # suppresses HUD notifications ( e.g. item added, Quicksaving... )
Bool Function SuppressHUDNotifications(bool abSuppress = true) native global



   ; ##### Utility #####
   ;
   ; # returns true if this command is registered in the Console
   ; # ( asCommand can be both the long command name like "EvaluatePackage" and the short name like "EVP" )
Bool Function DoesConsoleCommandExist(String asCommand) native global
   ;
   ; # returns true if the given file exist ( use like asFilePath = ".\\Data\\SFSE\\"; asFileName="MyFile.txt" )
Bool Function DoesFileExist(String asFilePath, String asFileName) native global
   ;
   ; # returns true if this folder exists
Bool Function DoesFolderExist(String asFolderPath) native global
   ;
   ; # erase
   ; # ( e.g. asInput="string", aiOffset=2, aiCount=3, would return "stg" )
String Function EraseStr(String asInput, Int aiOffset, Int aiCount) native global
   ;
   ; # executes Console Commands
Int Function ExecuteCommands(String[] asCommands) native global
   ;
   ; # export all existing or an array of forms to a file
   ;
   ; # ( line example "|16E2C6|Starfield.esm" --> FormID without Load Order prefix followed by the Source Plugin)
   ; # ( asFilePath and asFileName must be specified )
   ; Return values:
   ; -6, -5, -4: file could not be created or opened
   ; -3: previous file count not be deleted
   ; -2: file already exists and abOverwriteFileIfExists is False
   ; -1: asFilePath or asFileName is empty
   ; 0 and higher: the number of exported forms
   ;/
	Function test_ExportFormsToFileOfPlayerParentCellRefs(bool abOverwriteFileIfExists = False) global
		String asFilePath = ".\\Data\\SFSE\\"
		String asFileName = "ExportFormsToFile.txt"
		Debug.MessageBox("ExportFormsToFile = " + ExportFormsToFile(GetReferencesInCell(Game.GetPlayer().GetParentCell()) as Form[], asFilePath, asFileName, abOverwriteFileIfExists))
	EndFunction
   /;
   ;
Int Function ExportAllFormsToFile(String asFilePath, String asFileName, bool abOverwriteFileIfExists = False) native global
Int Function ExportFormsToFile(Form[] akForms, String asFilePath, String asFileName, bool abOverwriteFileIfExists = False) native global
   ;
   ; # attempts to find asToFind in asInput; if found, returns its position
Int Function FindStr(String asInput, String asToFind) native global
   ;
   ; # returns the character at the given offset
String Function GetCharAt(String asInput, Int aiOffset) native global
   ;
   ; # returns the size of the file at the given file path in Kilobytes
   ; # example: fResult = GetFileSizeKB(asFilePath = ".\\Data\\SFSE\\Plugins\\", asFileName = "CassiopeiaPapyrusExtender.dll")
Float Function GetFileSizeKB(String asFilePath, String asFileName) native global
   ;
   ; # converts formtype from int to string (e.g. 4 to "KYWD")
String Function GetFormTypeIntAsStr(Int aiFormType) native global
   ;
   ; # converts formtype from string to int
Int Function GetFormTypeStrAsInt(String asFormType) native global
   ;
   ; # as it is more convenient than ( IntToHex(akForm.GetFormID()) )
String Function GetHexFormID(Form akForm) native global
   ;
   ; # returns the GPU memory usage percent of Starfield ( total available / Starfield )
Float Function GetStarfieldGPUMemoryUsagePercent() native global
   ;
   ; # returns the GPU memory size ( in megabytes )
Float Function GetTotalGPUMemory() native global
   ;
   ; # returns the total GPU memory usage percent
Float Function GetTotalGPUMemoryUsagePercent() native global
   ;
   ; # convert hex to int
Int Function HexToInt(String asHexString) native global
   ;
   ; # merges an array of strings
String Function MergeStr(String[] asInput) native global
   ;
   ; # reads HexFormIDs from a file
   ; # ( see ExportFormsToFile and ExportAllFormsToFile for the supported format )
   ; # ( aiMaxFormsToRead: the returned array cannot be larger than this value; -1 means limitless; default is INT16_MAX: 32767 )
String[] Function ReadHexFormIDsFromFile(String asFilePath, String asFileName, Int aiMaxFormsToRead = 32767, Bool abReturnEmptyArrayIfMaxFormsExceeded = True) native global
   ;
   ; # reads forms from a file
   ; # ( akFilter: can be used to filter the read forms; works with references only; Subject of the Condition Form is the read reference )
Form[] Function ReadFormsFromFile(String asFilePath, String asFileName, ConditionForm akFilter = None, Int aiMaxFormsToRead = 32767, Bool abReturnEmptyArrayIfMaxFormsExceeded = True) native global
   ;
   ; # replaces the string sFrom found in the input string with asTo
   ; # ( the returned string will be all lowercase; see ReplaceStrKC )
String Function ReplaceStr(String asInput, String asFrom, String asTo) native global
   ;
   ; # skips converting the result string to lowercase
String Function ReplaceStrKC(String asInput, String asFrom, String asTo) native global
   ;
   ; # splits a string ( e.g. asInput="string", asDelim="ri", would return String[0]="st", String[1]="ng" )
   ; # ( the returned strings will be all lowercase; see SplitStrKC )
String[] Function SplitStr(String asInput, String asDelim) native global
   ;
   ; # skips converting the result string to lowercase
String[] Function SplitStrKC(String asInput, String asDelim) native global
   ;
   ; # subtr
   ; # ( e.g. asInput="string", aiOffset=2, aiCount=3, would return "rin" )
String Function SubStr(String asInput, Int aiOffset, Int aiCount) native global



   ; ##### Version #####
   ;
   ; # returns the version of Cassiopeia ( e.g. v1.2 is 12, v2.0 is 20 )
Int Function GetCassiopeiaPapyrusExtenderVersion() native global
   ;
   ; # returns the SFSE version as Int ( e.g. 2120 for v0.2.12.0 )
Int Function GetSFSEVersionAsInt() native global
   ;
   ; # returns the SFSE version as String ( e.g. "0.2.12.0" for v0.2.12.0 )
String Function GetSFSEVersionAsString() native global
   ;
   ; # returns Starfield version as Int ( e.g. 113610 for v1.13.61 )
Int Function GetStarfieldVersionAsInt() native global
   ;
   ; # returns Starfield version as String ( e.g. "1.13.61.0" for v1.13.61 )
String Function GetStarfieldVersionAsString() native global



   ; ##### Dev #####
   ;
   ; # for development only
   ;
   ; # returns the size of the AllFormsMap
String Function GetAllFormsMapSize() native global
   ;
   ; # retrieves the thread ID of the calling thread
Int Function GetCallingThreadID() native global
   ;
   ; # retrieves the thread name of the calling thread
String Function GetCallingThreadName() native global
   ;
   ; # prints the AllFormsMap to a file
Function PrintAllFormsMapToFile() native global
   ;
   ; # releases all attached Papyrus script objects
Bool Function ReleasePapyrusObjects(String asHexFormID) native global
   ;
   ; # releases all attached Papyrus script objects; returns how many forms were processed
Int Function ReleasePapyrusObjectsArray(String[] asHexFormIDs) native global









