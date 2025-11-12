Return-Path: <linux-watchdog+bounces-4560-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B7C508A5
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 05:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B9A3A7B01
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 04:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E28029D297;
	Wed, 12 Nov 2025 04:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRUVOYqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNWskUH0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CE2594BD
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 04:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762922259; cv=none; b=hfzNUa5RAvBZLhZJR0eMCnqmNsZbAhCJ3P+rTC6XdYUXsu3GiHUYn+fo6Ie+MzYaGZBomquncptSBLDsWU2T7uOTXFdSJsyr9INY00+1pdjRcIfpsflSRPZm4IVDOOjYhckYrdBcZuGhWjHZm/y5r2FfmzuxgGdBlweMN4DqO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762922259; c=relaxed/simple;
	bh=V0vl5PYqOwt6P32dIC0YxQDIkv9JT71y2bFJQpFNggw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LFCKTsp282fMFF5gO72FBZ/uaCKaCTcIhL1tCXrB8cDDZ7esJpNiGKyBhjz+xs4zxmsA31mtVHZ7sti4JSbk9ZOsqw7yrhhK9jvMm4J0pOZnyd+U3gdcf2M7KNTL/1xLShv6I82hWAqAeOX10OXJYak2+GrIaUHbGxrOrPEeMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRUVOYqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNWskUH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3HOhj4053100
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 04:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVQKND3i2NbrdQnKxtCPDowADDAfakYZ28GFem/SIZo=; b=YRUVOYqHydXvvqvJ
	HUw75CnuM4GykvZ71R0PbxjB03A3TQ6r2hZBoVoKba5/xTfAymnPHkc2K2HaZmm4
	voV/kxXijn7kKo9kaGGOH5PrAvNlPPnVCcuQwYFeG0p+RD8ywA/lb2qpvbxHCn5k
	+N9Qo4sVhGJkFxG7xS5nT93pGokTUL5mXzNMkltyrh+Rgsp9Gfd1yEVX1tm/T6Ia
	kzGIV+pRmwAkVS0U63qw9EHmB3qW85DTPUebeHZrkdKGRCZuJMx4P/GkpWXAcJP6
	NMiwJmfcnpQTLBPn7HGZPoV/VyEDAc2uFYIYF1koBp/6q2NikbvwygGJ1pVc3qnw
	V3qgqw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v859g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 04:37:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b98e6ff908aso917460a12.2
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Nov 2025 20:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762922256; x=1763527056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVQKND3i2NbrdQnKxtCPDowADDAfakYZ28GFem/SIZo=;
        b=ZNWskUH0w3LUaxoL87B6zSeGa4rF2raYomVC14qjWB8I1AG2xBrs++sgP1GEzJouY7
         wETZHSvSQVsQTwiGiXFJF5KcPCfrIYPfsk5aUN1/rPmE99QAtZkZ6ZMa6RlG3I4YMM7R
         Fhu5bJvWuU4wfEwYgp9V3jdUbg/en3lcS1nZigwnYkxx9mRfW8OXmKexeF2kzOu04Ocu
         FD9WrvASdq5Py6ZHgKPZLO8t3iUcxaQ7UbWC3t52fRSapnrmvqRiDBvSbbR86Bq8pkaV
         dVtR6CHMX/fDqiefbUpHFUYamYYwo6YQTHxWy6O7hirlMeb9orRMHUI3uSELZc6OLt+F
         1A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762922256; x=1763527056;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVQKND3i2NbrdQnKxtCPDowADDAfakYZ28GFem/SIZo=;
        b=LpvgTYQ4rOwsGDq7Rk8CSk9duC/hcnd+++7jg4Cv5M3xX59hK3Aanfdt08fa0aADZ/
         IXOMAuZFaYj2x5deK9oJJsH348kV5GyvtZOGB10zHNMLNIx30zhGAxDWgqMA5ZW4bN3N
         5F6tmx8wLGECrdqfenIlmAyomJZjOPEn9k3Lk+U7bKmXa9D1sj9UZB2B0MWEeLWVQHFC
         5lCt87gUX6GO0P9Q5wpmIz0gJtbXktO7QLOPDdWot+pUZoxx7JTXc+idiei4iKgg7qxP
         0Hn2tuakPPOAcOPlqb2wEF5lDjyX09q7OQllOwNGVpEOywwdqjtOUweNMz/+5Lpv4XMT
         oDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXudVC0S7oejMbgkZc2ArKe79zUr7e6uj/tsDTfhiny5XfD189s5Bv0j48jVQhWJtaOGE9Ur7yby4TC95MvFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJoy/c56FaINfl7CsLtoySkW1nT/A2tf5h99imUQEd487XDF3x
	ybk7l+GI0ffWC47dBoNwFlCPdXdMjRbuU6QCuk+Ebru8TcEZzRwA13B4S0yze4a9GJNf82EBbDg
	mquvoOT7+bXsG+rxugqrVYV2a7Ke0l2bfZfA8XmD6xEpJDS5PL1RbNvpPY9VraJ6zfOxXuw==
X-Gm-Gg: ASbGncuPx6C8lp6hEUzTtaOTqOTFPIG5Tb6LrPQ83wy6y6vfF1Wt+MgF0MwRVtvMM9B
	HWsM6G0IKi0wfOdmo26o4uUFCuu58DNuw8NnBxn+MdAtJIysZznT4vJg9ncpMEclHZLUlTxRojh
	7g1W0vjpVcc+Xb0PkXYqyI3Eic+u47vMK/WdlRZhoL4CsbMWjhCzxYfCGc98tOxRHwQ9tIYb4C2
	rtZ7CNhj9AmIhPjHllA32MZwhxAE7mEZxfy4VaWV88wPvs3IKavNa6hf+GlTdJ00/sjKs+OJqAv
	qsaN5NdUGUILk7mxzyd0E+nmqW86hvUaFaB5CI5oCLknyYMtWeM/dU1YP/BCpm5fTrriF62yQRA
	wc7CQ/WaycErw2LpulWw21zKPCl3hfscPgSikWmo=
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr21873755ad.43.1762922255799;
        Tue, 11 Nov 2025 20:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgxphywwo7rj2wEd9u2tLC3LhciITf/QsO2ACTfPA2oFJMOF4ZYzAGhbaKJALeAsYksHv/aQ==
X-Received: by 2002:a17:902:d54f:b0:295:34ba:7afa with SMTP id d9443c01a7336-2984eddf6a5mr21873455ad.43.1762922255302;
        Tue, 11 Nov 2025 20:37:35 -0800 (PST)
Received: from [192.168.31.147] ([49.43.242.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29852391df0sm2680995ad.3.2025.11.11.20.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 20:37:34 -0800 (PST)
Message-ID: <68dbaf42-0d64-45f7-8410-ebcbae2da612@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:07:26 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] firmware: qcom: scm: Register gunyah watchdog
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251107-gunyah_watchdog-v5-0-4c6e3fb6eb17@oss.qualcomm.com>
 <20251107-gunyah_watchdog-v5-1-4c6e3fb6eb17@oss.qualcomm.com>
 <hbxtbaoavlsw7pbmg3cfkbyx4nacjfiikckhqgpvlggbh6hu5b@jyporqecfzni>
 <263d1390-eff5-4846-b2c2-31f96fc3248e@quicinc.com>
 <3794bb0e-5e2c-4d5e-8d81-d302fa36677c@quicinc.com>
 <56aqammkwte3tcdzni2unufjp4t4yaqazzdkigrwqsxp3ghcqe@ppe2pjwg3hrl>
 <60583236-692f-4605-9f56-f7dadb46558d@kernel.org>
 <zbwcg5pkdspkcnvaitac6y5iko346qyuzuipqhkoedcaqm2dpa@zmszuwhm5q7z>
 <6bebcf6c-9328-4cd6-b77c-a147338d607a@oss.qualcomm.com>
 <nkh73mo4h5kj2lrz7paop7fn3ow2itxl5vh43muw6n5dxgmco3@tgvbmdxhbiqo>
Content-Language: en-US
In-Reply-To: <nkh73mo4h5kj2lrz7paop7fn3ow2itxl5vh43muw6n5dxgmco3@tgvbmdxhbiqo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U0Z_d-tfTZLEj87zV8mUsgDm0APuqYcI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAzNCBTYWx0ZWRfX2OGAp11493g5
 h7FlmRKdiHmZTrfwSTr9TsUgqGtzvKuQjTJcnQyjVO0QB6s3xeKHNkZtwilQwcLSZR103Q7jnDA
 pTcv/4xbknKan60tdz5KATBd6UTp4nA6agYH8iLetBodxsaBwceT/IUzynDE8mjrcPXChYUMeu9
 v5O+0xEgRAIEPqa2DSVJx2rbRFWff6RJlbc6BzJq5kNONj5vXFH59SWYxNE+JU8MNpRm+UsEFpe
 /2t1YzJhudVWMb0YfMHUxyMCqJltvWejSk8WjY0zB7KCX79PNZ8pxnqVq/hd6hhSZ76ewDxj99v
 1MQ862BIiXnfej1tCVzs+pOG7KXIKEN4Re3lMqyx2WNP5ySj8QpB415CcPYEccIsDD61PLgIa72
 wVb1249OsvFj2F88Ff2c021KAkxeiA==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=69140f10 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=5O+OyBe/A2HhBAuNR3RTDA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wXnSqrKzETg_ePB1FBQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: U0Z_d-tfTZLEj87zV8mUsgDm0APuqYcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120034


On 11/11/2025 8:35 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 11, 2025 at 07:30:59PM +0530, Hrishabh Rajput wrote:
>> On 11/11/2025 5:52 PM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 11, 2025 at 11:41:51AM +0100, Krzysztof Kozlowski wrote:
>>>> On 11/11/2025 11:34, Dmitry Baryshkov wrote:
>>>>> On Tue, Nov 11, 2025 at 10:51:43AM +0530, Pavan Kondeti wrote:
>>>>>> On Mon, Nov 10, 2025 at 09:43:53AM +0530, Pavan Kondeti wrote:
>>>>>>> On Sat, Nov 08, 2025 at 07:26:46PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>> +static void qcom_scm_gunyah_wdt_free(void *data)
>>>>>>>>> +{
>>>>>>>>> +	struct platform_device *gunyah_wdt_dev = data;
>>>>>>>>> +
>>>>>>>>> +	platform_device_unregister(gunyah_wdt_dev);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
>>>>>>>>> +{
>>>>>>>>> +	struct platform_device *gunyah_wdt_dev;
>>>>>>>>> +	struct device_node *np;
>>>>>>>>> +	bool of_wdt_available;
>>>>>>>>> +	int i;
>>>>>>>>> +	uuid_t gunyah_uuid = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92, 0x65,
>>>>>>>> static const?
>>>>>>>>
>>>>>>>>> +				       0xce, 0x36, 0x67, 0x3d, 0x5f, 0x14);
>>>>>>>>> +	static const char * const of_wdt_compatible[] = {
>>>>>>>>> +		"qcom,kpss-wdt",
>>>>>>>>> +		"arm,sbsa-gwdt",
>>>>>>>>> +	};
>>>>>>>>> +
>>>>>>>>> +	/* Bail out if we are not running under Gunyah */
>>>>>>>>> +	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
>>>>>>>>> +		return;
>>>>>>>> This rquires 'select HAVE_ARM_SMCCC_DISCOVERY'
>>>>>>>>
>>>>>>> Probably `depends on HAVE_ARM_SMCCC_DISCOVERY` is correct here.
>>>>>>>
>>>>>> Dmitry / Bjorn,
>>>>>>
>>>>>> We are debating on this internally on how to resolve this dependency
>>>>>>
>>>>>> - QCOM_SCM depends on HAVE_ARM_SMCCC_DISCOVERY which means restricting
>>>>>>     QCOM_SCM compilation than what it is today.
>>>>>>
>>>>>> - Adding #ifdefry around arm_smccc_hypervisor_has_uuid usage in qcom scm driver
>>>>>>
>>>>>> - Adding stub for `arm_smccc_hypervisor_has_uuid()` which is not done
>>>>>>     for any of the functions defined in drivers/firmware/smccc/smccc.c
>>>>>>
>>>>>> We are trending towards the first option above. Please let us know if
>>>>>> you think otherwise.
>>>>> The same as before: 'select HAVE_ARM_SMCCC_DISCOVERY'.
>>>> HAVE_ARM_SMCCC_DISCOVERY has a dependency which is not always selected
>>>> (e.g. ARM32), thus selecting it might lead to warnings of unmet
>>>> dependencies.
>>> Then `if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY))` might be a good
>>> option here (and depend on GICv3 selecting it).
>> Thanks a lot Dmitry, wemade the change below and compile tested on various
>> architectures (ARM64, ARM32, x86, PowerPC, RISC-V and MIPS) and it was
>> success.
>>
>> We will include it in our next patch version, if there are no further
>> concerns.
>>
>> }; /* Bail out if we are not running under Gunyah */ - if
>> (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) + if
>> (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) || +
>> !arm_smccc_hypervisor_has_uuid(&gunyah_uuid)) return; /*
> Unreadable. Don't you read what you are sending?

Sorry, my mail client messed up the formatting while sending. Here is 
the proper version:

/* Bail out if we are not running under Gunyah */
-	if (!arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
+	if (!IS_ENABLED(CONFIG_HAVE_ARM_SMCCC_DISCOVERY) ||
+	    !arm_smccc_hypervisor_has_uuid(&gunyah_uuid))
		return;

Thanks,
Hrishabh


