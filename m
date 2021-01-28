Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D19307945
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Jan 2021 16:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhA1POj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Jan 2021 10:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhA1POd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Jan 2021 10:14:33 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B66C061573;
        Thu, 28 Jan 2021 07:13:50 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id z36so1488504ooi.6;
        Thu, 28 Jan 2021 07:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oCzNee7Lz+W5ooM8cJ/i44KxsunkmaBg1QIkneSDMJ0=;
        b=VCaSZedjoMeZBYXyLdDT1NR5wB0FGnohGt7Am0zQcDQwN/BfS9HP8P8iy/cI2sr5O3
         SOwlB6dOZT9K+Xye5/hSn5mU5K2PB3kGhyryPFt1srwyJBzt9ztTQ5+OxAxPYimBjcFe
         DOKqpr256kAiToFv1Jh/ZYW79vKEWFfFb5Omk6DbSVPM486AT0FvJsMRXEzrxndxspmn
         Kc62gARI2odDJpnVj9ayVT9ZToDmgXxvxnmWbmxy80QNJTHFKX0cQWpd4lUXvCJngdBe
         uJX2Tfv8e4Km3jbafMkQKucpYTr1EM4E3Zw53Y6Bob2/eiq3WwqtkTMdgHEZCV5UGyOb
         vcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oCzNee7Lz+W5ooM8cJ/i44KxsunkmaBg1QIkneSDMJ0=;
        b=KhXJ9NZ8rYI6RQa+W5qytlQAq5scSk0D5UGdOOfGVH8xNj4skNpxcTMIgCxoRzw6to
         +4sBiPbQxA7L3LjUgkavOLtfWBm+bzOWAyKTwwUZuFM3GZkpwuvxIM+sQiS/h009d2Q5
         94TmlpaghDwFPKe9Uv+rXjFGNEIfN5dr1tSo6eWURVzdlUJpmsdz/+Q5n4WFn1EB6k1S
         XF88DS8g3m+x67noXBNd5c0RMM5CeAQ6tfGxS5O1gdso8xQLUJYW7IuJE0R71luerQ5n
         uE6jInYAECLwahyvvcfFrXQ0r50+yLsdYm0M8DNjYcgLP/DJATF6f/LpmG6zroOIznwg
         OaKA==
X-Gm-Message-State: AOAM530i4xdnX/7pPBMKZRiSEsQiaQm71mqmWREHsytat68wYqEuC9EG
        DpoUmhVCJ6xhZrFkv25F0hc=
X-Google-Smtp-Source: ABdhPJyWPIErgyHQnWwrCjNcoBvtFewlxOsbKfzUI+7xiOaVY2o0L0iaBPmgnAYFZz7E7Az5ohKulg==
X-Received: by 2002:a4a:cb87:: with SMTP id y7mr43771ooq.1.1611846828812;
        Thu, 28 Jan 2021 07:13:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k65sm1111838oia.19.2021.01.28.07.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 07:13:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v6 5/6] hwmon: ahc1ec0-hwmon: Add sub-device hwmon for
 Advantech embedded controller
To:     "Campion.Kang" <Campion.Kang@advantech.com.tw>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
 <20210118123749.4769-5-campion.kang@advantech.com.tw>
 <20210123163524.GA50825@roeck-us.net>
 <66338d379bb14c2fbd8a6507075384ce@Taipei11.ADVANTECH.CORP>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <449c46a0-f786-00da-6060-a64036ddfec0@roeck-us.net>
Date:   Thu, 28 Jan 2021 07:13:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <66338d379bb14c2fbd8a6507075384ce@Taipei11.ADVANTECH.CORP>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/28/21 2:28 AM, Campion.Kang wrote:
> Hello Guenter,
> 
> Thanks your review and suggestion. I will fix them. 
> One issue I am not clear, Documentation is missing, which document?
> Did you mean this file Documentation\devicetree\bindings\mfd\ahc1ec0.yaml? If yes, it submit in this patch "[PATCH v6 3/6] dt-bindings: mfd: ahc1ec0.yaml: Add Advantech embedded controller - AHC1EC0".
> Would you kindly give me more information? 
> 

Per Documentation/hwmon/submitting-patches.rst:

3. New drivers
--------------
...
* Document the driver in Documentation/hwmon/<driver_name>.rst.

Please read and follow that document. It will save us both a lot of time.

Thanks,
Guenter

> Best regards,
> Campion
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Sunday, January 24, 2021 12:35 AM
>> To: Campion.Kang <Campion.Kang@advantech.com.tw>
>> Cc: Lee Jones <lee.jones@linaro.org>; Rob Herring <robh+dt@kernel.org>;
>> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; Jean Delvare
>> <jdelvare@suse.com>; Wim Van Sebroeck <wim@linux-watchdog.org>;
>> linux-hwmon@vger.kernel.org; linux-watchdog@vger.kernel.org; AceLan Kao
>> <chia-lin.kao@canonical.com>
>> Subject: Re: [PATCH v6 5/6] hwmon: ahc1ec0-hwmon: Add sub-device hwmon
>> for Advantech embedded controller
>>
>> On Mon, Jan 18, 2021 at 08:37:48PM +0800, Campion Kang wrote:
>>> This is one of sub-device driver for Advantech embedded controller
>>> AHC1EC0. This driver provides sysfs ABI for Advantech related
>>> applications to monitor the system status.
>>>
>>> Changed since V5:
>>> 	- remove unnecessary header files
>>> 	- Using [devm_]hwmon_device_register_with_info() to register hwmon
>>> driver based on reviewer's suggestion
>>>
>>> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
>>> Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>>
>> checkpatch --strict says:
>>
>> total: 0 errors, 1 warnings, 10 checks, 683 lines checked
>>
>> The MAINTAINERS warning is irrelevant, but there are a number of
>> alignment and other style issues. Please fix those.
>>
>>> ---
>>>  drivers/hwmon/Kconfig         |  10 +
>>>  drivers/hwmon/Makefile        |   1 +
>>>  drivers/hwmon/ahc1ec0-hwmon.c | 660
>>> ++++++++++++++++++++++++++++++++++
>>
>> Documentation is missing.
>>
>>>  3 files changed, 671 insertions(+)
>>>  create mode 100644 drivers/hwmon/ahc1ec0-hwmon.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index
>>> 1ecf697d8d99..bfa007026679 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -2139,6 +2139,16 @@ config SENSORS_INTEL_M10_BMC_HWMON
>>>  	  sensors monitor various telemetry data of different components on
>> the
>>>  	  card, e.g. board temperature, FPGA core
>> temperature/voltage/current.
>>>
>>> +config SENSORS_AHC1EC0_HWMON
>>> +	tristate "Advantech AHC1EC0 Hardware Monitor Function"
>>> +	depends on MFD_AHC1EC0
>>> +	help
>>> +	  This driver provide support for the hardware monitoring
>> functionality
>>> +	  for Advantech AHC1EC0 embedded controller on the board.
>>> +
>>> +	  This driver provides the sysfs attributes for applications to monitor
>>> +	  the system status, including system temperatures, voltages, current.
>>> +
>>>  if ACPI
>>>
>>>  comment "ACPI drivers"
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
>>> 09a86c5e1d29..0c37747e8c4f 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
>>>  obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
>>>  obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
>>>  obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
>>> +obj-$(CONFIG_SENSORS_AHC1EC0_HWMON)	+= ahc1ec0-hwmon.o
>>>  obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
>>>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>>>  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>>> diff --git a/drivers/hwmon/ahc1ec0-hwmon.c
>>> b/drivers/hwmon/ahc1ec0-hwmon.c new file mode 100644 index
>>> 000000000000..688f07e6a6e0
>>> --- /dev/null
>>> +++ b/drivers/hwmon/ahc1ec0-hwmon.c
>>> @@ -0,0 +1,660 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * HWMON Driver for Advantech Embedded Controller chip AHC1EC0
>>> + *
>>> + * Copyright 2020, Advantech IIoT Group
>>> + *
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/mfd/ahc1ec0.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/property.h>
>>> +#include <linux/string.h>
>>> +#include <linux/types.h>
>>> +
>>> +struct ec_hwmon_attrs {
>>> +	const char		*name;
>>> +	umode_t			mode;
>>> +	int (*read)(struct device *dev, long *val); };
>>> +
>>> +struct adv_hwmon_profile {
>>> +	int offset;
>>> +	unsigned long resolution, resolution_vin, resolution_sys,
>> resolution_curr, resolution_power;
>>> +	unsigned long r1, r1_vin, r1_sys, r1_curr, r1_power;
>>> +	unsigned long r2, r2_vin, r2_sys, r2_curr, r2_power;
>>> +	int hwmon_in_list_cnt;
>>> +	int temp_list_cnt;
>>> +	int *hwmon_in_list;
>>> +	int *temp_list;
>>> +};
>>> +
>>> +struct ec_hwmon_data {
>>> +	struct device *dev;
>>> +	struct device *hwmon_dev;
>>> +	struct adv_ec_platform_data *adv_ec_data;
>>> +	unsigned long temperature[3];
>>> +	unsigned long ec_current[5];
>>> +	unsigned long power[5];
>>> +	unsigned long voltage[7];
>>> +
>>> +	struct ec_hw_pin_table pin_tbl;
>>> +	struct ec_smbuso_em0 ec_smboem0;
>>> +	struct adv_hwmon_profile *profile;
>>> +};
>>> +
>>> +static int get_ec_in_vbat_input(struct device *dev, long *val);
>>> +static int get_ec_in_v5_input(struct device *dev, long *val); static
>>> +int get_ec_in_v12_input(struct device *dev, long *val); static int
>>> +get_ec_in_vcore_input(struct device *dev, long *val); static int
>>> +get_ec_current1_input(struct device *dev, long *val); static int
>>> +get_ec_cpu_temp(struct device *dev, long *val); static int
>>> +get_ec_sys_temp(struct device *dev, long *val);
>>> +
>>
>> Please reorder code to not require those declarations.
>>
>>> +const struct ec_hwmon_attrs ec_hwmon_in_attr_template[] = {
>>> +	{"VBAT",	0444, get_ec_in_vbat_input},	// in1
>>> +	{"5VSB",	0444, get_ec_in_v5_input},	// in2
>>> +	{"Vin",		0444, get_ec_in_v12_input},	// in3 (== in8)
>>> +	{"VCORE",	0444, get_ec_in_vcore_input},	// in4
>>> +	{"Vin1",	0444, NULL},	// in5
>>> +	{"Vin2",	0444, NULL},	// in6
>>> +	{"System Voltage", 0444, NULL},	// in7
>>> +	{"Current",	0444, get_ec_current1_input},
>>> +};
>>> +
>>> +const struct ec_hwmon_attrs ec_temp_attrs_template[] = {
>>> +	{"CPU Temp",	0444, get_ec_cpu_temp},
>>> +	{"System Temp",	0444, get_ec_sys_temp},
>>> +};
>>> +
>>> +enum ec_hwmon_in_type {
>>> +	EC_HWMON_IN_VBAT,
>>> +	EC_HWMON_IN_5VSB,
>>> +	EC_HWMON_IN_12V,
>>> +	EC_HWMON_IN_VCORE,
>>> +	EC_HWMON_IN_VIN1,
>>> +	EC_HWMON_IN_VIN2,
>>> +	EC_HWMON_IN_SYS_VOL,
>>> +	EC_HWMON_IN_CURRENT,
>>> +};
>>> +
>>> +enum ec_temp_type {
>>> +	EC_TEMP_CPU,
>>> +	EC_TEMP_SYS,
>>> +};
>>> +
>>> +static int hwmon_in_list_0[] = {
>>> +	EC_HWMON_IN_VBAT,
>>> +	EC_HWMON_IN_5VSB,
>>> +	EC_HWMON_IN_12V,
>>> +	EC_HWMON_IN_VCORE,
>>> +	EC_HWMON_IN_CURRENT,
>>> +};
>>> +
>>> +static int hwmon_in_list_1[] = {
>>> +	EC_HWMON_IN_VBAT,
>>> +	EC_HWMON_IN_5VSB,
>>> +	EC_HWMON_IN_12V,
>>> +	EC_HWMON_IN_VCORE,
>>> +};
>>> +
>>> +static int temp_list_0[] = {
>>> +	EC_TEMP_CPU,
>>> +};
>>> +
>>> +static int temp_list_1[] = {
>>> +	EC_TEMP_CPU,
>>> +	EC_TEMP_SYS,
>>> +};
>>> +
>>> +static struct adv_hwmon_profile advec_profile[] = {
>>> +	/*
>>> +	 * TPC-8100TR, TPC-651T-E3AE, TPC-1251T-E3AE, TPC-1551T-E3AE,
>>> +	 * TPC-1751T-E3AE, TPC-1051WP-E3AE, TPC-1551WP-E3AE,
>> TPC-1581WP-433AE,
>>> +	 * TPC-1782H-433AE, UNO-1483G-434AE, UNO-2483G-434AE,
>> UNO-3483G-374AE,
>>> +	 * UNO-2473G, UNO-2484G-6???AE, UNO-2484G-7???AE,
>> UNO-3283G-674AE,
>>> +	 * UNO-3285G-674AE
>>
>> What is all this ? Please add a brief explanation (affected hardware ? chips ?)
>>
>>> +	 * [0] AHC1EC0_HWMON_PRO_TEMPLATE
>>> +	 */
>>> +	{
>>> +		.resolution = 2929,
>>> +		.r1 = 1912,
>>> +		.r2 = 1000,
>>> +		.offset = 0,
>>> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_0),
>>> +		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
>>> +		.hwmon_in_list = hwmon_in_list_0,
>>> +		.temp_list = temp_list_0,
>>> +	},
>>> +	/*
>>> +	 * TPC-B500-6??AE, TPC-5???T-6??AE, TPC-5???W-6??AE,
>> TPC-B200-???AE,
>>> +	 * TPC-2???T-???AE, TPC-2???W-???AE
>>> +	 * [1] AHC1EC0_HWMON_PRO_TPC5XXX
>>> +	 */
>>> +	{
>>> +		.resolution = 2929,
>>> +		.r1 = 1912,
>>> +		.r2 = 1000,
>>> +		.offset = 0,
>>> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
>>> +		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
>>> +		.hwmon_in_list = hwmon_in_list_1,
>>> +		.temp_list = temp_list_0,
>>> +	},
>>> +	/* PR/VR4
>>> +	 * [2] AHC1EC0_HWMON_PRO_PRVR4
>>> +	 */
>>> +	{
>>> +		.resolution = 2929,
>>> +		.r1 = 1912,
>>> +		.r2 = 1000,
>>> +		.offset = 0,
>>> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
>>> +		.temp_list_cnt = ARRAY_SIZE(temp_list_1),
>>> +		.hwmon_in_list = hwmon_in_list_1,
>>> +		.temp_list = temp_list_1,
>>> +	},
>>> +	/* UNO-2271G-E22AE/E23AE/E022AE/E023AE,UNO-420
>>> +	 * [3] AHC1EC0_HWMON_PRO_UNO2271G
>>> +	 */
>>> +	{
>>> +		.resolution = 2929,
>>> +		.r1 = 1912,
>>> +		.r2 = 1000,
>>> +		.offset = 0,
>>> +		.hwmon_in_list_cnt = ARRAY_SIZE(hwmon_in_list_1),
>>> +		.temp_list_cnt = ARRAY_SIZE(temp_list_0),
>>> +		.hwmon_in_list = hwmon_in_list_1,
>>> +		.temp_list = temp_list_0,
>>> +	},
>>> +};
>>> +
>>> +static void adv_ec_init_hwmon_profile(u32 profile, struct
>>> +ec_hwmon_data *lmsensor_data) {
>>> +	int i;
>>> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
>>> +	struct adv_ec_platform_data *adv_ec_data =
>> lmsensor_data->adv_ec_data;
>>> +	struct ec_dynamic_table *dym_tbl = adv_ec_data->dym_tbl;
>>> +
>>> +	if (profile >= ARRAY_SIZE(advec_profile))
>>> +		return;
>>
>> This can not happen. Please no unnecessary error checks.
>>
>>> +
>>> +	lmsensor_data->profile = &advec_profile[profile];
>>> +
>>> +	for (i = 0; i < EC_MAX_TBL_NUM ; i++) {
>>> +		switch (dym_tbl[i].device_id) {
>>> +		case EC_DID_CMOSBAT:
>>> +			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vbat[1] = 1;
>>> +			break;
>>> +		case EC_DID_CMOSBAT_X2:
>>> +			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vbat[1] = 2;
>>> +			break;
>>> +		case EC_DID_CMOSBAT_X10:
>>> +			ptbl->vbat[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vbat[1] = 10;
>>> +			break;
>>> +		case EC_DID_5VS0:
>>> +		case EC_DID_5VS5:
>>> +			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->v5[1] = 1;
>>> +			break;
>>> +		case EC_DID_5VS0_X2:
>>> +		case EC_DID_5VS5_X2:
>>> +			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->v5[1] = 2;
>>> +			break;
>>> +		case EC_DID_5VS0_X10:
>>> +		case EC_DID_5VS5_X10:
>>> +			ptbl->v5[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->v5[1] = 10;
>>> +			break;
>>> +		case EC_DID_12VS0:
>>> +			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->v12[1] = 1;
>>> +			break;
>>> +		case EC_DID_12VS0_X2:
>>> +			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->v12[1] = 2;
>>> +			break;
>>> +		case EC_DID_12VS0_X10:
>>> +			ptbl->v12[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->v12[1] = 10;
>>> +			break;
>>> +		case EC_DID_VCOREA:
>>> +		case EC_DID_VCOREB:
>>> +			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vcore[1] = 1;
>>> +			break;
>>> +		case EC_DID_VCOREA_X2:
>>> +		case EC_DID_VCOREB_X2:
>>> +			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vcore[1] = 2;
>>> +			break;
>>> +		case EC_DID_VCOREA_X10:
>>> +		case EC_DID_VCOREB_X10:
>>> +			ptbl->vcore[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vcore[1] = 10;
>>> +			break;
>>> +		case EC_DID_DC:
>>> +			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vdc[1] = 1;
>>> +			break;
>>> +		case EC_DID_DC_X2:
>>> +			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vdc[1] = 2;
>>> +			break;
>>> +		case EC_DID_DC_X10:
>>> +			ptbl->vdc[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->vdc[1] = 10;
>>> +			break;
>>> +		case EC_DID_CURRENT:
>>> +			ptbl->ec_current[0] = dym_tbl[i].hw_pin_num;
>>> +			ptbl->ec_current[1] = 1;
>>> +			break;
>>> +		case EC_DID_SMBOEM0:
>>> +			lmsensor_data->ec_smboem0.hw_pin_num =
>> dym_tbl[i].hw_pin_num;
>>> +			break;
>>> +		default:
>>> +			break;
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static int get_ec_in_vbat_input(struct device *dev, long *val) {
>>> +	unsigned int temp = 0;
>>> +	unsigned long voltage = 0;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
>>> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	temp = read_ad_value(adv_ec_data, ptbl->vbat[0], ptbl->vbat[1]);
>>> +
>>> +	if (profile->r2 != 0)
>>> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
>>> +
>>> +	if (profile->resolution != 0)
>>> +		voltage =  temp * profile->resolution / 1000 / 1000;
>>> +
>>> +	if (profile->offset != 0)
>>> +		voltage += (int)profile->offset * 100;
>>> +
>>> +	lmsensor_data->voltage[0] = 10 * voltage;
>>> +
>>> +	*val = lmsensor_data->voltage[0];
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_ec_in_v5_input(struct device *dev, long *val) {
>>> +	unsigned int temp;
>>> +	unsigned long voltage = 0;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>
>> Please no empty lines in variable declarations.
>>
>>> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
>>> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	temp = read_ad_value(adv_ec_data, ptbl->v5[0], ptbl->v5[1]);
>>> +
>>> +	if (profile->r2 != 0)
>>> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
>>> +
>>> +	if (profile->resolution != 0)
>>> +		voltage =  temp * profile->resolution / 1000 / 1000;
>>> +
>>> +	if (profile->offset != 0)
>>> +		voltage += (int)profile->offset * 100;
>>> +
>>> +	lmsensor_data->voltage[1] = 10 * voltage;
>>> +
>>> +	*val = lmsensor_data->voltage[1];
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_ec_in_v12_input(struct device *dev, long *val) {
>>> +	int temp;
>>> +	unsigned long voltage = 0;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
>>> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	temp = read_ad_value(adv_ec_data, ptbl->v12[0], ptbl->v12[1]);
>>> +	if (temp == -1)
>>> +		temp = read_ad_value(adv_ec_data, ptbl->vdc[0], ptbl->vdc[1]);
>>> +
>>> +	if (profile->r2 != 0)
>>> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
>>> +
>>> +	if (profile->resolution != 0)
>>> +		voltage =  temp * profile->resolution / 1000 / 1000;
>>> +
>>> +	if (profile->offset != 0)
>>> +		voltage += profile->offset * 100;
>>> +
>>> +	lmsensor_data->voltage[2] = 10 * voltage;
>>> +
>>> +	*val = lmsensor_data->voltage[2];
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_ec_in_vcore_input(struct device *dev, long *val) {
>>> +	int temp;
>>> +	unsigned int voltage = 0;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
>>> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	temp = read_ad_value(adv_ec_data, ptbl->vcore[0], ptbl->vcore[1]);
>>> +
>>> +	if (profile->r2 != 0)
>>> +		voltage = temp * (profile->r1 + profile->r2) / profile->r2;
>>> +
>>> +	if (profile->resolution != 0)
>>> +		voltage = temp * profile->resolution / 1000 / 1000;
>>> +
>>> +	if (profile->offset != 0)
>>> +		voltage += profile->offset * 100;
>>> +
>>> +	lmsensor_data->voltage[3] = 10 * voltage;
>>> +
>>> +	*val = lmsensor_data->voltage[3];
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_ec_current1_input(struct device *dev, long *val) {
>>> +	int temp;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	struct ec_hw_pin_table *ptbl = &lmsensor_data->pin_tbl;
>>> +	struct adv_hwmon_profile *profile = lmsensor_data->profile;
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	temp = read_ad_value(adv_ec_data, ptbl->ec_current[0],
>>> +ptbl->ec_current[1]);
>>> +
>>> +	if (profile->r2 != 0)
>>> +		temp = temp * (profile->r1 + profile->r2) / profile->r2;
>>> +
>>> +	if (profile->resolution != 0)
>>> +		temp = temp * profile->resolution / 1000 / 1000;
>>> +
>>> +	if (profile->offset != 0)
>>> +		temp += profile->offset * 100;
>>> +
>>> +	lmsensor_data->ec_current[3] = 10 * temp;
>>> +
>>> +	*val = lmsensor_data->ec_current[3];
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_ec_cpu_temp(struct device *dev, long *val) {
>>> +	#define EC_ACPI_THERMAL1_REMOTE_TEMP 0x61
>>
>> Pease move defines to top of file. Also, please use
>>
>> #define<space>IDENTIFER<tab>value
>>
>>> +
>>> +	unsigned char value;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	read_acpi_value(adv_ec_data, EC_ACPI_THERMAL1_REMOTE_TEMP,
>> &value);
>>
>> This is not an appropriate function name for a device specific exported
>> function. The function name should have a prefix.
>>
>> Also, the error code from read_acpi_value needs to be checked and
>> handled.
>>
>>> +	*val = 1000 * value;
>>> +	return 0;
>>> +}
>>> +
>>> +static int get_ec_sys_temp(struct device *dev, long *val) {
>>> +	#define EC_ACPI_THERMAL1_LOCAL_TEMP 0x60
>>> +
>>> +	unsigned char value;
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +	struct adv_ec_platform_data *adv_ec_data =
>>> +lmsensor_data->adv_ec_data;
>>> +
>>> +	read_acpi_value(adv_ec_data, EC_ACPI_THERMAL1_LOCAL_TEMP,
>> &value);
>>> +	*val = 1000 * value;
>>> +	return 0;
>>> +}
>>> +
>>> +
>>> +static int
>>> +ahc1ec0_read_in(struct device *dev, u32 attr, int channel, long *val)
>>> +{
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	if (!(lmsensor_data && lmsensor_data->profile))
>>> +		return -EINVAL;
>>
>> This can not happen. Also, please don't use double negations.
>>
>>> +
>>> +	if (attr == hwmon_in_input &&
>>> +		lmsensor_data->profile->hwmon_in_list_cnt > channel) {
>>
>> This is unnecessary. Again, please drop all those unnecessary checks.
>>
>>> +		int index = lmsensor_data->profile->hwmon_in_list[channel];
>>> +		const struct ec_hwmon_attrs *ec_hwmon_attr =
>>> +&ec_hwmon_in_attr_template[index];
>>> +
>>> +		return ec_hwmon_attr->read(dev, val);
>>> +	}
>>> +
>>> +	return -EOPNOTSUPP;
>>> +}
>>> +
>>> +static int
>>> +ahc1ec0_read_temp(struct device *dev, u32 attr, int channel, long
>>> +*val) {
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	if (!(lmsensor_data && lmsensor_data->profile))
>>> +		return -EINVAL;
>>> +
>>> +	switch (attr) {
>>> +	case hwmon_temp_input:
>>> +		if (lmsensor_data->profile->temp_list_cnt > channel) {
>>> +			int index = lmsensor_data->profile->temp_list[channel];
>>> +			const struct ec_hwmon_attrs *devec_hwmon_attr =
>>> +				&ec_temp_attrs_template[index];
>>> +
>>> +			return devec_hwmon_attr->read(dev, val);
>>> +		}
>>> +		return -EOPNOTSUPP;
>>> +	case hwmon_temp_crit:
>>> +		// both CPU temp and System temp are all this value
>>> +		*val = 100000;
>>> +		return 0;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +}
>>> +
>>> +static int
>>> +ahc1ec0_read_string(struct device *dev,
>>> +					enum hwmon_sensor_types type,
>>> +					u32 attr,
>>> +					int channel,
>>> +					const char **str)
>>> +{
>>> +	struct ec_hwmon_data *lmsensor_data = dev_get_drvdata(dev);
>>> +
>>> +	if (!(lmsensor_data && lmsensor_data->profile))
>>> +		return -EINVAL;
>>> +
>>> +	if ((type == hwmon_in && attr == hwmon_in_label) &&
>>> +		(lmsensor_data->profile->hwmon_in_list_cnt > channel)) {
>>
>> lmsensor_data->profile->hwmon_in_list_cnt > channel is unnecessary, and
>> the () around it as well.
>>
>>> +		int index = lmsensor_data->profile->hwmon_in_list[channel];
>>> +		const struct ec_hwmon_attrs *ec_hwmon_attr =
>>> +&ec_hwmon_in_attr_template[index];
>>> +
>>> +		*str = ec_hwmon_attr->name;
>>> +		return 0;
>>> +	}
>>> +
>>> +	if ((type == hwmon_temp && attr == hwmon_temp_label) &&
>>> +		(lmsensor_data->profile->temp_list_cnt > channel)) {
>>> +		int index = lmsensor_data->profile->temp_list[channel];
>>> +		const struct ec_hwmon_attrs *ec_hwmon_attr =
>>> +&ec_temp_attrs_template[index];
>>> +
>>> +		*str = ec_hwmon_attr->name;
>>> +		return 0;
>>> +	}
>>> +
>>> +	return -EOPNOTSUPP;
>>> +}
>>> +
>>> +static int
>>> +ahc1ec0_read(struct device *dev,
>>> +			enum hwmon_sensor_types type,
>>> +			u32 attr,
>>> +			int channel,
>>> +			long *val)
>>
>> Too many line splits. Please reduce to minuimum required.
>>
>>> +{
>>> +	switch (type) {
>>> +	case hwmon_in:
>>> +		return ahc1ec0_read_in(dev, attr, channel, val);
>>> +	case hwmon_temp:
>>> +		return ahc1ec0_read_temp(dev, attr, channel, val);
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +}
>>> +
>>> +static umode_t
>>> +ec_hwmon_in_visible(const void *data, u32 attr, int channel) {
>>> +	switch (attr) {
>>> +	case hwmon_in_input:
>>> +	case hwmon_in_label:
>>> +		return 0444;
>>> +	default:
>>> +		return 0;
>>> +	}
>>
>> The code needs to take channel into account, and return 0 if a voltage
>> sensor is not supported.
>>
>>> +}
>>> +
>>> +static umode_t
>>> +ec_temp_in_visible(const void *data, u32 attr, int channel) {
>>> +	switch (attr) {
>>> +	case hwmon_temp_input:
>>> +	case hwmon_temp_crit:
>>> +	case hwmon_temp_label:
>>> +		return 0444;
>>> +	default:
>>> +		return 0;
>>> +	}
>>
>> The code needs to take channel into account, and return 0 if the second
>> temperature sensor is not supported.
>>
>>> +}
>>> +
>>> +static umode_t
>>> +ahc1ec0_is_visible(const void *data,
>>> +					enum hwmon_sensor_types type, u32 attr, int
>> channel)
>>
>> Now this is a really odd (nd unnecessary) continuation line.
>>
>>> +{
>>> +	switch (type) {
>>> +	case hwmon_in:
>>> +		return ec_hwmon_in_visible(data, attr, channel);
>>> +	case hwmon_temp:
>>> +		return ec_temp_in_visible(data, attr, channel);
>>> +	default:
>>> +		return 0;
>>> +	}
>>> +}
>>> +
>>> +static const u32 ahc1ec0_in_config[] = {
>>> +	HWMON_I_INPUT | HWMON_I_LABEL,
>>> +	HWMON_I_INPUT | HWMON_I_LABEL,
>>> +	HWMON_I_INPUT | HWMON_I_LABEL,
>>> +	HWMON_I_INPUT | HWMON_I_LABEL,
>>> +	0
>>> +};
>>> +
>>> +static const struct hwmon_channel_info ahc1ec0_in = {
>>> +	.type = hwmon_in,
>>> +	.config = ahc1ec0_in_config,
>>> +};
>>> +
>>> +static const u32 ahc1ec0_temp_config[] = {
>>> +	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL,
>>
>> I don't think this works as intended. it only lists one temperature sensor, but
>> the code clearly suggests that there can be two.
>>
>>> +	0
>>> +};
>>> +
>>> +static const struct hwmon_channel_info ahc1ec0_temp = {
>>> +	.type = hwmon_temp,
>>> +	.config = ahc1ec0_temp_config,
>>> +};
>>> +
>>> +static const struct hwmon_channel_info *ahc1ec0_info[] = {
>>> +	&ahc1ec0_in,
>>> +	&ahc1ec0_temp,
>>> +	NULL
>>> +};
>>> +
>>> +static const struct hwmon_ops ahc1ec0_hwmon_ops = {
>>> +	.is_visible = ahc1ec0_is_visible,
>>> +	.read = ahc1ec0_read,
>>> +	.read_string = ahc1ec0_read_string,
>>> +};
>>> +
>>> +static const struct hwmon_chip_info ahc1ec0_chip_info = {
>>> +	.ops = &ahc1ec0_hwmon_ops,
>>> +	.info = ahc1ec0_info,
>>> +};
>>> +
>>> +static int adv_ec_hwmon_probe(struct platform_device *pdev) {
>>> +	int ret;
>>> +	u32 profile;
>>> +	struct device *dev = &pdev->dev;
>>> +	struct adv_ec_platform_data *adv_ec_data;
>>> +	struct ec_hwmon_data *lmsensor_data;
>>> +
>>> +	adv_ec_data = dev_get_drvdata(dev->parent);
>>> +	if (!adv_ec_data)
>>> +		return -EINVAL;
>>> +
>>> +	ret = device_property_read_u32(dev->parent,
>> "advantech,hwmon-profile", &profile);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "get hwmon-profile failed! (%d)", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	if (!(profile < ARRAY_SIZE(advec_profile))) {
>>
>> Please no double negations.
>> 	if (profile >= ARRAY_SIZE(advec_profile)) is much easier to understand.
>>
>>> +		dev_err(dev, "not support hwmon profile(%d)!\n", profile);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	lmsensor_data = devm_kzalloc(dev, sizeof(struct ec_hwmon_data),
>> GFP_KERNEL);
>>> +	if (!lmsensor_data)
>>> +		return -ENOMEM;
>>> +
>>> +	lmsensor_data->adv_ec_data = adv_ec_data;
>>> +	lmsensor_data->dev = dev;
>>> +	dev_set_drvdata(dev, lmsensor_data);
>>> +
>>> +	adv_ec_init_hwmon_profile(profile, lmsensor_data);
>>> +
>>> +	lmsensor_data->hwmon_dev  =
>> devm_hwmon_device_register_with_info(dev,
>>> +			"ahc1ec0.hwmon", lmsensor_data, &ahc1ec0_chip_info,
>> NULL);
>>> +
>>> +	return PTR_ERR_OR_ZERO(lmsensor_data->hwmon_dev);
>>> +}
>>> +
>>> +static struct platform_driver adv_hwmon_drv = {
>>> +	.driver = {
>>> +		.name = "ahc1ec0-hwmon",
>>> +	},
>>> +	.probe = adv_ec_hwmon_probe,
>>> +};
>>> +module_platform_driver(adv_hwmon_drv);
>>> +
>>> +MODULE_LICENSE("Dual BSD/GPL");
>>> +MODULE_ALIAS("platform:ahc1ec0-hwmon");
>>> +MODULE_DESCRIPTION("Advantech Embedded Controller HWMON
>> Driver.");
>>> +MODULE_AUTHOR("Campion Kang <campion.kang@advantech.com.tw>");
>>> +MODULE_AUTHOR("Jianfeng Dai <jianfeng.dai@advantech.com.cn>");
>>> +MODULE_VERSION("1.0");

