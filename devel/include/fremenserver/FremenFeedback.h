// Generated by gencpp from file fremenserver/FremenFeedback.msg
// DO NOT EDIT!


#ifndef FREMENSERVER_MESSAGE_FREMENFEEDBACK_H
#define FREMENSERVER_MESSAGE_FREMENFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace fremenserver
{
template <class ContainerAllocator>
struct FremenFeedback_
{
  typedef FremenFeedback_<ContainerAllocator> Type;

  FremenFeedback_()
    : status()  {
    }
  FremenFeedback_(const ContainerAllocator& _alloc)
    : status(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::fremenserver::FremenFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::fremenserver::FremenFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct FremenFeedback_

typedef ::fremenserver::FremenFeedback_<std::allocator<void> > FremenFeedback;

typedef boost::shared_ptr< ::fremenserver::FremenFeedback > FremenFeedbackPtr;
typedef boost::shared_ptr< ::fremenserver::FremenFeedback const> FremenFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::fremenserver::FremenFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::fremenserver::FremenFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace fremenserver

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'fremenserver': ['/home/adrian/test_ws/devel/share/fremenserver/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::fremenserver::FremenFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::fremenserver::FremenFeedback_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fremenserver::FremenFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fremenserver::FremenFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fremenserver::FremenFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fremenserver::FremenFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::fremenserver::FremenFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4fe5af303955c287688e7347e9b00278";
  }

  static const char* value(const ::fremenserver::FremenFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4fe5af303955c287ULL;
  static const uint64_t static_value2 = 0x688e7347e9b00278ULL;
};

template<class ContainerAllocator>
struct DataType< ::fremenserver::FremenFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fremenserver/FremenFeedback";
  }

  static const char* value(const ::fremenserver::FremenFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::fremenserver::FremenFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#feedback\n\
string status\n\
\n\
";
  }

  static const char* value(const ::fremenserver::FremenFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::fremenserver::FremenFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FremenFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::fremenserver::FremenFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::fremenserver::FremenFeedback_<ContainerAllocator>& v)
  {
    s << indent << "status: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FREMENSERVER_MESSAGE_FREMENFEEDBACK_H