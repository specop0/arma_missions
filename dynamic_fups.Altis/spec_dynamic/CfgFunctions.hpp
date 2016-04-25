class Spec_dynamic {
    tag = "Spec_dynamic";
    class init {
        file="spec_dynamic";
        class addControlActions {};
        class cleanUp {};
        class initCityList { postInit = 1; };
        class selectCity {};
        class selectEnemy { preInit = 1; };
    };
};
