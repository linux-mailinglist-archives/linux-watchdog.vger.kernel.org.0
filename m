Return-Path: <linux-watchdog+bounces-4350-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15EBC27DB
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 21:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01FDD189E123
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 19:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A6322D4F9;
	Tue,  7 Oct 2025 19:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh/L2FWG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B411C8621
	for <linux-watchdog@vger.kernel.org>; Tue,  7 Oct 2025 19:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759864894; cv=none; b=MBmoFkwAR7ZrePY+PQ5tssP/LTFBAKi8Y+plqhZfcIjwZnkZUBkVCO4TZ1AusmZVTN/YeaEst3jif4kKXXb5PovhbD1/yEQGE+IVd9OkBocmy67VA2yUsSsqzS6CAPgyTvkL6e8K7hOXvd1OItlsSKR5NwzRZKjV1fViHdxo/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759864894; c=relaxed/simple;
	bh=sxLlMM72IkJ8OEpzIGJ2BoYdRPuxRW/L07WviZwP+cc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cZ/QxvNpysEcel+vtqH7/ofEx39lDrm9aE4g7CAiQ7gX3hgVU02s5TGADHo/QkJxKYgog9AFK7o4htYcTCs/YDko0Q1UZTv3HNPyrQcmUi6xBdY2kgBB5n8sYWYImmCF6h9BNCJpFFx/7C2cUVNRYoFhxapPjX8fzmWxk2psYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh/L2FWG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET1PT029138
	for <linux-watchdog@vger.kernel.org>; Tue, 7 Oct 2025 19:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMkiWAhLmT8lD0SZHbXA4lduHbBhlhFb8Z3WAzn5qKg=; b=Qh/L2FWGUq0IvOm6
	ZkbyMZG5CgRdG0Ok+183vBtyso8LRTQfmo+Zi7mbt1kzhXf12Qstf+BQdYnaXbic
	5ATTNIKN8E0Xc6EWcDuCaOgU+zD/YhOxG+/u3xALBpmXQV/J7EMA4/LsVEpherQY
	AcF9lyRT50DvWtoEc0IUgsFovKOlG56bSTusdsqwWlseBRJ/E+zCOMExj8LwUIWa
	35fLtboEtbAh1MGChQ8g9k/HNZZ6wv2BzFyIv1m9RdAXMkyAOfPJRXa0v11jNRqY
	ErWtnmvmxS2447xeNnA4KeY2adQc/JdKivaC7khD4ffyMyPosE3htcSt8LbHt4BF
	FqFJSQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpu77w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 07 Oct 2025 19:21:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so6744183a91.2
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Oct 2025 12:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759864891; x=1760469691;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMkiWAhLmT8lD0SZHbXA4lduHbBhlhFb8Z3WAzn5qKg=;
        b=LRwpzKalsvCRocJxJkBPeb6qLRKiHQBdq28enXrZBTfJVvJw3XHKt4nNjx1NhRzRUx
         3X1ucBs5Q8QtpbeI6BeWa0dT4gJPAL7FhyKCXw6wPZ/xlXevD1XF/HEJOzxJdeKX0YJR
         NVEkl1+XuwFlrh0ubVnyh9PLqSVW9Bkc7wFZ94Kq1xXkZtsH8WJey/tCSoii8NoP4J8R
         tAxsqdqbYLu7lz5VMeg010Dknpv4UJBMfAL7DEGMJhzTwuKgDC2Vp6svLv96QAO7FCQd
         E9+fu+YQ0ieQvqh08ho8hrbRA8nPHrTLHKaiPkYaSFZmvz1mviEUU0MG8tBCJbYGVg3c
         C4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWYyQfFM+1djztA0XBLeRubVLIw96br6uUxu+W9BYB/qJek8eLNzLB/PYhTmzN9ubU5AWI2DWrMathNTy/YQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI+kefHrIHLfvlaRcFu4FIRUvVax0BJmQkgfmJWypvdOCnGMni
	V2ANPI6BubJYe62auhVwmbGZPMmAd23uZP3X/wmGHIq4y+z47Os3NVB5O3k7q03EeibGaBlhapu
	YIp563LFya3w5SDj58oJiap88OZ7wVRNOW5HZ+tRM1ei4jzn2EZ1Rv3FwYTdu9J5SzYpIl4PBaW
	m69Q==
X-Gm-Gg: ASbGncuE7oPbZ6tZ8zlyKLz3NT8YzxHAt4o+mJ034CWzKUzo+6541BsmWZx/XTUv0AD
	88WEdkh67D46Zt7I1Va+3RwqioOgUpZJ3zgWIcKyuHu8Qgw/HrhaO1RwHybCQ0GNB3jQKtyqWhw
	htLlUPo6paYVeOKqoWwBf/qTJNkOQeVv8cxGa0K/d9uYTaPgWIqaTOTfMGcdLMWFYf2Xbz168Hh
	cV5LrF2KL/zyC2uraya8KAkqI53fMp4uSUltMmDvJ5/ZcuB9G+JL8rvpELp5rPFdxlzGwgfu3po
	QpRQPAM3BDviXuNVFq4u+Q4hVfzdbpxjluSc/DbWfYxKjv/WFPJwZnPkLisOgQzfq4k5cu96Reo
	zMIQPWtbdiw==
X-Received: by 2002:a17:90b:4c89:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-33b513b4afemr618032a91.33.1759864890942;
        Tue, 07 Oct 2025 12:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy6cqKsE9dO4an2AnO2C8zhusrpiNFUID2RIFMWOPCms4KyLQq/koRc5yhX4DEbdE5poENzA==
X-Received: by 2002:a17:90b:4c89:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-33b513b4afemr617991a91.33.1759864890384;
        Tue, 07 Oct 2025 12:21:30 -0700 (PDT)
Received: from [172.23.163.112] ([152.57.110.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e91ebsm460155a91.2.2025.10.07.12.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 12:21:29 -0700 (PDT)
Message-ID: <9a6499d1-c459-44d0-bace-338af9f119dc@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 00:51:20 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <2e926e17-f8c1-47cf-8864-b0ef97b145ff@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2e926e17-f8c1-47cf-8864-b0ef97b145ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ldOL4_Dmr_M52DpLhqK5vtaOXsK16Ewu
X-Proofpoint-ORIG-GUID: ldOL4_Dmr_M52DpLhqK5vtaOXsK16Ewu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX25pBxtrHt1NB
 Zxmcm5lhrAzsdT/1BIVqEsDOH7WXPFcYhmNcVIRuK3B4dlqXFfbUJXcseaOv+/YEBvAPCQJ8XSS
 kbcoIrHuerBlNWWpgxbm/K0Le+KV1JITX/FxdS8Kxv1f1QvQe2O3gJAPEs2Iin6XXKs1YNlywK1
 9qrG7srMix5yEwrOzhxWFr5bBD6jHV6tcwoQcZeXKuP+nKSI8DozeZQQdALVxbhl5uYjj08vJUg
 Huz7x6f9CjDxL3s/Y3WJr8pC9owGt/wdY/1W8YHxno+JBD7MwssgDeYi+2jY59EgRagQJeT+FGa
 lXzBXG8MfGeXy9z8AqWafxMSDcCv0v3hwplixK/78EWILiz/qLf6h4VdSloptWvCn4N1dTFTdnM
 FYxHX5lT6bwvwVXbh5eXZJm3Y7h5ww==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e5683c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Sb1Xjpex0NNsHTwln55HVg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_yRxvE9VuPHJ94PYOxUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168


On 10/6/2025 7:17 PM, Konrad Dybcio wrote:
> On 10/6/25 9:37 AM, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput<hrishabh.rajput@oss.qualcomm.com>
>>
>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>> through MMIO is not available on all platforms. Depending on the
>> hypervisor configuration, the watchdog is either fully emulated or
>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>> Specific Hypervisor Service Calls space.
>>
>> When Gunyah is not present or Gunyah emulates MMIO-based watchdog, we
>> expect MMIO watchdog device to be present in the devicetree. If we
>> detect this device node, we don't proceed ahead. Otherwise, we go ahead
>> and invoke GUNYAH_WDT_STATUS SMC to initiate the discovery of the
>> SMC-based watchdog.
>>
>> Add driver to support the SMC-based watchdog provided by the Gunyah
>> Hypervisor. module_exit() is intentionally not implemented as this
>> driver is intended to be a persistent module.
>>
>> Signed-off-by: Hrishabh Rajput<hrishabh.rajput@oss.qualcomm.com>
>> ---
> [...]
>
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
> Can the calls we make in this driver produce all of these errors?
>
> I'm asking only because we want to minimize the footprint

Agreed. Thanks for pointing this out. It is better to not include the 
errors which aren't produced here in this driver. The excluded errors 
can be added later and the whole thing can be moved to gunyah_errno.h 
when other drivers are introduced.

I just checked, in this driver only the following errors can be 
produced: GUNYAH_ERROR_OK, GUNYAH_ERROR_ARG_INVAL and 
GUNYAH_ERROR_UNIMPLEMENTED. I will remove the rest.

Thanks,
Hrishabh

