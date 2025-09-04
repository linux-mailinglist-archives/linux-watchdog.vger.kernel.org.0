Return-Path: <linux-watchdog+bounces-4192-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF6B43F6F
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 16:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F447188AB7E
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Sep 2025 14:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BE530AAC7;
	Thu,  4 Sep 2025 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9W5jwEl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FC30AACE
	for <linux-watchdog@vger.kernel.org>; Thu,  4 Sep 2025 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996774; cv=none; b=uQEfLZUOk1OnmozSaUL+tf3ycYha68KLgRzq4d4+eMNGI3nD40sJqEaF1CbtUlcTqQ89lCqBn9gwUsCKrfQ0UW9LODs4dJV3fGJjCAX86LR1RfekBxkTz1NkLSDMFwtzoPu5G96sC86+iuRXeRi+Rbz1eJcUxh0j4DnDrEQMH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996774; c=relaxed/simple;
	bh=PdKgDAkZqj76ujCFHiYUV2a4vgAUgOQCtX/qwYcNlis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbEUiex3wKoLFoRunx8VgZRpdI1ig6MEmRmUGnniHzl0kj4b65OOCZ53XCyUp41HfeASQKRQFJo7LWWxofVPAAbGjkiNuGcJkvDdEGkCHCJ7Aey0otJ9lVdfdnBejI8hm0iE+qYaZweynpgenGvgMQtmbl3X+iIw3qUc4hecDLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9W5jwEl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9ld002378
	for <linux-watchdog@vger.kernel.org>; Thu, 4 Sep 2025 14:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pw5whXpBpvNS8WxXMKd8zSVMyaNdMtCxEMvZdYte1hE=; b=j9W5jwEl4/qxn/DX
	P8ISRGWboF81TxkIWTMQ8uPx3CWQm1bVl/GHMugZ8Uwb6xsybpQidE7y4iyF1y09
	XTE5GbwoQOPXurjEmO26ehr/KYsr1LmeAn9ou/KU4bkk+flpsPRiOxPj10wG+CHB
	9wMSKIvXWx6EefHvTO6faydm9xcFN0j78Z9ZEZ/kBEraxpJtIn9VRJsXTEnGemcq
	Bssab+r28VgcgiKEK+LR6L9F3oIoI5Lbx9CdNBAfqaVS/UE8uK4otsXZIyD7cCoc
	CnWx8/t4E6qscpSLpGLIzoRV75DGMhl8sahaVdhGjiSbKHC3vBJtkhUDeEgKNGHE
	h/Heyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush37p5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 14:39:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24a94fef521so20209345ad.1
        for <linux-watchdog@vger.kernel.org>; Thu, 04 Sep 2025 07:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996770; x=1757601570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pw5whXpBpvNS8WxXMKd8zSVMyaNdMtCxEMvZdYte1hE=;
        b=iprIJmQCSSe3hqTLxAZuMirwYFJ3J7ceICtjif9F7BqrWYY6hTZAZa0vJH9lA2b6/E
         5I9CuGrJf9kC6OAROD0wz2T6smsfNOZBfx4byfPMXaVxMyH2EzE9Rcool9Bun+aGV30R
         IWRn/e28M5UrMAf6rCkXkpowQaXVSSKEeqvedwKFq28oqIVz1EBIpze/48jQwwFn1W9U
         G/J3GX9RAeYyvDpscdExXoarZhnAe08509u85MfhIzA8CGI99Xnf0udv1Id58+ZBKG5V
         EJi9ec7nC3SMNVlxHbCtlVn1lNMfPazHaRsrtLcU/EE8In0Gd6uy4DvZe2LTo/lfsSis
         wkwA==
X-Forwarded-Encrypted: i=1; AJvYcCXhbjpBPQ57BlWW/hLDupP7pBdViSMght2S3qgRspoXPEC4qB+U4Fip0lf7kMulySCcB+Y+wQe+3m3F0saC7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw414rwRx4sd9hfaTH1xZZRYgWterI295aCB9L672vc/erD8JoU
	YEWZmEzM2SVOMNuWEsJNvJDcGYZJ7Ou9TrKCvKt61/iAJEbrjaIJcOdtbeXXjtoesH1uTNDDhyF
	SlmufFWD90DQS7BzWgxKjc5wjn1t3zUg4sP9O9j8fCQXAU0ZGtQpI9vQl0/qXVDEPxt4mF/EHDb
	HF4A==
X-Gm-Gg: ASbGncuGMALE34p32qlRb4JsXjGMvJy93w1LOYjb7IQT7qU8+IedzsLl88YwT3R83bS
	fydHJtw1aiJk7dWb1BHilJNf8+Cs9j/7PUwgYzDbKWBPcUlwBERI7Yajdqz2y+uZqrujjzfCou1
	NpI4Uo3iOb290sEbfTWxDTmmxVXypw4TlrYwZzxknBsSRbSzt4OZPPGSrjXJl2jQ3vr/K5uxLmG
	fHdZM0zVhh4wI7DJAOYVLsIAvxKsoDE6o7tNzFLyLFdLKwiInlsdRKTEKxU6MsDFmBoTzYg7UEM
	qGw2PPDIAvqYVhoXMS9bxdnx/O2NNB58Z5kFZQljjX72NgV/TVMQDY4T8Ry4ofqaFk5/p+c6trb
	UV3TRcN0=
X-Received: by 2002:a17:902:ceca:b0:24c:d6f7:2788 with SMTP id d9443c01a7336-24cd6f729demr16657755ad.57.1756996770447;
        Thu, 04 Sep 2025 07:39:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi6kGCUhUfwu5x4jMfrg5WbhkrMkiCM2GTKdX0bXB/HRO/3Es+MmJciwCepdhATrDfobpMGw==
X-Received: by 2002:a17:902:ceca:b0:24c:d6f7:2788 with SMTP id d9443c01a7336-24cd6f729demr16657435ad.57.1756996769927;
        Thu, 04 Sep 2025 07:39:29 -0700 (PDT)
Received: from [192.168.215.112] ([152.57.129.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccc79a345sm17693515ad.132.2025.09.04.07.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:39:29 -0700 (PDT)
Message-ID: <1f12cf45-410c-41b2-a55c-94b438dc2719@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 20:09:22 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <20250904001014.GA3405605-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX0p16wk1nH04w
 BacpmqgNE/lFWD87BGLZmWCnBW382PJf6dKL1W5/OdjPPS84Cowhf6JbDQYFNN0hBx52PpLkK3+
 eJsJVhlDDKkDzY//3gn5bslhEKlZHvuz6IhW92uxCPhCrdukjGmBofH/AcsQ6FpSOAiBUVsCDG0
 /8ZXzkW3APUMlpdj/BaC0fEFFOZ0OC4stxTt3ck8BtbpAECSWtKRnEWFPRsRzPrTULFTiAL3OJD
 juQWDgaSikvSJolqpu2oqb2P/E9gZS4FQwLCKn9NUITzAWQgfbv84KBuww+sOhjN7ZHKyRw0AMk
 ZS51MCCFrhDXDeaVFBahYkytNCx16xqpEuZfwfuD4lb9ivk80hBV6WftrDOP3yxqJCSpvGS6rf4
 Xx6HVATI
X-Proofpoint-ORIG-GUID: uyIGTNBf5Z4_TfV77Fi4cHZ-0Ap3_Qqu
X-Proofpoint-GUID: uyIGTNBf5Z4_TfV77Fi4cHZ-0Ap3_Qqu
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b9a4a3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=o0dP3Ed1ANdhMlAYVkqilg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=AtXW_PjUgssW4A6z-zMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032


On 9/4/2025 5:40 AM, Rob Herring wrote:
> On Wed, Sep 03, 2025 at 07:33:58PM +0000, Hrishabh Rajput wrote:
>> Gunyah is a Type-I hypervisor which was introduced in the patch series
>> [1]. It is an open source hypervisor. The source repo is available at
>> [2].
>>
>> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
>> access the MMIO watchdog. It either provides the fully emulated MMIO
>> based watchdog interface or the SMC-based watchdog interface depending
>> on the hypervisor configuration.
> EFI provides a standard watchdog interface. Why can't you use that?

I need to explore about EFI watchdog. But Gunyah Hypervisor does provide 
various interfaces for watchdog including fully emulated watchdog.

There are Qualcomm SoCs in the market that ship with SMC-based watchdog 
interface configuration of the Gunyah Hypervisor. The purpose of this 
patch to add support for that configuration.

>> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
>> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
> Is a watchdog really a hypervisor service? Couldn't a non-virtualized
> OS want to call a watchdog (in secure mode) as well? But I don't know
> how the SMCCC call space is divided up...


Sure, a non-virtualized OS could directly access the watchdog. 
Hypervisor needs to interfere when there are multiple virtual machines 
running simultaneously and we only have a single watchdog device.

>> This patch series adds support for the SMC-based watchdog interface
>> provided by the Gunyah Hypervisor. The driver supports start/stop
>> operations, timeout and pretimeout configuration, pretimeout interrupt
>> handling and system restart via watchdog.
> Shouldn't system restart be handled by PSCI?


By "system restart via watchdog" I meant the restart routine in the 
watchdog_ops struct. And I've kept the watchdog restart priority to the 
lowest i.e., 0, so it will be used a last resort.

> Why can't you probe by trying to see if watchdog smc call succeeds to
> see if there is a watchdog? Then you don't need DT for it.
>   
> Rob

We could do that for checking if SMC-based watchdog interface is 
supported, but DT provides an additional information about the 
pretimeout IRQ.

And there is no way to get that information apart from the DT.


Thanks,

Hrishabh


