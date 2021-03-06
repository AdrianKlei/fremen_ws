// Generated by gencpp from file frongo/GraphModelResponse.msg
// DO NOT EDIT!


#ifndef FRONGO_MESSAGE_GRAPHMODELRESPONSE_H
#define FRONGO_MESSAGE_GRAPHMODELRESPONSE_H


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
struct GraphModelResponse_
{
  typedef GraphModelResponse_<ContainerAllocator> Type;

  GraphModelResponse_()
    : filename()  {
    }
  GraphModelResponse_(const ContainerAllocator& _alloc)
    : filename(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _filename_type;
  _filename_type filename;





  typedef boost::shared_ptr< ::frongo::GraphModelResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::frongo::GraphModelResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GraphModelResponse_

typedef ::frongo::GraphModelResponse_<std::allocator<void> > GraphModelResponse;

typedef boost::shared_ptr< ::frongo::GraphModelResponse > GraphModelResponsePtr;
typedef boost::shared_ptr< ::frongo::GraphModelResponse const> GraphModelResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::frongo::GraphModelResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::frongo::GraphModelResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::frongo::GraphModelResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::frongo::GraphModelResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::frongo::GraphModelResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::frongo::GraphModelResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::frongo::GraphModelResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::frongo::GraphModelResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::frongo::GraphModelResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "030824f52a0628ead956fb9d67e66ae9";
  }

  static const char* value(const ::frongo::GraphModelResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x030824f52a0628eaULL;
  static const uint64_t static_value2 = 0xd956fb9d67e66ae9ULL;
};

template<class ContainerAllocator>
struct DataType< ::frongo::GraphModelResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "frongo/GraphModelResponse";
  }

  static const char* value(const ::frongo::GraphModelResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::frongo::GraphModelResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string filename\n\
\n\
";
  }

  static const char* value(const ::frongo::GraphModelResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::frongo::GraphModelResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.filename);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GraphModelResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::frongo::GraphModelResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::frongo::GraphModelResponse_<ContainerAllocator>& v)
  {
    s << indent << "filename: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.filename);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRONGO_MESSAGE_GRAPHMODELRESPONSE_H
