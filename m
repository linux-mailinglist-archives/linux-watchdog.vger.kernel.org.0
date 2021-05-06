Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5B1375460
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 15:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhEFNFc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 09:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233115AbhEFNFb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 09:05:31 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E88C061574;
        Thu,  6 May 2021 06:04:33 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso4780547otv.6;
        Thu, 06 May 2021 06:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WEGH4MTbzyjlnbO2q1wmMyx1YnhDS2foSBOanTgWnnw=;
        b=mBY9ox/WDA92PUToZyuFX54UQ/srx/8VgFdqKEbOo17aqC7u9BWpXw+SdG9B+se7H5
         jDnJBOam8Ub2g8ObV+3y0nCnsQkYLnSTfLGKfTJ1SR/jXBM2s1JBE5urnxlbSmwfWBw0
         59NfHJIYK/sTo6GK2k7JCdoP0F6VeDRq7zlPn/79JmQKACYm55tHXb2nsUlzKWyG7q8j
         sncCX8YPH06usNdKlNWs7pGlSIVCMW0zaOKELw4RnQC27ylvSAKJe5CtYvcQYfnz0Nly
         MQ4RH90Mn4eZS52K0oSS8I6L2W/Z2Eve8QXwaxnIaM9eNsPwiQDM09Z8/zNp13ZWrBNW
         7S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WEGH4MTbzyjlnbO2q1wmMyx1YnhDS2foSBOanTgWnnw=;
        b=QfWhJDcjUwb7qovOcN4gK4Ezi+X4rYn1NWX24hTV5ugENkxqIxrV6uAL2mznaXjNdY
         rSelVbmSK+ZUFbo3L/pa3nA5vELaccmPkPeEGIo9b+RU2mlFIAJCiWxdwNLdd7jR85wY
         bMwgWjjB8u+jX6FB1WVyqEqwlhm5SRR4BQjnYuy5OdrQWbAXhi3IgKYW2tPzN92YRR/H
         4VueuALwU5lVm+aKYsSv6feTV0Xhp468/PQTzguv5qA29tTFUIhZx0zphvJTZJafgBbe
         DGkvNLACegJzDSUXPF8wtEyIWefMSFOUpSi5oqVI84R2k6kR1cUFTOPTTgw0Td/rLQkw
         GurQ==
X-Gm-Message-State: AOAM5310JwDGQQenGIn1LTYLHx8qC55YTWuP/1XcwWlaGiYSoI9I+IPH
        ZZlTupGffXhEpl/YcctDWvE=
X-Google-Smtp-Source: ABdhPJyiU48WIe/LGp44tWUuCVFNRBhuWyYWoDbXrGeOyoVKVKpW9mHc80LpHNuIvAKEPJHzSImG0A==
X-Received: by 2002:a05:6830:2086:: with SMTP id y6mr3472231otq.356.1620306272260;
        Thu, 06 May 2021 06:04:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c7sm483978oot.42.2021.05.06.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:04:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 6 May 2021 06:04:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [PATCH v7 7/7] hwmon: ahc1ec0-hwmon: Add sub-device HWMON for
 Advantech embedded controller
Message-ID: <20210506130427.GA2252703@roeck-us.net>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
 <20210506081619.2443-7-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506081619.2443-7-campion.kang@advantech.com.tw>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 06, 2021 at 04:16:19PM +0800, Campion Kang wrote:
> This is one of sub-device driver for Advantech embedded controller
> AHC1EC0. This driver provides sysfs ABI for Advantech related
> applications to monitor the system status.
> 
> Changed in V7:
> 	Fix the patch according to reviewer's comment:
> 	- add new document Documentation/hwmon/ahc1ec0-hwmon.rst to describe
> 	  the sensors attributes
> 	- pass the checking by checkpatch --strict command
> 	- remove unnecessary error checks
> 	- check channel account, return 0 if the second sensor is not
> 	  supported
> 	- make current sensor alone, not in hwmon sensors array
> 
> Changed in V6:
> 	- remove unnecessary header files
> 	- Using [devm_]hwmon_device_register_with_info() to register
> 	  HWMON driver based on reviewer's suggestion
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  Documentation/hwmon/ahc1ec0-hwmon.rst |  73 +++
>  drivers/hwmon/Kconfig                 |  10 +
>  drivers/hwmon/Makefile                |   1 +
>  drivers/hwmon/ahc1ec0-hwmon.c         | 701 ++++++++++++++++++++++++++
>  4 files changed, 785 insertions(+)
>  create mode 100644 Documentation/hwmon/ahc1ec0-hwmon.rst
>  create mode 100644 drivers/hwmon/ahc1ec0-hwmon.c
> 
> diff --git a/Documentation/hwmon/ahc1ec0-hwmon.rst b/Documentation/hwmon/ahc1ec0-hwmon.rst
> new file mode 100644
> index 000000000000..7fcfb8b025d9
> --- /dev/null
> +++ b/Documentation/hwmon/ahc1ec0-hwmon.rst
> @@ -0,0 +1,73 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver ahc1ec0-hwmon
> +=================================
> +
> +Supported chips:
> +
> + * Advantech AHC1 Embedded Controller Chip for Advantech Devices
> +
> +   Prefix: 'ahc1ec0-hwmon'
> +
> +   Datasheet: Datasheet is not publicly available.
> +
> +Author: Campion Kang <campion.kang@advantech.com.tw>
> +
> +
> +Description
> +-----------
> +
> +This driver adds the temperature, voltage, current support for the Advantech
> +Devices with AHC1 Embedded Controller in Advantech IIoT Group.
> +The AHC1EC0 firmware is responsible for sensor data sampling and recording in
> +shared registers. The firmware is impleted by Advantech firmware team, it is
> +a common design suitable for different hardware pins of Advantech devices.
> +The host driver according to its hardware dynamic table and profile access its
> +registers and exposes them to users as hwmon interfaces.
> +
> +The driver now is supports the AHC1EC0 for Advantech UNO, TPC series
> +devices.
> +
> +Usage Notes
> +-----------
> +
> +This driver will automatically probe and start via ahc1ec0 mfd driver
> +according to the attributes in ACPI table or device tree. More detail settings
> +you can refer the Documentation\devicetree\bindings\mfd\ahc1ec0.yaml.
> +
> +The ahc1ec0 driver will not probe automatic. You will have to instantiate
> +devices explicitly. You can add it to /etc/modules.conf or insert module by
> +the following command:
> +
> +	# insmod ahc1ec0
> +
> +
> +Sysfs attributes
> +----------------
> +
> +The following attributes are supported:
> +
> +- Advantech AHC1 Embedded Controller for Advantech UNO, TPC series:
> +
> +======================= =======================================================
> +tempX_input             Temperature of the component (specified by tempX_label)
> +tempX_crit              Temperature critical setpoint of the component
> +temp1_label             "CPU Temp"
> +temp2_label             "System Temp"
> +
> +inX_input               Measured voltage of the component (specified by
> +                        inX_label and may different with devices)
> +in0_label               "VBAT"
> +in1_label               "5VSB"
> +in2_label               "Vin"
> +in3_label               "VCore"
> +in4_label               "Vin1"
> +in5_label               "Vin2"
> +in6_label               "System Voltage"
> +
> +curr1_input             Measured current of Vin
> +curr1_label             "Current"
> +
> +======================= =======================================================
> +
> +All the attributes are read-only.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 87624902ea80..242ea59e994b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2147,6 +2147,16 @@ config SENSORS_INTEL_M10_BMC_HWMON
>  	  sensors monitor various telemetry data of different components on the
>  	  card, e.g. board temperature, FPGA core temperature/voltage/current.
>  
> +config SENSORS_AHC1EC0_HWMON
> +	tristate "Advantech AHC1EC0 Hardware Monitor Function"
> +	depends on MFD_AHC1EC0
> +	help
> +	  This driver provide support for the hardware monitoring functionality
> +	  for Advantech AHC1EC0 embedded controller on the board.
> +
> +	  This driver provides the sysfs attributes for applications to monitor
> +	  the system status, including system temperatures, voltages, current.
> +
>  if ACPI
>  
>  comment "ACPI drivers"
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 59e78bc212cf..2df3381bf124 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
>  obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
>  obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
>  obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
> +obj-$(CONFIG_SENSORS_AHC1EC0_HWMON) += ahc1ec0-hwmon.o
>  obj-$(CONFIG_SENSORS_AHT10)	+= aht10.o
>  obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
> diff --git a/drivers/hwmon/ahc1ec0-hwmon.c b/drivers/hwmon/ahc1ec0-hwmon.c
> new file mode 100644
> index 000000000000..5502e645048b
> --- /dev/null
> +++ b/drivers/hwmon/ahc1ec0-hwmon.c
> @@ -0,0 +1,701 @@
> +// SPDX-License-Identifier: GPL-2.0-only

This does not match MODULE_LICENSE below.

> +/*
> + * HWMON Driver for Advantech AHC1EC0 Embedded Controller
> + *
> + * Copyright 2021, Advantech IIoT Group
> + */
> +
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/hwmon-sysfs.h>

Unnecessary include.

> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/ahc1ec0.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#define EC_ACPI_THERMAL1_LOCAL_TEMP	0x60
> +#define EC_ACPI_THERMAL1_REMOTE_TEMP	0x61
> +
> +struct ec_hwmon_attrs {
> +	const char		*name;
> +	umode_t			mode;
> +	int (*read)(struct device *dev, long *val);
> +};
> +
> +struct adv_hwmon_profile {
> +	int offset;
> +	unsigned long resolution, resolution_vin, resolution_sys, resolution_curr, resolution_power;
> +	unsigned long r1, r1_vin, r1_sys, r1_curr, r1_power;
> +	unsigned long r2, r2_vin, r2_sys, r2_curr, r2_power;
> +	int hwmon_in_list_cnt;
> +	int curr_list_cnt;
> +	int temp_list_cnt;
> +	int *hwmon_in_list;
> +	int *curr_list;
> +	int *temp_list;
> +};
> +
> +struct ec_hwmon_data {
> +	struct device *dev;

Unnecessary.

> +	struct device *hwmon_dev;

Unnecessary.

> +	struct adv_ec_ddata *ddata;
> +	unsigned long temperature[3];

Unused.

> +	unsigned long ec_current[5];

ec_current[0] and ec_current[1] are profile variables, ec_current[3]
is written to but never read, the others are unused.

> +	unsigned long power[5];

Not used at all.

> +	unsigned long voltage[7];

Unnecessary array.

> +
> +	struct ec_hw_pin_table pin_tbl;

I don't see this structure used in any other driver but here.
Please declare it here.

> +	struct ec_smbuso_em0 ec_smboem0;

This is only written to and does not appear to be used.

> +	struct adv_hwmon_profile *profile;
> +};
> +
> +enum ec_hwmon_in_type {
> +	EC_HWMON_IN_VBAT,
> +	EC_HWMON_IN_5VSB,
> +	EC_HWMON_IN_12V,
> +	EC_HWMON_IN_VCORE,
> +	EC_HWMON_IN_VIN1,
> +	EC_HWMON_IN_VIN2,
> +	EC_HWMON_IN_SYS_VOL,
> +};

Some of the above values do not appear to be used anywhere.

> +
> +enum ec_curr_type {
> +	EC_VIN_CURRENT,
> +};
> +
> +enum ec_temp_type {
> +	EC_TEMP_CPU,
> +	EC_TEMP_SYS,
> +};
> +
> +static int hwmon_in_list_0[] = {
> +	EC_HWMON_IN_VBAT,
> +	EC_HWMON_IN_5VSB,
> +	EC_HWMON_IN_12V,
> +	EC_HWMON_IN_VCORE,
> +};
> +
> +static int hwmon_in_list_1[] = {
> +	EC_HWMON_IN_VBAT,
> +	EC_HWMON_IN_5VSB,
> +	EC_HWMON_IN_12V,
> +	EC_HWMON_IN_VCORE,
> +};
> +
> +static int curr_list_0[] = {
> +	EC_VIN_CURRENT,
> +};
> +
> +static int temp_list_0[] = {
> +	EC_TEMP_CPU,
> +};
> +
> +static int temp_list_1[] = {
> +	EC_TEMP_CPU,
> +	EC_TEMP_SYS,
> +};
> +
> +static struct adv_hwmon_profile advec_profile[] = {
> +	/* [0] AHC1EC0_HWMON_PRO_TEMPLATE
> +	 * The following Advantech hardware devices are for this configuration:
> +	 *		TPC-8100TR, TPC-651T-E3AE, TPC-1251T-E3AE, TPC-1551T-E3AE,
> +	 *		TPC-1751T-E3AE, TPC-1051WP-E3AE, TPC-1551WP-E3AE, TPC-1581WP-433AE,
> +	 *		TPC-1782H-433AE, UNO-1483G-434AE, UNO-2483G-434AE, UNO-3483G-374AE,
> +	 *		UNO-2473G, UNO-2484G-6???AE, UNO-2484G-7???AE, UNO-3283G-674AE,
> +	 *		UNO-3285G-674AE
> +	 */

/*
 * This is not the networking subsystem.
 * Please use standfard multi-line comments.
 */

> +	{
> +		.resolution = 2929,
> +		.r1 = 1912,
> +		.r2 = 1000,
> +		.offset = 0,
> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_0),
> +		.hwmon_in_list = hwmon_in_list_0,
> +		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
> +		.temp_list = temp_list_0,
> +		.curr_list_cnt = ARRAY_SIZE(curr_list_0),
> +		.curr_list = curr_list_0,
> +	},
> +	/* [1] AHC1EC0_HWMON_PRO_TPC5XXX
> +	 * The following Advantech hardware devices are for 2nd configuration:
> +	 *		TPC-B500-6??AE, TPC-5???T-6??AE, TPC-5???W-6??AE, TPC-B200-???AE,
> +	 *		TPC-2???T-???AE, TPC-2???W-???AE
> +	 */
> +	{
> +		.resolution = 2929,
> +		.r1 = 1912,
> +		.r2 = 1000,
> +		.offset = 0,
> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
> +		.hwmon_in_list = hwmon_in_list_1,
> +		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
> +		.temp_list = temp_list_0,
> +		.curr_list_cnt = 0,
> +	},
> +	/* [2] AHC1EC0_HWMON_PRO_PRVR4
> +	 * The PR/VR4 devices are this configuration.
> +	 */
> +	{
> +		.resolution = 2929,
> +		.r1 = 1912,
> +		.r2 = 1000,
> +		.offset = 0,
> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
> +		.hwmon_in_list = hwmon_in_list_1,
> +		.temp_list_cnt = ARRAY_SIZE(temp_list_1),
> +		.temp_list = temp_list_1,
> +		.curr_list_cnt = 0,
> +	},
> +	/* [3] AHC1EC0_HWMON_PRO_UNO2271G
> +	 * The following Advantech hardware devices are using this configuration:
> +	 *     UNO-2271G-E22AE/E23AE/E022AE/E023AE series and UNO-420 devices
> +	 */
> +	{
> +		.resolution = 2929,
> +		.r1 = 1912,
> +		.r2 = 1000,
> +		.offset = 0,
> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
> +		.hwmon_in_list = hwmon_in_list_1,
> +		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
> +		.temp_list = temp_list_0,
> +		.curr_list_cnt = 0,

0 initializers are unnecessary.

> +	},
> +};
> +
> +static void adv_ec_init_hwmon_profile(u32 profile, struct ec_hwmon_data *lmsensor_data)
> +{
> +	int i;
> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +	struct ec_dynamic_table *dym_tbl = ddata->dym_tbl;
> +
> +	lmsensor_data->profile = &advec_profile[profile];
> +
> +	for (i = 0; i < EC_MAX_TBL_NUM ; i++) {
> +		switch (dym_tbl[i].device_id) {
> +		case EC_DID_CMOSBAT:
> +			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vbat[1] = 1;
> +			break;
> +		case EC_DID_CMOSBAT_X2:
> +			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vbat[1] = 2;
> +			break;
> +		case EC_DID_CMOSBAT_X10:
> +			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vbat[1] = 10;
> +			break;
> +		case EC_DID_5VS0:
> +		case EC_DID_5VS5:
> +			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->v5[1] = 1;
> +			break;
> +		case EC_DID_5VS0_X2:
> +		case EC_DID_5VS5_X2:
> +			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->v5[1] = 2;
> +			break;
> +		case EC_DID_5VS0_X10:
> +		case EC_DID_5VS5_X10:
> +			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->v5[1] = 10;
> +			break;
> +		case EC_DID_12VS0:
> +			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->v12[1] = 1;
> +			break;
> +		case EC_DID_12VS0_X2:
> +			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->v12[1] = 2;
> +			break;
> +		case EC_DID_12VS0_X10:
> +			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->v12[1] = 10;
> +			break;
> +		case EC_DID_VCOREA:
> +		case EC_DID_VCOREB:
> +			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vcore[1] = 1;
> +			break;
> +		case EC_DID_VCOREA_X2:
> +		case EC_DID_VCOREB_X2:
> +			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vcore[1] = 2;
> +			break;
> +		case EC_DID_VCOREA_X10:
> +		case EC_DID_VCOREB_X10:
> +			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vcore[1] = 10;
> +			break;
> +		case EC_DID_DC:
> +			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vdc[1] = 1;
> +			break;
> +		case EC_DID_DC_X2:
> +			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vdc[1] = 2;
> +			break;
> +		case EC_DID_DC_X10:
> +			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->vdc[1] = 10;
> +			break;
> +		case EC_DID_CURRENT:
> +			ptbl->ec_current[0] = dym_tbl[i].hw_pin_num;
> +			ptbl->ec_current[1] = 1;
> +			break;
> +		case EC_DID_SMBOEM0:
> +			lmsensor_data->ec_smboem0.hw_pin_num = dym_tbl[i].hw_pin_num;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +}
> +
> +static int get_ec_in_vbat_input(struct device *dev, long *val)
> +{
> +	unsigned int temp = 0;

Unnecessary initialization.

> +	unsigned long voltage = 0;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	temp = ahc1ec_read_adc_value(ddata, ptbl->vbat[0], ptbl->vbat[1]);
> +
> +	if (profile->r2 != 0)
> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;

r2 is always != 0.

> +
> +	if (profile->resolution != 0)
> +		voltage =  temp * profile->resolution / 1000 / 1000;
> +
> +	if (profile->offset != 0)
> +		voltage += (int)profile->offset * 100;
> +
> +	lmsensor_data->voltage[0] = 10 * voltage;

This results in unnecessary loss of resolution. Please fix the calculations
to avoid it.

> +
> +	*val = lmsensor_data->voltage[0];
> +	return 0;
> +}
> +
> +static int get_ec_in_v5_input(struct device *dev, long *val)
> +{
> +	unsigned int temp;
> +	unsigned long voltage = 0;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	temp = ahc1ec_read_adc_value(ddata, ptbl->v5[0], ptbl->v5[1]);
> +
> +	if (profile->r2 != 0)
> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;

r2 is always != 0.

> +
> +	if (profile->resolution != 0)
> +		voltage =  temp * profile->resolution / 1000 / 1000;
> +
> +	if (profile->offset != 0)
> +		voltage += (int)profile->offset * 100;
> +
> +	lmsensor_data->voltage[1] = 10 * voltage;
> +
> +	*val = lmsensor_data->voltage[1];
> +	return 0;
> +}

All those read functions pretty much repeat the same code.
Please add a helper function which does all the common stuff.

> +
> +static int get_ec_in_v12_input(struct device *dev, long *val)
> +{
> +	int temp;
> +	unsigned long voltage = 0;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	temp = ahc1ec_read_adc_value(ddata, ptbl->v12[0], ptbl->v12[1]);
> +	if (temp == -1)
> +		temp = ahc1ec_read_adc_value(ddata, ptbl->vdc[0], ptbl->vdc[1]);
> +
> +	if (profile->r2 != 0)
> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
> +
Same everywhere.

> +	if (profile->resolution != 0)
> +		voltage =  temp * profile->resolution / 1000 / 1000;
> +
> +	if (profile->offset != 0)
> +		voltage += profile->offset * 100;
> +
> +	lmsensor_data->voltage[2] = 10 * voltage;
> +
> +	*val = lmsensor_data->voltage[2];
> +	return 0;
> +}
> +
> +static int get_ec_in_vcore_input(struct device *dev, long *val)
> +{
> +	int temp;
> +	unsigned int voltage = 0;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	temp = ahc1ec_read_adc_value(ddata, ptbl->vcore[0], ptbl->vcore[1]);
> +
> +	if (profile->r2 != 0)
> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
> +
> +	if (profile->resolution != 0)
> +		voltage = temp * profile->resolution / 1000 / 1000;
> +
> +	if (profile->offset != 0)
> +		voltage += profile->offset * 100;
> +
> +	lmsensor_data->voltage[3] = 10 * voltage;
> +
> +	*val = lmsensor_data->voltage[3];
> +	return 0;
> +}
> +
> +static int get_ec_current1_input(struct device *dev, long *val)
> +{
> +	int temp;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	temp = ahc1ec_read_adc_value(ddata, ptbl->ec_current[0], ptbl->ec_current[1]);

This function returns a negative error code which needs to be checked.

> +
> +	if (profile->r2 != 0)
> +		temp = temp * (profile->r1 + profile->r2) / profile->r2;
> +
> +	if (profile->resolution != 0)
> +		temp = temp * profile->resolution / 1000 / 1000;
> +
> +	if (profile->offset != 0)
> +		temp += profile->offset * 100;
> +
> +	lmsensor_data->ec_current[3] = 10 * temp;
> +
> +	*val = lmsensor_data->ec_current[3];
> +	return 0;
> +}
> +
> +static int get_ec_cpu_temp(struct device *dev, long *val)
> +{
> +	int ret;
> +	unsigned char value;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	ret = ahc1ec_read_acpi_value(ddata, EC_ACPI_THERMAL1_REMOTE_TEMP, &value);
> +	if (!ret)
> +		*val = 1000 * value;
> +	return ret;
> +}
> +
> +static int get_ec_sys_temp(struct device *dev, long *val)
> +{
> +	int ret;
> +	unsigned char value;
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +	struct adv_ec_ddata *ddata = lmsensor_data->ddata;
> +
> +	ret = ahc1ec_read_acpi_value(ddata, EC_ACPI_THERMAL1_LOCAL_TEMP, &value);

This function could return both the error code and the value without extra
pointer to the result.

> +	if (!ret)
> +		*val = 1000 * value;
> +	return ret;

This should be
	if (ret)
		return ret;
	*val = ...
	return 0;

> +}

Those two functions can be simplified into one with the sensor
as additional parameter.

> +
> +const struct ec_hwmon_attrs ec_hwmon_in_attr_template[] = {
> +	{"VBAT",	0444, get_ec_in_vbat_input},
> +	{"5VSB",	0444, get_ec_in_v5_input},
> +	{"Vin",		0444, get_ec_in_v12_input},
> +	{"VCORE",	0444, get_ec_in_vcore_input},
> +	{"Vin1",	0444, NULL},
> +	{"Vin2",	0444, NULL},
> +	{"System Voltage", 0444, NULL},

What is the point of above three entries ?

> +	{"Current",	0444, get_ec_current1_input},
> +};
> +
> +const struct ec_hwmon_attrs ec_curr_attr_template[] = {
> +	{"Current",	0444, get_ec_current1_input},
> +};
> +
> +const struct ec_hwmon_attrs ec_temp_attrs_template[] = {
> +	{"CPU Temp",	0444, get_ec_cpu_temp},
> +	{"System Temp",	0444, get_ec_sys_temp},
> +};
> +
> +static int ahc1ec0_read_in(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +
> +	if (attr == hwmon_in_input) {
> +		int index = lmsensor_data->profile->hwmon_in_list[channel];
> +		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_hwmon_in_attr_template[index];
> +
> +		return ec_hwmon_attr->read(dev, val);
> +	}

There is only one attribute, so the if check is really unnecessary.

This entire code could be rearranged to not require the additional
indirect read function, by providing appropriate parameters to a single
function. This would reduce code size significantly. Please do that.

> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ahc1ec0_read_curr(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +
> +	if (attr == hwmon_curr_input) {
> +		int index = lmsensor_data->profile->curr_list[channel];
> +		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_curr_attr_template[index];
> +
> +		return ec_hwmon_attr->read(dev, val);
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ahc1ec0_read_temp(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_input: {
> +		int index = lmsensor_data->profile->temp_list[channel];
> +		const struct ec_hwmon_attrs *devec_hwmon_attr =
> +			&ec_temp_attrs_template[index];
> +
> +		return devec_hwmon_attr->read(dev, val);
> +	}
> +	case hwmon_temp_crit:
> +		/* both CPU temp and System temp are all this value */
> +		*val = 100000;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ahc1ec0_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
> +
> +	if (type == hwmon_in && attr == hwmon_in_label) {
> +		int index = lmsensor_data->profile->hwmon_in_list[channel];
> +		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_hwmon_in_attr_template[index];
> +
> +		*str = ec_hwmon_attr->name;
> +		return 0;
> +	}
> +
> +	if (type == hwmon_curr && attr == hwmon_curr_label) {
> +		int index = lmsensor_data->profile->curr_list[channel];
> +		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_curr_attr_template[index];
> +
> +		*str = ec_hwmon_attr->name;
> +		return 0;
> +	}
> +
> +	if (type == hwmon_temp && attr == hwmon_temp_label) {
> +		int index = lmsensor_data->profile->temp_list[channel];
> +		const struct ec_hwmon_attrs *ec_hwmon_attr = &ec_temp_attrs_template[index];
> +
> +		*str = ec_hwmon_attr->name;
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ahc1ec0_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ahc1ec0_read_in(dev, attr, channel, val);
> +	case hwmon_curr:
> +		return ahc1ec0_read_curr(dev, attr, channel, val);
> +	case hwmon_temp:
> +		return ahc1ec0_read_temp(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t ec_hwmon_in_visible(const void *data, u32 attr, int channel)
> +{
> +	struct ec_hwmon_data *lmsensor_data = (struct ec_hwmon_data *)data;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +	case hwmon_in_label:
> +		if (lmsensor_data->profile->hwmon_in_list_cnt > channel)

This is confusing. Please use
		if (channel < ...)

> +			return 0444;
> +		else
> +			return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ec_curr_visible(const void *data, u32 attr, int channel)
> +{
> +	struct ec_hwmon_data *lmsensor_data = (struct ec_hwmon_data *)data;
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +	case hwmon_curr_label:
> +		if (lmsensor_data->profile->curr_list_cnt > channel)
> +			return 0444;
> +		else
> +			return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ec_temp_visible(const void *data, u32 attr, int channel)
> +{
> +	struct ec_hwmon_data *lmsensor_data = (struct ec_hwmon_data *)data;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +	case hwmon_temp_crit:
> +	case hwmon_temp_label:
> +		if (lmsensor_data->profile->temp_list_cnt > channel)
> +			return 0444;
> +		else
> +			return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ahc1ec0_is_visible(const void *data, enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ec_hwmon_in_visible(data, attr, channel);
> +	case hwmon_curr:
> +		return ec_curr_visible(data, attr, channel);
> +	case hwmon_temp:
> +		return ec_temp_visible(data, attr, channel);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const u32 ahc1ec0_in_config[] = {
> +	HWMON_I_INPUT | HWMON_I_LABEL,
> +	HWMON_I_INPUT | HWMON_I_LABEL,
> +	HWMON_I_INPUT | HWMON_I_LABEL,
> +	HWMON_I_INPUT | HWMON_I_LABEL,
> +	0
> +};
> +
> +static const struct hwmon_channel_info ahc1ec0_in = {
> +	.type = hwmon_in,
> +	.config = ahc1ec0_in_config,
> +};
> +
> +static const u32 ahc1ec0_curr_config[] = {
> +	HWMON_C_INPUT | HWMON_C_LABEL,
> +	0
> +};
> +
> +static const struct hwmon_channel_info ahc1ec0_curr = {
> +	.type = hwmon_curr,
> +	.config = ahc1ec0_curr_config,
> +};
> +
> +static const u32 ahc1ec0_temp_config[] = {
> +	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
> +	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
> +	0
> +};
> +
> +static const struct hwmon_channel_info ahc1ec0_temp = {
> +	.type = hwmon_temp,
> +	.config = ahc1ec0_temp_config,
> +};
> +
> +static const struct hwmon_channel_info *ahc1ec0_info[] = {
> +	&ahc1ec0_in,
> +	&ahc1ec0_curr,
> +	&ahc1ec0_temp,
> +	NULL
> +};

All the above can be simplified by using the HWMON_CHANNEL_INFO()
macro.

> +
> +static const struct hwmon_ops ahc1ec0_hwmon_ops = {
> +	.is_visible = ahc1ec0_is_visible,
> +	.read = ahc1ec0_read,
> +	.read_string = ahc1ec0_read_string,
> +};
> +
> +static const struct hwmon_chip_info ahc1ec0_chip_info = {
> +	.ops = &ahc1ec0_hwmon_ops,
> +	.info = ahc1ec0_info,
> +};
> +
> +static int adv_ec_hwmon_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	u32 profile;
> +	struct device *dev = &pdev->dev;
> +	struct adv_ec_ddata *ddata;
> +	struct ec_hwmon_data *lmsensor_data;
> +
> +	ddata = dev_get_drvdata(dev->parent);
> +	if (!ddata)
> +		return -EINVAL;
> +
> +	ret = device_property_read_u32(dev->parent, "advantech,hwmon-profile", &profile);
> +	if (ret < 0) {
> +		dev_dbg(dev, "get hwmon-profile failed! (%d)", ret);
> +		return ret;
> +	}
> +
> +	if (profile >= ARRAY_SIZE(advec_profile)) {
> +		dev_dbg(dev, "not support hwmon profile(%d)!\n", profile);

s/not support/unsupported/

> +		return -EINVAL;
> +	}
> +
> +	lmsensor_data = devm_kzalloc(dev, sizeof(*lmsensor_data), GFP_KERNEL);
> +	if (!lmsensor_data)
> +		return -ENOMEM;
> +
> +	lmsensor_data->ddata = ddata;
> +	lmsensor_data->dev = dev;
> +	dev_set_drvdata(dev, lmsensor_data);
> +
> +	adv_ec_init_hwmon_profile(profile, lmsensor_data);
> +
> +	lmsensor_data->hwmon_dev  =
> +		devm_hwmon_device_register_with_info(dev, "ahc1ec0.hwmon", lmsensor_data,
> +						     &ahc1ec0_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(lmsensor_data->hwmon_dev);
> +}
> +
> +static struct platform_driver adv_hwmon_drv = {
> +	.driver = {
> +		.name = "ahc1ec0-hwmon",
> +	},
> +	.probe = adv_ec_hwmon_probe,
> +};
> +module_platform_driver(adv_hwmon_drv);
> +
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:ahc1ec0-hwmon");
> +MODULE_DESCRIPTION("Advantech Embedded Controller HWMON Driver.");
> +MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
> +MODULE_AUTHOR("Jianfeng Dai <jianfeng.dai@advantech.com.cn>");
> +MODULE_VERSION("1.0");
> -- 
> 2.17.1
> 
