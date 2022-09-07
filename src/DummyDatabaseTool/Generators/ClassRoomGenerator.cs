using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Generators
{
    internal class ClassRoomGenerator : GeneratorBase<ClassRooms>
    {
        public int ClassRoomID { get; set; }

        public string Address { get; set; }

        public override IEnumerable<ClassRooms> Generate()
        {
            return Enumerable.Range(1, 4)
                .SelectMany(y => Enumerable.Range(1, 5)
                    .Select(x => new ClassRooms()
                    {
                        ClassRoomID = 5 * (y - 1) + x,
                        Address = $"Floor {y}, Room {x}"
                    }));
        }
    }
}
