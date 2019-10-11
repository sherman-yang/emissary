// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: envoy/api/v2/listener/udp_listener_config.proto

package envoy_api_v2_listener

import (
	fmt "fmt"
	proto "github.com/gogo/protobuf/proto"
	types "github.com/gogo/protobuf/types"
	io "io"
	math "math"
	math_bits "math/bits"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

type UdpListenerConfig struct {
	// Used to look up UDP listener factory, matches "raw_udp_listener" or
	// "quic_listener" to create a specific udp listener.
	// If not specified, treat as "raw_udp_listener".
	UdpListenerName string `protobuf:"bytes,1,opt,name=udp_listener_name,json=udpListenerName,proto3" json:"udp_listener_name,omitempty"`
	// Used to create a specific listener factory. To some factory, e.g.
	// "raw_udp_listener", config is not needed.
	//
	// Types that are valid to be assigned to ConfigType:
	//	*UdpListenerConfig_Config
	//	*UdpListenerConfig_TypedConfig
	ConfigType           isUdpListenerConfig_ConfigType `protobuf_oneof:"config_type"`
	XXX_NoUnkeyedLiteral struct{}                       `json:"-"`
	XXX_unrecognized     []byte                         `json:"-"`
	XXX_sizecache        int32                          `json:"-"`
}

func (m *UdpListenerConfig) Reset()         { *m = UdpListenerConfig{} }
func (m *UdpListenerConfig) String() string { return proto.CompactTextString(m) }
func (*UdpListenerConfig) ProtoMessage()    {}
func (*UdpListenerConfig) Descriptor() ([]byte, []int) {
	return fileDescriptor_04a0b1c45e39fc83, []int{0}
}
func (m *UdpListenerConfig) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *UdpListenerConfig) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_UdpListenerConfig.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *UdpListenerConfig) XXX_Merge(src proto.Message) {
	xxx_messageInfo_UdpListenerConfig.Merge(m, src)
}
func (m *UdpListenerConfig) XXX_Size() int {
	return m.Size()
}
func (m *UdpListenerConfig) XXX_DiscardUnknown() {
	xxx_messageInfo_UdpListenerConfig.DiscardUnknown(m)
}

var xxx_messageInfo_UdpListenerConfig proto.InternalMessageInfo

type isUdpListenerConfig_ConfigType interface {
	isUdpListenerConfig_ConfigType()
	MarshalTo([]byte) (int, error)
	Size() int
}

type UdpListenerConfig_Config struct {
	Config *types.Struct `protobuf:"bytes,2,opt,name=config,proto3,oneof"`
}
type UdpListenerConfig_TypedConfig struct {
	TypedConfig *types.Any `protobuf:"bytes,3,opt,name=typed_config,json=typedConfig,proto3,oneof"`
}

func (*UdpListenerConfig_Config) isUdpListenerConfig_ConfigType()      {}
func (*UdpListenerConfig_TypedConfig) isUdpListenerConfig_ConfigType() {}

func (m *UdpListenerConfig) GetConfigType() isUdpListenerConfig_ConfigType {
	if m != nil {
		return m.ConfigType
	}
	return nil
}

func (m *UdpListenerConfig) GetUdpListenerName() string {
	if m != nil {
		return m.UdpListenerName
	}
	return ""
}

func (m *UdpListenerConfig) GetConfig() *types.Struct {
	if x, ok := m.GetConfigType().(*UdpListenerConfig_Config); ok {
		return x.Config
	}
	return nil
}

func (m *UdpListenerConfig) GetTypedConfig() *types.Any {
	if x, ok := m.GetConfigType().(*UdpListenerConfig_TypedConfig); ok {
		return x.TypedConfig
	}
	return nil
}

// XXX_OneofWrappers is for the internal use of the proto package.
func (*UdpListenerConfig) XXX_OneofWrappers() []interface{} {
	return []interface{}{
		(*UdpListenerConfig_Config)(nil),
		(*UdpListenerConfig_TypedConfig)(nil),
	}
}

func init() {
	proto.RegisterType((*UdpListenerConfig)(nil), "envoy.api.v2.listener.UdpListenerConfig")
}

func init() {
	proto.RegisterFile("envoy/api/v2/listener/udp_listener_config.proto", fileDescriptor_04a0b1c45e39fc83)
}

var fileDescriptor_04a0b1c45e39fc83 = []byte{
	// 301 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0xd2, 0x4f, 0xcd, 0x2b, 0xcb,
	0xaf, 0xd4, 0x4f, 0x2c, 0xc8, 0xd4, 0x2f, 0x33, 0xd2, 0xcf, 0xc9, 0x2c, 0x2e, 0x49, 0xcd, 0x4b,
	0x2d, 0xd2, 0x2f, 0x4d, 0x29, 0x88, 0x87, 0x71, 0xe2, 0x93, 0xf3, 0xf3, 0xd2, 0x32, 0xd3, 0xf5,
	0x0a, 0x8a, 0xf2, 0x4b, 0xf2, 0x85, 0x44, 0xc1, 0x1a, 0xf4, 0x12, 0x0b, 0x32, 0xf5, 0xca, 0x8c,
	0xf4, 0x60, 0x6a, 0xa4, 0x64, 0xd2, 0xf3, 0xf3, 0xd3, 0x73, 0x52, 0xf5, 0xc1, 0x8a, 0x92, 0x4a,
	0xd3, 0xf4, 0x8b, 0x4b, 0x8a, 0x4a, 0x93, 0x4b, 0x20, 0x9a, 0xa4, 0x24, 0xd1, 0x65, 0x13, 0xf3,
	0x2a, 0x21, 0x52, 0x4a, 0x7b, 0x18, 0xb9, 0x04, 0x43, 0x53, 0x0a, 0x7c, 0xa0, 0x06, 0x39, 0x83,
	0xed, 0x12, 0xd2, 0xe2, 0x12, 0x44, 0x71, 0x42, 0x5e, 0x62, 0x6e, 0xaa, 0x04, 0xa3, 0x02, 0xa3,
	0x06, 0x67, 0x10, 0x7f, 0x29, 0x42, 0xb5, 0x5f, 0x62, 0x6e, 0xaa, 0x90, 0x21, 0x17, 0x1b, 0xc4,
	0x85, 0x12, 0x4c, 0x0a, 0x8c, 0x1a, 0xdc, 0x46, 0xe2, 0x7a, 0x10, 0xdb, 0xf4, 0x60, 0xb6, 0xe9,
	0x05, 0x83, 0xdd, 0xe2, 0xc1, 0x10, 0x04, 0x55, 0x28, 0x64, 0xc9, 0xc5, 0x53, 0x52, 0x59, 0x90,
	0x9a, 0x02, 0xf5, 0x9a, 0x04, 0x33, 0x58, 0xa3, 0x08, 0x86, 0x46, 0xc7, 0xbc, 0x4a, 0x0f, 0x86,
	0x20, 0x6e, 0xb0, 0x5a, 0x88, 0xcb, 0x9c, 0x78, 0xb9, 0xb8, 0x21, 0x9a, 0xe2, 0x41, 0xa2, 0x4e,
	0x4d, 0x8c, 0x27, 0x1e, 0xc9, 0x31, 0x5e, 0x78, 0x24, 0xc7, 0xf8, 0xe0, 0x91, 0x1c, 0x23, 0x97,
	0x72, 0x66, 0xbe, 0x1e, 0x38, 0x80, 0x0a, 0x8a, 0xf2, 0x2b, 0x2a, 0xf5, 0xb0, 0x86, 0x95, 0x93,
	0x18, 0x86, 0x7f, 0x03, 0x40, 0x16, 0x06, 0x30, 0xae, 0x62, 0x12, 0x77, 0x05, 0xeb, 0x70, 0x2c,
	0xc8, 0xd4, 0x0b, 0x33, 0xd2, 0x83, 0x7b, 0x33, 0xf8, 0x15, 0x93, 0x14, 0x58, 0xc6, 0xca, 0xca,
	0xb1, 0x20, 0xd3, 0xca, 0x2a, 0xcc, 0xc8, 0xca, 0x0a, 0x21, 0x99, 0xc4, 0x06, 0x76, 0xb0, 0x31,
	0x20, 0x00, 0x00, 0xff, 0xff, 0xa9, 0x2d, 0x94, 0x89, 0xcd, 0x01, 0x00, 0x00,
}

func (m *UdpListenerConfig) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *UdpListenerConfig) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *UdpListenerConfig) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if m.XXX_unrecognized != nil {
		i -= len(m.XXX_unrecognized)
		copy(dAtA[i:], m.XXX_unrecognized)
	}
	if m.ConfigType != nil {
		{
			size := m.ConfigType.Size()
			i -= size
			if _, err := m.ConfigType.MarshalTo(dAtA[i:]); err != nil {
				return 0, err
			}
		}
	}
	if len(m.UdpListenerName) > 0 {
		i -= len(m.UdpListenerName)
		copy(dAtA[i:], m.UdpListenerName)
		i = encodeVarintUdpListenerConfig(dAtA, i, uint64(len(m.UdpListenerName)))
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *UdpListenerConfig_Config) MarshalTo(dAtA []byte) (int, error) {
	return m.MarshalToSizedBuffer(dAtA[:m.Size()])
}

func (m *UdpListenerConfig_Config) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	if m.Config != nil {
		{
			size, err := m.Config.MarshalToSizedBuffer(dAtA[:i])
			if err != nil {
				return 0, err
			}
			i -= size
			i = encodeVarintUdpListenerConfig(dAtA, i, uint64(size))
		}
		i--
		dAtA[i] = 0x12
	}
	return len(dAtA) - i, nil
}
func (m *UdpListenerConfig_TypedConfig) MarshalTo(dAtA []byte) (int, error) {
	return m.MarshalToSizedBuffer(dAtA[:m.Size()])
}

func (m *UdpListenerConfig_TypedConfig) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	if m.TypedConfig != nil {
		{
			size, err := m.TypedConfig.MarshalToSizedBuffer(dAtA[:i])
			if err != nil {
				return 0, err
			}
			i -= size
			i = encodeVarintUdpListenerConfig(dAtA, i, uint64(size))
		}
		i--
		dAtA[i] = 0x1a
	}
	return len(dAtA) - i, nil
}
func encodeVarintUdpListenerConfig(dAtA []byte, offset int, v uint64) int {
	offset -= sovUdpListenerConfig(v)
	base := offset
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return base
}
func (m *UdpListenerConfig) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.UdpListenerName)
	if l > 0 {
		n += 1 + l + sovUdpListenerConfig(uint64(l))
	}
	if m.ConfigType != nil {
		n += m.ConfigType.Size()
	}
	if m.XXX_unrecognized != nil {
		n += len(m.XXX_unrecognized)
	}
	return n
}

func (m *UdpListenerConfig_Config) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if m.Config != nil {
		l = m.Config.Size()
		n += 1 + l + sovUdpListenerConfig(uint64(l))
	}
	return n
}
func (m *UdpListenerConfig_TypedConfig) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if m.TypedConfig != nil {
		l = m.TypedConfig.Size()
		n += 1 + l + sovUdpListenerConfig(uint64(l))
	}
	return n
}

func sovUdpListenerConfig(x uint64) (n int) {
	return (math_bits.Len64(x|1) + 6) / 7
}
func sozUdpListenerConfig(x uint64) (n int) {
	return sovUdpListenerConfig(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (m *UdpListenerConfig) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowUdpListenerConfig
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: UdpListenerConfig: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: UdpListenerConfig: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field UdpListenerName", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowUdpListenerConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.UdpListenerName = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Config", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowUdpListenerConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			v := &types.Struct{}
			if err := v.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			m.ConfigType = &UdpListenerConfig_Config{v}
			iNdEx = postIndex
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field TypedConfig", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowUdpListenerConfig
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			v := &types.Any{}
			if err := v.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			m.ConfigType = &UdpListenerConfig_TypedConfig{v}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipUdpListenerConfig(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if skippy < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			if (iNdEx + skippy) < 0 {
				return ErrInvalidLengthUdpListenerConfig
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			m.XXX_unrecognized = append(m.XXX_unrecognized, dAtA[iNdEx:iNdEx+skippy]...)
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipUdpListenerConfig(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowUdpListenerConfig
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowUdpListenerConfig
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
			return iNdEx, nil
		case 1:
			iNdEx += 8
			return iNdEx, nil
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowUdpListenerConfig
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if length < 0 {
				return 0, ErrInvalidLengthUdpListenerConfig
			}
			iNdEx += length
			if iNdEx < 0 {
				return 0, ErrInvalidLengthUdpListenerConfig
			}
			return iNdEx, nil
		case 3:
			for {
				var innerWire uint64
				var start int = iNdEx
				for shift := uint(0); ; shift += 7 {
					if shift >= 64 {
						return 0, ErrIntOverflowUdpListenerConfig
					}
					if iNdEx >= l {
						return 0, io.ErrUnexpectedEOF
					}
					b := dAtA[iNdEx]
					iNdEx++
					innerWire |= (uint64(b) & 0x7F) << shift
					if b < 0x80 {
						break
					}
				}
				innerWireType := int(innerWire & 0x7)
				if innerWireType == 4 {
					break
				}
				next, err := skipUdpListenerConfig(dAtA[start:])
				if err != nil {
					return 0, err
				}
				iNdEx = start + next
				if iNdEx < 0 {
					return 0, ErrInvalidLengthUdpListenerConfig
				}
			}
			return iNdEx, nil
		case 4:
			return iNdEx, nil
		case 5:
			iNdEx += 4
			return iNdEx, nil
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
	}
	panic("unreachable")
}

var (
	ErrInvalidLengthUdpListenerConfig = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowUdpListenerConfig   = fmt.Errorf("proto: integer overflow")
)
