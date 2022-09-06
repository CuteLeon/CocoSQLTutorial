using DummyDatabaseTool.Generators;
using DummyDatabaseTool.Models;

namespace DummyDatabaseTool.Fakers
{
    internal class ClassRoomGenerator : GeneratorBase<ClassRooms>
    {
        public int ClassRoomID { get; set; }

        public string Address { get; set; }

        public override IEnumerable<ClassRooms> Generate()
        {
            return default;
        }
    }
}
