Return-Path: <linux-watchdog+bounces-4336-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EABBC0656
	for <lists+linux-watchdog@lfdr.de>; Tue, 07 Oct 2025 08:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91E573C2608
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Oct 2025 06:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3433E22A4CC;
	Tue,  7 Oct 2025 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VM+3Hh6L"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584161B2186
	for <linux-watchdog@vger.kernel.org>; Tue,  7 Oct 2025 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759819973; cv=none; b=bp0W0OnfF/6Xi4hfapzodiZF3HZupyraVIaUDHLC0eqQWIFiqfJE0odjBBXEBScZZUIflwz7fooKCwDsoj7FzoSDjewwRETNG6WHF0HtILbU4So3Gh3PF/bA7F44kwuz0ykRMJk7OPT/aOj3JtBzLbssMz7rPrfvL/h61Tl0bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759819973; c=relaxed/simple;
	bh=ZSjlhghuDjwIeHnl71xo1QfnL/uEr7xaGmW26iAiHh0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wgum6hwrxkoDKB1LbDa4TymllUOPOgTcsyyUSY+uzi63/IFYW6j8tV1hRde+yDQy6m3fExMVE2zXBK9b4jbJiAykbIwCptYafOXJBYd+RxKfuMVzLCw6s+tjlWPoM63cGacn/DEC3r817kPEbAkABBDPzQhPBbkRPNfqi1bFNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VM+3Hh6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59731dqW003197
	for <linux-watchdog@vger.kernel.org>; Tue, 7 Oct 2025 06:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orLZT7zL3V4+D2PmyvlqkkoTTPi2f83cdPN1hh+UFig=; b=VM+3Hh6LFQ+Mpawq
	Tr+pzqrIs1eQ+pmdaPEtcju3yDEeqyg2uh8Jp9ccOknskLiLqwgO739t7fRwlClR
	c7ceLb/vf/SeNob19qAuSaS0qnQ9HPZDvjdKwkSHvKn8naQW46MXd4afqhLHiDTf
	KRiL43eubQqUQRszG8uUz7pDuLanoAt8CkHbETaUiFOKnTdknAmlobJpctlK27vp
	KcUNRDCG49LPhb7zOKRAWzidchMbEUZp/ZDajbHWxhshuFeM0KZ8u0fMkRjQHZ2H
	m6IGNRLDYmrVEMreEEIDoDMgWtnbfOPcP7+iBrq1ZHK/oL0sp/p+C38qi33M3rR+
	MSQVUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6xcb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Tue, 07 Oct 2025 06:52:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28e538b5f23so63517205ad.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 23:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759819969; x=1760424769;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orLZT7zL3V4+D2PmyvlqkkoTTPi2f83cdPN1hh+UFig=;
        b=wy+VH37/WLzoXLM77tmpm5OD1BzhcP+k4YwmYrLopheYuB2cDqsPx/f5GncThQfMP0
         azHaiBV4RITIg9v+8AMptAcou2qlzT2YOXBRsgW60M8Zsh9vH1mryptNLSNcgsdnQItK
         Pt696tsYLU2dj5f1wgBBDpcy9v9VGRMgryDh++Z4pipt8haPeJv0LN4e72iwxXRWxOJ/
         FPv6TI3K7XpygHfCCS1KWzXGHQUA9V4Zhw+EIORBB87jj1u4K/quAnU+9EUgupAI62Rb
         61Hx85epZ9zrS2Y2e9ruDXCcjqU7Sm33sziNkr3ueFqplUZeT5rRhwnefeESX5hiVn9F
         eHDA==
X-Forwarded-Encrypted: i=1; AJvYcCUerupad3AuYnzAq/i9PS87iP27Irm6oVuD8SmxZYkeAKN2pWiMOGnGOyeECVy6/1nk4H5c2HxkCcHJcBspKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8B+WHL0hFgkyZ4zldphhCBA0d9cS3tEUfZyQjp4xtNoNg/41V
	a1F9alKEONfGjL9AxMmsBINg5JFxo9TTSQXkcqIl9QnJnZgnJx7a3DqsV02+9HeGRwGH/PskcSr
	kaFd1fpPNuzuW6ABz+dvTakSE+FVPK0hChMuO13rD8CRKpJBaGrcdZei5odtT6dexzxvvIw==
X-Gm-Gg: ASbGncsD0TUwqAEorWgUXgCvyj+TVbzMt2xlRO7GOWRq5EJKV7jYjJd+Vmq/2OUOewm
	ew7i+KHf7cPQYU9WhHpnadherRbRB2Vp8DA8OtNDYNZGx79KBBkZ+p6r7sgbnswIL9+ziGaYzi5
	Az+ZO4c2VBQpwgfTM287H8lkUpq23kqnTp+X2YECbgNsxm7pj/tK0/GHJSF5foyMkLfUgvk7/k+
	ti/82lsVBE+gFK0xRYaQmkurF/XiklliuXIdZowZYKhcOHEH6uxmUTR0VvnaR0IBSO23Gp1XkRG
	9wjmJFPisp4EELiyDgOjKTt5wsEwv88hpyhl4ehtnha7bWdKDyh8ybCHxsNEjFSjXLN57xpjHAf
	fU+Db+cJ7gDhaBRwPTJsY1i3MOVHYliGiVgT1MseTwMjoGQHTQqfTOR7f6GuqQOMmELQ=
X-Received: by 2002:a17:902:ebc5:b0:28d:1815:6382 with SMTP id d9443c01a7336-28e9a64925cmr164252145ad.46.1759819968687;
        Mon, 06 Oct 2025 23:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWs7dD71EQBt8SniMOLPxdgiNr5aQ3jTTG8yNgF3kNyUIvGY7hrt9bbkSOQkdsWoCRJlV7Xg==
X-Received: by 2002:a17:902:ebc5:b0:28d:1815:6382 with SMTP id d9443c01a7336-28e9a64925cmr164251785ad.46.1759819968129;
        Mon, 06 Oct 2025 23:52:48 -0700 (PDT)
Received: from [10.190.210.68] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8444sm154035465ad.86.2025.10.06.23.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:52:47 -0700 (PDT)
Message-ID: <166a0b99-879c-43cd-b3c0-37eb04afca5a@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:22:42 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
Subject: Re: [PATCH v2] watchdog: Add driver for Gunyah Watchdog
To: Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251006-gunyah_watchdog-v2-1-b99d41d45450@oss.qualcomm.com>
 <6e7eaac2-0859-4bfd-b76b-2f81e384a91c@roeck-us.net>
Content-Language: en-US
In-Reply-To: <6e7eaac2-0859-4bfd-b76b-2f81e384a91c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX1Xde+5+KGjhe
 cHMdSInzc3pNoGXJTFhKGclDuN+7yXMZtiFm9evklLBbbs4Jz0kJhXyzyj4/ldl5M8kN0e2ilfj
 0lQyt9wo8ErI3Ep76YfBRvYsHHUjCXtI33/R2zU7Z7BUlndLldbcIjZnCx0MFiHFqbvyqeMx0h9
 GF7eNUQhPXjpm+uTdOvfuHlp+01Bj3Qlz3R8fEeeqb0wHjxO25dhHyAP77maKf2ypDijvrUpH5l
 n4Ta7UB3TP0SgKcKoDXHSOPrb9lENVByAPAQosznDagNCs3ce61gopx7zESn2JSWYCzTH/QUpk2
 c07vZ6fkXURCQoAv/5QE9jFNLRfhTNyP0tg5TCbfYJHyZpHwITdiFQwlREHoDWZ9GMda8Sra7Ym
 3Ibz6hQ+DzFr2JtaVBNvh1ia6cvTwA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e4b8c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=GK14inuqRTfZ8P4RZYYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RyY6s4pFheBGADxNBWGt1hWBH53mO2g6
X-Proofpoint-ORIG-GUID: RyY6s4pFheBGADxNBWGt1hWBH53mO2g6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017


On 10/6/2025 7:48 PM, Guenter Roeck wrote:
> On 10/6/25 00:37, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
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
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>> Gunyah is a Type-I hypervisor which was introduced in the patch series
>> [1]. It is an open source hypervisor. The source repo is available at
>> [2].
>>
>> The Gunyah Hypervisor doesn't allow its Virtual Machines to directly
>> access the MMIO watchdog. It either provides the fully emulated MMIO
>> based watchdog interface or the SMC-based watchdog interface depending
>> on the hypervisor configuration.
>> The SMC-based watchdog follows ARM's SMC Calling Convention (SMCCC)
>> version 1.1 and uses Vendor Specific Hypervisor Service Calls space.
>>
>> This patch series adds support for the SMC-based watchdog interface
>> provided by the Gunyah Hypervisor.
>>
>> This series is tested on SM8750 platform.
>>
>> [1]
>> https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/ 
>>
>>
>> [2]
>> https://github.com/quic/gunyah-hypervisor
>> ---
>> Changes in v2:
>> - Move away from platform driver model since the devicetree overlay does
>>    not happen by default.
>
> This is just wrong. Platform drivers do not depend on devicetree. I am 
> not even
> going to review the rest of the driver. 

Thanks for pointing out the mistake here. Platform drivers are 
independent of devicetree. Therefore the line you've pointed to is wrong 
as it erroneously portrays that the platform drivers are dependent on 
devicetrees. It is a mistake and I would rephrase it to following to 
make the intent clearer:

"Do not depend on devicetree to discover (and probe) watchdog as 
devicetree overlay does not happen by default. Instead invoke 
GUNYAH_WDT_STATUS SMC Call to discover (and initialize) the watchdog."


Thanks,
Hrishabh


