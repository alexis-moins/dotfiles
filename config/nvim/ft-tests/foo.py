class Foo:
    """A class representing a foo"""

    def __init__(self, name: str) -> None:
        """Parameterised constructor creating a new Foo"""
        self._names: list[str] = [ name ]

    def identity(self) -> None:
        """Display the identity of the current foo"""
        print(', '.join(self._names))
