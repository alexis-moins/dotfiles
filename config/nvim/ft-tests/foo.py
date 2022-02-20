class Foo:
    """A class representing a foo"""

    def __init__(self, name: str):
        """cccas"""
        self._name: str = name

    def attack(self) -> int:
        """Return the attack value of the current """
        attack = 0
        for item in self._inventory.equiped_items.values():
            if 'attack' in item.statistics.keys():
                attack += item.statistics['attack']
        return attack
