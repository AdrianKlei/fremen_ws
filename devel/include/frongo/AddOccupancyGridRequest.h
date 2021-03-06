// Generated by gencpp from file frongo/AddOccupancyGridRequest.msg
// DO NOT EDIT!


#ifndef FRONGO_MESSAGE_ADDOCCUPANCYGRIDREQUEST_H
#define FRONGO_MESSAGE_ADDOCCUPANCYGRIDREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace frongo
{
template <class ContainerAllocator>
struct AddOccupancyGridRequest_
{
  typedef AddOccupancyGridRequest_<ContainerAllocator> Type;

  AddOccupancyGridRequest_()
    : specifications_file()  {
    }
  AddOccupancyGridRequest_(const ContainerAllocator& _alloc)
    : specifications_file(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _specifications_file_type;
  _specifications_file_type specifications_file;





  typedef boost::shared_ptr< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> const> ConstPtr;

}; // struct AddOccupancyGridRequest_

typedef ::frongo::AddOccupancyGridRequest_<std::allocator<void> > AddOccupancyGridRequest;

typedef boost::shared_ptr< ::frongo::AddOccupancyGridRequest > AddOccupancyGridRequestPtr;
typedef boost::shared_ptr< ::frongo::AddOccupancyGridRequest const> AddOccupancyGridRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::frongo::AddOccupancyGridRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace frongo

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3f380ed868f85299f5d2c3f2c5a17099";
  }

  static const char* value(const ::frongo::AddOccupancyGridRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3f380ed868f85299ULL;
  static const uint64_t static_value2 = 0xf5d2c3f2c5a17099ULL;
};

template<class ContainerAllocator>
struct DataType< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "frongo/AddOccupancyGridRequest";
  }

  static const char* value(const ::frongo::AddOccupancyGridRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string specifications_file\n\
";
  }

  static const char* value(const ::frongo::AddOccupancyGridRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.specifications_file);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AddOccupancyGridRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::frongo::AddOccupancyGridRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::frongo::AddOccupancyGridRequest_<ContainerAllocator>& v)
  {
    s << indent << "specifications_file: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.specifications_file);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRONGO_MESSAGE_ADDOCCUPANCYGRIDREQUEST_H
