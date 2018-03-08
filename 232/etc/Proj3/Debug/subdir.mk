################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../CommandLine.cpp \
../KEShell.cpp \
../commandlinetest.cpp \
../main.cpp \
../path.cpp \
../prompt.cpp 

OBJS += \
./CommandLine.o \
./KEShell.o \
./commandlinetest.o \
./main.o \
./path.o \
./prompt.o 

CPP_DEPS += \
./CommandLine.d \
./KEShell.d \
./commandlinetest.d \
./main.d \
./path.d \
./prompt.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


