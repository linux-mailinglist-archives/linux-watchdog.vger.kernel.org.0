Return-Path: <linux-watchdog+bounces-4185-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE82B43A65
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 13:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A875188F9FE
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 11:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736992D8763;
	Thu,  4 Sep 2025 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAXXm/pt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDD199FAB
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986049; cv=none; b=t44fyarD3q5d0P+FZNCqqQ02TsYuSSdIdYXjpDhGj6s12mHDP1YQTnPVOE5nmb4GHrFgAmbYbiwo5TB+ctnLwxY8TCqfUPzunuDJRrDaRT4rxV6Zj/lMUFQuVYkwSYxB3OeIkUkZK3QXljg4Z+oUOpdmcfsY9a6cxUlMD4uY7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986049; c=relaxed/simple;
	bh=y4uU4DStFdyRet9AcYiazndrVi6RmdR0kimclhECy6o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CeQMNqaGeAKuUjoSJhxMgvqcJNQDop8VCE8qyKf57geeVXU9AVqf13O1u6Yz0nqpIOeGS7DEjsnlt+XO0cWdP3Gp4fOt6Po957H6hLzk6nZg3In2crc3WVKp9cA5eMEXhZa1GvPuTCJcJybXXdrDpVTWsOdgQjt2lC0ykNU4D2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAXXm/pt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7dv013476
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 11:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z7m0o38hbU9AqKGZ4FuuaCFFD5bgtOtsvABF1Bvah8=; b=RAXXm/ptWnxJyvcX
	v1eBBSbyN/JTB0EL5QKFWzGqGItY7pmBvsDlLg+iuYeTUuUOvttWODcbwJAH7VV8
	vICORRep524tmcvJ38tE07nTLbhTEG+y45DG1b2YKPFIivx2qp8uhGG3MwBycPDK
	BoUJZV1EelCu8Hkf9L2XXyBqzdAtgwv6ax5hQpFrNiv8Ps3hUehg1PYSniO+6UtC
	Rmyt2Qjlh2RcrOApnmeMBXYkHVcMq8MH733QDU8TAdYs+B6z+NJGiT2U6JM7m6ig
	EFszQO1+lKdlqwlfdT1MgU7/0we9d98qxfLhQ4PztgdqEjfPoa09muQa07GvpQVD
	zbgDEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyb7wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 11:40:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32b58dd475eso991043a91.1
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 04:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986045; x=1757590845;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1z7m0o38hbU9AqKGZ4FuuaCFFD5bgtOtsvABF1Bvah8=;
        b=tI6efBD4JYVNTPf3jdR9CT70JCSWcs3513IuxDzL7yYGnEzcTnZmssbB88iO4s7wx8
         6dLXaXpJ3I/BRRWwa94aFwsNykMAcgcUWb/pQckg1r0SpwxajTN2UP7ZFDrxKbO2BFQ1
         iKmzV6/RgyDJF38+ceHfX7tQj88SP6YxSTlz1aoqlWpq3xfg0+6e9/zSKD1r6Pd8Wyh6
         h6MWlzJnkiRtCA3ZCH+1v6axfzsrR/WDVm4IiIoMUHPMMQ2xJjH81anl8tmim/eE2Zjz
         RHaDH0CSp7na/sK6QJ4oyW9OXg91Bwxzc/Hm1D1N+6H1xIEyIr9gT0AgkoegPH1wGMCU
         kDRg==
X-Forwarded-Encrypted: i=1; AJvYcCXGJVLE/THBkQ7cRCI5mSPt0RGRSITezYzJ60uY0fFMxJNXcf6iDZfaDfQPuRA6std8kgIZBL+B2jFwSdJHcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/C9utlbqkCIQhVoGV/MzbpLV0mUTAcqvn5mGV9BzakkRVFuN
	iXPqqHz2prgemWgfMYIehwMJDdPQmZqyKShM5NXXmTOBN1yigw52u7tMejkoVMdqirm6qSfkd2e
	liwJnS9z+6KMvbP1rNwSLaohvJNeKe/Nk0+iD72lk7tYVkGst8tRpHlpOH1XrtjxShYCAmg==
X-Gm-Gg: ASbGncsrcJHlFPzmsA0WDNvYtYrtgxuVvBvje9tTE+qSUz33gYsc6C5o0sHpxIJXjr8
	BrFMFSK8T5hyxvxPwTg6slCo+jvqt/eZ2qtg7Xkq8HId8cXHZ1HYWx3vpL1DaZp57E1bQ93H0R4
	OIvV9HtpiUMWaSliqQEf3pY6nFWshnVFmfRmwpmJkbbevrAjOZ2qb8N/kUflzd+3bw3FhV26ef5
	RVdadQdAt98Tn0HWGxCfdyRl2oiJkl3rSsKNFYIj21lHb+/r04WeBGyZPTkcxjp8zYaNhTjns4A
	KwgJvC+pNzXSHL3xJ08p9TNBlTm5TUCD6Bte1Bi42/lNnangkaFMxFQnLGIAfbo7n2hDDiU+oe1
	PClNLl1I=
X-Received: by 2002:a17:90b:39cd:b0:32b:b26e:1576 with SMTP id 98e67ed59e1d1-32bb26e2980mr285563a91.37.1756986045393;
        Thu, 04 Sep 2025 04:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMFNOMLLYtgWEqcqOq6EVf91r655xof1zYJbYaf62p1HLzxciYIZxP4GW3srcr5KRaLqcL0Q==
X-Received: by 2002:a17:90b:39cd:b0:32b:b26e:1576 with SMTP id 98e67ed59e1d1-32bb26e2980mr285519a91.37.1756986044844;
        Thu, 04 Sep 2025 04:40:44 -0700 (PDT)
Received: from [192.168.215.112] ([152.57.118.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fa7484ec5sm4065312a12.49.2025.09.04.04.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:40:44 -0700 (PDT)
Message-ID: <7276d39b-a514-4265-a125-7e08f364f979@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 17:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] watchdog: Add driver for Gunyah Watchdog
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250903-gunyah_watchdog-v1-2-3ae690530e4b@oss.qualcomm.com>
 <mfvuoslj27mbayypzr3wuagrq3p5wzelklgveedhwrxiaavwxy@7ipv2tup6oou>
Content-Language: en-US
In-Reply-To: <mfvuoslj27mbayypzr3wuagrq3p5wzelklgveedhwrxiaavwxy@7ipv2tup6oou>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b97abe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EtPCCmwehmAcwtUnapKH4g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Y2IgW4ZSIErcYl4phlAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qMIkJW8btM2z5dOMlcWYQIreoMbyiIv0
X-Proofpoint-ORIG-GUID: qMIkJW8btM2z5dOMlcWYQIreoMbyiIv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX8Mgl9KvOljhu
 x8ZJBKgCHMqaJBcPBPF2f75b1/03h1Lg4P/JwQO+W3tSnpQh+r3ramp8p9620sGDgWMf4fnCpLo
 RUFLr6uifX7z/Jx3AftR5vCOFBcia64Of0dwfYCXzHoBhXS4jUtE58NNYvLFgdsWDi2PNYWEk8h
 U+HR2EQmBGDIR0Q20lMCCPcHvcCH/6uaoR0UvdqXR+ywvFLLqkyuI8knSrWhI6PwgECfR845InM
 Mjau/DEhSj1ISl9U8/jn849ekJIhPKspV3EWamClsIPwm0LSEjMl707KPntqOioFb1l/8Rww2Zj
 JqXx9pwSFNYNR3Ob01T3Qu62BpVvBSY1ilyhIXmO7LzfOvbfbQzV4sP5/QCmoqO/HXKxFiIcKQT
 tC7XdbIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101


On 9/4/2025 1:43 AM, Bjorn Andersson wrote:
> On Wed, Sep 03, 2025 at 07:34:00PM +0000, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput<hrishabh.rajput@oss.qualcomm.com>
>>
>> Add driver to support the SMC-based watchdog timer provided by the
>> Gunyah Hypervisor.
>>
> Start the commit message with a problem description, end with a
> technical description of the solution. I.e. move this paragraph down.


Thanks, that would make more sense. Will rearrange this.

>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>> through MMIO is not available. Depending on the hypervisor
>> configuration, the watchdog is either fully emulated or exposed via
>> ARM's SMC Calling Conventions (SMCCC) through the Vendor Specific
>> Hypervisor Service Calls space.
>>
>> When the SMC-based interface is enabled, a device tree overlay is used
>> to provide the pretimeout interrupt configuration.
>>
>> Signed-off-by: Hrishabh Rajput<hrishabh.rajput@oss.qualcomm.com>
> [..]
>> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
> [..]
>> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
>> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
>> +
>> +/* SMCCC function IDs for watchdog operations */
>> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
>> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
>> +#define GUNYAH_WDT_PING       GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
> Uneven indentation.


This crept in somehow. Will fix it. Thanks.

>> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
>> +
>> +/*
>> + * Control values for GUNYAH_WDT_CONTROL.
>> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
>> + * then the watchdog is enabled and vice versa.
>> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
>> + * it's expected to be 1.
>> + */
>> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
>> +#define WDT_CTRL_DISABLE BIT(1)
>> +
>> +struct gunyah_wdt {
>> +	unsigned int pretimeout_irq;
> This is only used momentarily in gunyah_wdt_probe(), make it a local
> variable.
>> +	struct watchdog_device wdd;
> Which means that gunyah_wdt is just watchdog_device, so you can drop
> gunyah_wdt completely, and put wdd directly in drvdata.


That would definitely be a better way to do it. Thanks.

>> +};
>> +
> [..]
>> +static int __init gunyah_wdt_init(void)
>> +{
>> +	return platform_driver_register(&gunyah_wdt_driver);
>> +}
>> +
>> +module_init(gunyah_wdt_init);
> module_platform_driver(gunyah_wdt_driver);


This is intentional. I intend to keep this module persistent. No 
module_exit(gunyah_wdt_exit).

>> +
>> +MODULE_DESCRIPTION("Gunyah Watchdog Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/gunyah_errno.h b/include/linux/gunyah_errno.h
>> new file mode 100644
>> index 000000000000..518228e333bd
>> --- /dev/null
>> +++ b/include/linux/gunyah_errno.h
>> @@ -0,0 +1,77 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
> Isn't this content solely used from within gunyah_wdt.c? Why is it a
> separate header file? Just move it into the c-file.
> Regards,
> Bjorn


This header file is partially taken from [1] and I have only renamed it 
to gh_errno.h.

The error codes are not specific to watchdog and we have other drivers 
in the patch series [2] (which [1] is a part of) that would be using this.

[1] 
https://lore.kernel.org/all/20240222-gunyah-v17-3-1e9da6763d38@quicinc.com/

[2] 
https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/

Thanks,

Hrishabh

>> +
>> +#ifndef _LINUX_GUNYAH_ERRNO_H
>> +#define _LINUX_GUNYAH_ERRNO_H
>> +
>> +#include <linux/errno.h>
>> +
>> +enum gunyah_error {
>> +	GUNYAH_ERROR_OK				= 0,
>> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
>> +	GUNYAH_ERROR_RETRY			= -2,
>> +
>> +	GUNYAH_ERROR_ARG_INVAL			= 1,
>> +	GUNYAH_ERROR_ARG_SIZE			= 2,
>> +	GUNYAH_ERROR_ARG_ALIGN			= 3,
>> +
>> +	GUNYAH_ERROR_NOMEM			= 10,
>> +
>> +	GUNYAH_ERROR_ADDR_OVFL			= 20,
>> +	GUNYAH_ERROR_ADDR_UNFL			= 21,
>> +	GUNYAH_ERROR_ADDR_INVAL			= 22,
>> +
>> +	GUNYAH_ERROR_DENIED			= 30,
>> +	GUNYAH_ERROR_BUSY			= 31,
>> +	GUNYAH_ERROR_IDLE			= 32,
>> +
>> +	GUNYAH_ERROR_IRQ_BOUND			= 40,
>> +	GUNYAH_ERROR_IRQ_UNBOUND		= 41,
>> +
>> +	GUNYAH_ERROR_CSPACE_CAP_NULL		= 50,
>> +	GUNYAH_ERROR_CSPACE_CAP_REVOKED		= 51,
>> +	GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE	= 52,
>> +	GUNYAH_ERROR_CSPACE_INSUF_RIGHTS	= 53,
>> +	GUNYAH_ERROR_CSPACE_FULL		= 54,
>> +
>> +	GUNYAH_ERROR_MSGQUEUE_EMPTY		= 60,
>> +	GUNYAH_ERROR_MSGQUEUE_FULL		= 61,
>> +};
>> +
>> +/**
>> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
>> + * @gunyah_error: Gunyah hypercall return value
>> + */
>> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
>> +{
>> +	switch (gunyah_error) {
>> +	case GUNYAH_ERROR_OK:
>> +		return 0;
>> +	case GUNYAH_ERROR_NOMEM:
>> +		return -ENOMEM;
>> +	case GUNYAH_ERROR_DENIED:
>> +	case GUNYAH_ERROR_CSPACE_CAP_NULL:
>> +	case GUNYAH_ERROR_CSPACE_CAP_REVOKED:
>> +	case GUNYAH_ERROR_CSPACE_WRONG_OBJ_TYPE:
>> +	case GUNYAH_ERROR_CSPACE_INSUF_RIGHTS:
>> +	case GUNYAH_ERROR_CSPACE_FULL:
>> +		return -EACCES;
>> +	case GUNYAH_ERROR_BUSY:
>> +	case GUNYAH_ERROR_IDLE:
>> +		return -EBUSY;
>> +	case GUNYAH_ERROR_IRQ_BOUND:
>> +	case GUNYAH_ERROR_IRQ_UNBOUND:
>> +	case GUNYAH_ERROR_MSGQUEUE_FULL:
>> +	case GUNYAH_ERROR_MSGQUEUE_EMPTY:
>> +		return -EIO;
>> +	case GUNYAH_ERROR_UNIMPLEMENTED:
>> +	case GUNYAH_ERROR_RETRY:
>> +		return -EOPNOTSUPP;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +#endif
>>
>> -- 
>> 2.43.0
>>
>>

