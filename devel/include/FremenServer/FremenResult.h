// Generated by gencpp from file FremenServer/FremenResult.msg
// DO NOT EDIT!


#ifndef FREMENSERVER_MESSAGE_FREMENRESULT_H
#define FREMENSERVER_MESSAGE_FREMENRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace FremenServer
{
template <class ContainerAllocator>
struct FremenResult_
{
  typedef FremenResult_<ContainerAllocator> Type;

  FremenResult_()
    : success(0)
    , message()
    , probabilities()
    , entropies()
    , errors()
    , anomalyTimes()
    , anomalyValues()  {
    }
  FremenResult_(const ContainerAllocator& _alloc)
    : success(0)
    , message(_alloc)
    , probabilities(_alloc)
    , entropies(_alloc)
    , errors(_alloc)
    , anomalyTimes(_alloc)
    , anomalyValues(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _success_type;
  _success_type success;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _message_type;
  _message_type message;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _probabilities_type;
  _probabilities_type probabilities;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _entropies_type;
  _entropies_type entropies;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _errors_type;
  _errors_type errors;

   typedef std::vector<uint32_t, typename ContainerAllocator::template rebind<uint32_t>::other >  _anomalyTimes_type;
  _anomalyTimes_type anomalyTimes;

   typedef std::vector<uint32_t, typename ContainerAllocator::template rebind<uint32_t>::other >  _anomalyValues_type;
  _anomalyValues_type anomalyValues;





  typedef boost::shared_ptr< ::FremenServer::FremenResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::FremenServer::FremenResult_<ContainerAllocator> const> ConstPtr;

}; // struct FremenResult_

typedef ::FremenServer::FremenResult_<std::allocator<void> > FremenResult;

typedef boost::shared_ptr< ::FremenServer::FremenResult > FremenResultPtr;
typedef boost::shared_ptr< ::FremenServer::FremenResult const> FremenResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::FremenServer::FremenResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::FremenServer::FremenResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace FremenServer

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'FremenServer': ['/home/adrian/test_ws/devel/share/FremenServer/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::FremenServer::FremenResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::FremenServer::FremenResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::FremenServer::FremenResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::FremenServer::FremenResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::FremenServer::FremenResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::FremenServer::FremenResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::FremenServer::FremenResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c4d21afc2fe08d781143d26587909bbe";
  }

  static const char* value(const ::FremenServer::FremenResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc4d21afc2fe08d78ULL;
  static const uint64_t static_value2 = 0x1143d26587909bbeULL;
};

template<class ContainerAllocator>
struct DataType< ::FremenServer::FremenResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "FremenServer/FremenResult";
  }

  static const char* value(const ::FremenServer::FremenResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::FremenServer::FremenResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#result definition\n\
int32 success		#action result - positive value indicates success, negative indicates error\n\
string message 		#detailed message\n\
float32[] probabilities	#probabilities of the states calculated by the 'predict' action for the particular 'times', probability of a given observation for the 'detect' action\n\
float32[] entropies	#entropies of the states calculated by the 'entropy' action for the particular 'times'\n\
float32[] errors 	#prediction errors for the various model orders given by the 'evaluate' action\n\
uint32[]  anomalyTimes 	#the time instants of detected anomalies \n\
uint32[]  anomalyValues	#the observed anomaous states \n\
";
  }

  static const char* value(const ::FremenServer::FremenResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::FremenServer::FremenResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
      stream.next(m.message);
      stream.next(m.probabilities);
      stream.next(m.entropies);
      stream.next(m.errors);
      stream.next(m.anomalyTimes);
      stream.next(m.anomalyValues);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FremenResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::FremenServer::FremenResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::FremenServer::FremenResult_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<int32_t>::stream(s, indent + "  ", v.success);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.message);
    s << indent << "probabilities[]" << std::endl;
    for (size_t i = 0; i < v.probabilities.size(); ++i)
    {
      s << indent << "  probabilities[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.probabilities[i]);
    }
    s << indent << "entropies[]" << std::endl;
    for (size_t i = 0; i < v.entropies.size(); ++i)
    {
      s << indent << "  entropies[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.entropies[i]);
    }
    s << indent << "errors[]" << std::endl;
    for (size_t i = 0; i < v.errors.size(); ++i)
    {
      s << indent << "  errors[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.errors[i]);
    }
    s << indent << "anomalyTimes[]" << std::endl;
    for (size_t i = 0; i < v.anomalyTimes.size(); ++i)
    {
      s << indent << "  anomalyTimes[" << i << "]: ";
      Printer<uint32_t>::stream(s, indent + "  ", v.anomalyTimes[i]);
    }
    s << indent << "anomalyValues[]" << std::endl;
    for (size_t i = 0; i < v.anomalyValues.size(); ++i)
    {
      s << indent << "  anomalyValues[" << i << "]: ";
      Printer<uint32_t>::stream(s, indent + "  ", v.anomalyValues[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // FREMENSERVER_MESSAGE_FREMENRESULT_H