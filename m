Return-Path: <linux-watchdog+bounces-3289-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41438A857E0
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 11:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE5E1BC36B4
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 09:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD46529C342;
	Fri, 11 Apr 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C14Hoh6b"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E9D29C350
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363062; cv=none; b=o9MWwX5441dc7lmOOrqipQW2hWZl7UbmSJGiLJweOQDMK2KTtuSgF91DHMNw+y6HiObu8Vsu7UMwPBlglxNpitf5pkufdyoJMZ7Fkoiaw+CL6vF9w9KxkK2iPUk8R4RzD2Q/JHCNNrBp0yZbqL5iAy0errC/XWEhnDIRmT3QfxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363062; c=relaxed/simple;
	bh=5riflTBovuTknbfdTdQw7WeAT90h3KdXcdIxC6zePGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RY+XrCgblk814VI/zeL8D6Nf1EbKeutdtm6W+Ys9hWTgx7qMQmMn0O4o9o6DL72w/0+qIpjEF5NQivhI3tkQoPErThXmcJXc8R1n8RawqH3LEqB4IuC79v9NpEtMD9Q5+c/wirhMRMuy/PfGsplIbKWuABLgc2PlERPqz+IYYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C14Hoh6b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5cqYR030704
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 09:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zN/ZnflEHJ0aPPcnDV5LHKDgz80vZRrLIfbl8jUk1E=; b=C14Hoh6b8Akeoi0D
	hSJsRmdyH8b+LRjrso97YSnnMWm0/Yy433ceMwNiVL1DuvzDdwlmwg812FOHT0bi
	O3LgZU0ywlLSpfIAs7VuxO+UEJ1bC8Ws6Z3M33E0aAOiicLIvD4+c4bBBPHKM97S
	SydhqytyVBT5ATvdbpnVFmOI5fFHBmIt2I7ocU7PUoNs9+bdJNQSMwCUkKPx7gOV
	mn1j9+lcyiAScyV9gubLVvaV8KnlLCODdrGU4W7YIRDRoASJoPm3eTCji31EwaGx
	bMu0La4x3idLCVm2aTnVGg3Vy+Tt7q6ORWtufk1cB+1o8AHMdg14SvHGjVT6A1ov
	AybDlA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftsnka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 09:17:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225505d1ca5so16647985ad.2
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 02:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363058; x=1744967858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zN/ZnflEHJ0aPPcnDV5LHKDgz80vZRrLIfbl8jUk1E=;
        b=B/uR9C1lbKTJpiniyuxRD5aJZV+rJ3GTOiGfmmegnDRc4UCW+vHvrEKuF/QlcPs9sa
         j6mxaNFccq0zutXWkT9CRxYCXN3VRcY3O9j6bL934ucarE7wpxgSrmK8ilB8BSH0RSBa
         01gtymCGAQevXxDOS+3BDUQVQZLpmIkEeJKtJWwE6IMX7EfF54RyjDqXeCi9a0/L/BMB
         fC4fgw3sI1mIy4xOMupe9HlpGSqLYOngNME7ch3ec0BhqVUCESAQUypaYoUeadt3qILn
         8e4CmaJn7dsu5xL+OWa2gtmBzIU5bgo5vBNGJ8me1JEy2DubiVRDwNTw0Z7BNVDedMIr
         LIxg==
X-Forwarded-Encrypted: i=1; AJvYcCVRdvbHkLGPLNV4sVhxuvPiSmP8TpZ/iOy9POUgPuAG/9ANeHRbkQCtIeQOpl3T3PFR2xxpU1aO2Mom0VuUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy01n1Y9X6o23dPVXv4cs6zWcGf+6oemuLlMH7bVZlzBEd7P5D2
	r6bYjwNomrjzV6kCtbXjMOFW5QfJGsJ6jRoZenW2jWBX9HVVFUjB76xx0jvnmkxaf/ura7Et4+2
	dL0TYq/UQprSxOY2Jq/kB3oqywI8YnLD3B0wTUugfViREmC2VL4+029vSNXstxc4CHY+k/Zr75w
	==
X-Gm-Gg: ASbGncsPDmYolJeooMOYPX0qb/oAL4gz0dkSR7tiZyDe+EM7iMoCKEHrz0miqDCunN1
	2MG97iaB1Qzs5KSEDrZ9+MZ3GXFetFL9ztYxoa8efQTm5mYEdZcxYUze2+b5uM7WJRJ281MI7aP
	8MBoM+iZ3wOknwPWg830dYWbtHixwsdVTrhXiY4zeBYMGum5+DJmTgEs8C5Tp1VaaheRWk8Pq1s
	d7jvZW4VGIuBR+Pi6S9pFNKPR7Je0Mu9DDXGBszGSMOJZbBwA322PZQRjbCowR9lCinvciV05yC
	U2Eimh9NpDI6y9E2XkLqYodGxs34dv8pYDvVYBTQHo2VqMKmedfd
X-Received: by 2002:a17:902:fc4f:b0:229:1717:8826 with SMTP id d9443c01a7336-22bea4c0072mr37888425ad.28.1744363057687;
        Fri, 11 Apr 2025 02:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA42sJVVVoBoIcY0aPFDP0UouVaaHPmWcn9IkuJgBJMEbNtR87gKZ+rnnOY8MF5XWTZGKE4g==
X-Received: by 2002:a17:902:fc4f:b0:229:1717:8826 with SMTP id d9443c01a7336-22bea4c0072mr37888105ad.28.1744363057337;
        Fri, 11 Apr 2025 02:17:37 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f28sm1043940b3a.97.2025.04.11.02.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:17:36 -0700 (PDT)
Message-ID: <4a737b56-9d26-4f81-a7e3-8644ed787373@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 14:47:32 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
 <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
 <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
 <54efe237-01ea-4f98-8dbe-390d344aa6cf@oss.qualcomm.com>
 <0b71ee9a-f222-4254-bc12-4c98854f44c3@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <0b71ee9a-f222-4254-bc12-4c98854f44c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8de33 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NJF6hevOwqtteAhcjXIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cJC1336htSvXaQ9kZHu8qKhRia_KsQzK
X-Proofpoint-ORIG-GUID: cJC1336htSvXaQ9kZHu8qKhRia_KsQzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=948
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110057


On 4/11/2025 2:33 PM, Konrad Dybcio wrote:
> On 4/11/25 7:01 AM, Kathiravan Thirumoorthy wrote:
>> On 4/10/2025 12:11 AM, Konrad Dybcio wrote:
>>> On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
>>>> Add the IMEM node to the device tree to extract debugging information
>>>> like system restart reason, which is populated via IMEM. Define the
>>>> IMEM region to enable this functionality. Corresponding DTS and driver
>>>> changes will be added incrementally.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>>> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>>>>                status = "disabled";
>>>>            };
>>>>    +        sram@8600000 {
>>>> +            compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
>>>> +            reg = <0 0x08600000 0 0x1000>;
>>>> +            ranges = <0 0 0x08600000 0x1000>;
>>> It looks like this should be a little longer
>>
>> Yes. It is 112KB. But only first 4KB is accessible by all masters in the system, remaining regions are access protected by TZ. I shall mention this in the commit message in the next version.
> I think we should describe the full length of it - it's only if we
> add a subnode that we actually access it


Sure got it.  I will describe the full length in next revision. In that 
case, it would be the driver's responsibility not to go beyond the 
initial 4K.


>
> Konrad

