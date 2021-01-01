// Generated by gencpp from file frongo/SaveGridRequest.msg
// DO NOT EDIT!


#ifndef FRONGO_MESSAGE_SAVEGRIDREQUEST_H
#define FRONGO_MESSAGE_SAVEGRIDREQUEST_H


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
struct SaveGridRequest_
{
  typedef SaveGridRequest_<ContainerAllocator> Type;

  SaveGridRequest_()
    : grid_name()  {
    }
  SaveGridRequest_(const ContainerAllocator& _alloc)
    : grid_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _grid_name_type;
  _grid_name_type grid_name;





  typedef boost::shared_ptr< ::frongo::SaveGridRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::frongo::SaveGridRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SaveGridRequest_

typedef ::frongo::SaveGridRequest_<std::allocator<void> > SaveGridRequest;

typedef boost::shared_ptr< ::frongo::SaveGridRequest > SaveGridRequestPtr;
typedef boost::shared_ptr< ::frongo::SaveGridRequest const> SaveGridRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::frongo::SaveGridRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::frongo::SaveGridRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::frongo::SaveGridRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::frongo::SaveGridRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::frongo::SaveGridRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::frongo::SaveGridRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::frongo::SaveGridRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::frongo::SaveGridRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::frongo::SaveGridRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bc567f7c16280c57bc13a5f26eb3e4e7";
  }

  static const char* value(const ::frongo::SaveGridRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbc567f7c16280c57ULL;
  static const uint64_t static_value2 = 0xbc13a5f26eb3e4e7ULL;
};

template<class ContainerAllocator>
struct DataType< ::frongo::SaveGridRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "frongo/SaveGridRequest";
  }

  static const char* value(const ::frongo::SaveGridRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::frongo::SaveGridRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string grid_name\n\
";
  }

  static const char* value(const ::frongo::SaveGridRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::frongo::SaveGridRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.grid_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SaveGridRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::frongo::SaveGridRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::frongo::SaveGridRequest_<ContainerAllocator>& v)
  {
    s << indent << "grid_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.grid_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRONGO_MESSAGE_SAVEGRIDREQUEST_H
