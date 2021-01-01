// Generated by gencpp from file fremenserver/FremenGoal.msg
// DO NOT EDIT!


#ifndef FREMENSERVER_MESSAGE_FREMENGOAL_H
#define FREMENSERVER_MESSAGE_FREMENGOAL_H


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
struct FremenGoal_
{
  typedef FremenGoal_<ContainerAllocator> Type;

  FremenGoal_()
    : operation()
    , id()
    , ids()
    , times()
    , order(0)
    , orders()
    , states()
    , values()
    , confidence(0.0)
    , periods()
    , amplitudes()
    , phases()  {
    }
  FremenGoal_(const ContainerAllocator& _alloc)
    : operation(_alloc)
    , id(_alloc)
    , ids(_alloc)
    , times(_alloc)
    , order(0)
    , orders(_alloc)
    , states(_alloc)
    , values(_alloc)
    , confidence(0.0)
    , periods(_alloc)
    , amplitudes(_alloc)
    , phases(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _operation_type;
  _operation_type operation;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _id_type;
  _id_type id;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _ids_type;
  _ids_type ids;

   typedef std::vector<uint32_t, typename ContainerAllocator::template rebind<uint32_t>::other >  _times_type;
  _times_type times;

   typedef int32_t _order_type;
  _order_type order;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _orders_type;
  _orders_type orders;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _states_type;
  _states_type states;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _values_type;
  _values_type values;

   typedef float _confidence_type;
  _confidence_type confidence;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _periods_type;
  _periods_type periods;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _amplitudes_type;
  _amplitudes_type amplitudes;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _phases_type;
  _phases_type phases;





  typedef boost::shared_ptr< ::fremenserver::FremenGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::fremenserver::FremenGoal_<ContainerAllocator> const> ConstPtr;

}; // struct FremenGoal_

typedef ::fremenserver::FremenGoal_<std::allocator<void> > FremenGoal;

typedef boost::shared_ptr< ::fremenserver::FremenGoal > FremenGoalPtr;
typedef boost::shared_ptr< ::fremenserver::FremenGoal const> FremenGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::fremenserver::FremenGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::fremenserver::FremenGoal_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::fremenserver::FremenGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::fremenserver::FremenGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fremenserver::FremenGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fremenserver::FremenGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fremenserver::FremenGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fremenserver::FremenGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::fremenserver::FremenGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4349b55697a98adfe8c174ca69c62660";
  }

  static const char* value(const ::fremenserver::FremenGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4349b55697a98adfULL;
  static const uint64_t static_value2 = 0xe8c174ca69c62660ULL;
};

template<class ContainerAllocator>
struct DataType< ::fremenserver::FremenGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fremenserver/FremenGoal";
  }

  static const char* value(const ::fremenserver::FremenGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::fremenserver::FremenGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#goal definition\n\
string   operation 	#the operation can be 'add', 'addvalues', 'predict', 'forecast', 'entropy', 'evaluate', 'detect', 'update', 'delete'\n\
			#'add' adds a sequence of given (by ID) state measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model\n\
			#'addvalues' adds a sequence of given (by ID) value measurements and the times these have been obtained to the state's model, if ID is given for the first time, a new state is created and added to the model\n\
			#'predict'  calculates a sequence of probabilities of the state ID for the given times (i.e. prediction of one state for multiple time instants)\n\
			#'forecast'  calculates a sequence of probabilities of the states with given 'ids' for the given time (i.e. prediction of mutiple states for a single time instant)\n\
			#'entropy'  calculates a sequence of entropies of the state ID for the given times - this is to support exploration\n\
			#'evaluate' predicts the state for the given times, compares the prediction with ground truth and returns the prediction errors for model orders from 0 to the order specified. Meant to help to decide which order to use for the 'predict' action. \n\
			#'detect' detects anomalies by predicting the state for the given times, comparing with ground truth and flagging up discrepancies that were beyond a certain 'confidence' level \n\
			#'delete' removes the current state from the collection of states   \n\
			#'update' is reserved, will be used int the future for recalculating the models\n\
\n\
string  id	  	#specifies the ID of the state to be manipulated \n\
string[]  ids	  	#specifies the IDs of the states to be manipulated - explusively fot the 'forecast' action\n\
uint32[]  times 	#the time instants for the 'predict', 'add', 'entropy' and 'evaluate' actions\n\
\n\
#specific for the 'predict', 'evaluate' and 'detect' actions\n\
int32    order 		#number of periodic processes to use for the purpose of prediction (0 means a static model, typical value is 2), maximal order used for evaluation of the 'evaluate' action\n\
\n\
#specific for the 'forecast' actions\n\
int32[]  orders	  	#same as previous one, but for all states in the **ids** \n\
\n\
#specific for the 'add' and 'evaluate' action\n\
bool[]      states   	#sequence of states observed at the particular times - specific to the 'add' action 	(this is for backward compatibility)\n\
float32[]   values   	#sequence of values observed at the particular times - specific to the 'addvalues' action, (I recommend to normalize the values so they fit 0-1)\n\
\n\
#specific for the 'detect' \n\
float32   confidence   	#confidence level for the anomaly detection\n\
\n\
#specific for the 'upload_params'\n\
float32[] periods\n\
float32[] amplitudes\n\
float32[] phases\n\
\n\
";
  }

  static const char* value(const ::fremenserver::FremenGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::fremenserver::FremenGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.operation);
      stream.next(m.id);
      stream.next(m.ids);
      stream.next(m.times);
      stream.next(m.order);
      stream.next(m.orders);
      stream.next(m.states);
      stream.next(m.values);
      stream.next(m.confidence);
      stream.next(m.periods);
      stream.next(m.amplitudes);
      stream.next(m.phases);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FremenGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::fremenserver::FremenGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::fremenserver::FremenGoal_<ContainerAllocator>& v)
  {
    s << indent << "operation: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.operation);
    s << indent << "id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.id);
    s << indent << "ids[]" << std::endl;
    for (size_t i = 0; i < v.ids.size(); ++i)
    {
      s << indent << "  ids[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.ids[i]);
    }
    s << indent << "times[]" << std::endl;
    for (size_t i = 0; i < v.times.size(); ++i)
    {
      s << indent << "  times[" << i << "]: ";
      Printer<uint32_t>::stream(s, indent + "  ", v.times[i]);
    }
    s << indent << "order: ";
    Printer<int32_t>::stream(s, indent + "  ", v.order);
    s << indent << "orders[]" << std::endl;
    for (size_t i = 0; i < v.orders.size(); ++i)
    {
      s << indent << "  orders[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.orders[i]);
    }
    s << indent << "states[]" << std::endl;
    for (size_t i = 0; i < v.states.size(); ++i)
    {
      s << indent << "  states[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.states[i]);
    }
    s << indent << "values[]" << std::endl;
    for (size_t i = 0; i < v.values.size(); ++i)
    {
      s << indent << "  values[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.values[i]);
    }
    s << indent << "confidence: ";
    Printer<float>::stream(s, indent + "  ", v.confidence);
    s << indent << "periods[]" << std::endl;
    for (size_t i = 0; i < v.periods.size(); ++i)
    {
      s << indent << "  periods[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.periods[i]);
    }
    s << indent << "amplitudes[]" << std::endl;
    for (size_t i = 0; i < v.amplitudes.size(); ++i)
    {
      s << indent << "  amplitudes[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.amplitudes[i]);
    }
    s << indent << "phases[]" << std::endl;
    for (size_t i = 0; i < v.phases.size(); ++i)
    {
      s << indent << "  phases[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.phases[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // FREMENSERVER_MESSAGE_FREMENGOAL_H
