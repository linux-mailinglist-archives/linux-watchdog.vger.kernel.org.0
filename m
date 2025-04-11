Return-Path: <linux-watchdog+bounces-3284-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B63A852D6
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 07:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1344A358F
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Apr 2025 05:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE4727CCCE;
	Fri, 11 Apr 2025 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnnRPlaO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3727BF7B
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744347685; cv=none; b=bSFObyq6kteBxypIxRszBK57yrhqbeF52DS+7BQJUCQBp+PdU7Mq0rYhBTi9gurDNuw5uMvC74e1EZ5LLCHk0GROU1LOazRLHkw/cofafTmklNhgYMxBJvU9dbl7oGDzRZ8pzt8oHuGJIotq8cow3rFDyhSY2tSe6X+3patbalQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744347685; c=relaxed/simple;
	bh=Bqqip6vv1AXlW007YF0paom7H9l2UwCGujjxv1oS0Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUZEVGv6gv/XX50TB0kAo4zE0WGL7jUbKp4bA3ZwAXgAJG0EF+PmF5I6Qh3jqEp/yifRbZQEyeCLkLV/Ts6xt3U7pvJoiNhw3crehs5xwtnxbpeT6/8N/vzR9L4YztcF95POkv9yj51D1K7YBcXnmVpnHYZl6BK/ysVBEQr5Hbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnnRPlaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFsS1k030613
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iU3jF42CcRbDvr47i+k1eJkOuCjg/GXrWsAC7AGbOiU=; b=SnnRPlaOCdmkVqZq
	gb6vEUDOmCtJa/M2Kejm6+mqBauZf5wNspnKNhoDa0aVWUlMXjjSiQO5BMfQj0N1
	850wLswsmidsF7o8UnqBGIW+SFssP0fUgrjSDCFmEsdljWZRPRLLoxCmRQZUdisP
	eXFzRyOpOHX8PnKrunk4uvT6mq7XEIIvKZ9xBmg/h+sHBN9YdCOccuGNtqcaiK6G
	TLKbKMClnAYUWQq7yKyL/LJE3LLZYJrsv1ZWTVBl5JCs+wGg/PzBTUM1ftrTZUSw
	B/qnposh/BzXZFiT9EJFzthnb9Al/Q9jhIqy8RBd4OtTMAmTqLHI1WB688hzPe63
	aBcy6A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfts0cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Apr 2025 05:01:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-739764217ecso1418056b3a.0
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Apr 2025 22:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744347681; x=1744952481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iU3jF42CcRbDvr47i+k1eJkOuCjg/GXrWsAC7AGbOiU=;
        b=lqoel1xtVGWPGU7ikpx0VU4+r6yQbooaKi7+FL3YuSLMLqaZ+0QW/XOOUYZhQV6BL/
         uNUIcGclxzMrkCoO31oiEzw/QVjB/zAyHfjTmrCsrIEGL4q7Y31CTd4e9tMSez/crqmi
         twCibpAvAzMAKNonRATLPi37aCGulVBTKqHIKeNKHgaEQN7J6baDVyi3vW1zABjo4x0y
         SazCY4jBCpTgOFyAB0EzqeydGNYroRHYt2k9VWE5+nLtAbL8ldy/XxyprnH6jkScHSI6
         vRD9q1JCXJJ1uLXgdnbYfQbT0dAP0y46ZGAh7GQIdP+K/X2/Ay4ZxjkykTwmmUi1zdAM
         yRDA==
X-Forwarded-Encrypted: i=1; AJvYcCXR4xHfXRkC6s0OrtbtpAHzuX1ScZ+/2c2CyfPMz0EaR6Y/x5pDyU9xEswkGFjD7OCx6ylSEJbupjhJ/ZTTDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYwiHRAeDtd+zhMxPNIMKvPi28OvWH/8tMWiix5ySqD0MsdzB
	FK+O9zcjm+NwWMLTRHej+Wi6AusCMKYXremSmnGJN3ieOeRjaLDQYRxE1qz723EPXGWxPtQwhB6
	2sAJQCSNCHht19B2XXJ1t1unppaHnCcX+rSKwSnBuqdkwFOdV4sEeNCJRkVr9q/w9NQ==
X-Gm-Gg: ASbGncsAuTfE/NvNjJOT0W8Y3YjSfAX49Wlx07JsRpQrLW6h7Yc1XDpFFcLCS4a2xla
	bMljYlbtA6QPTCs2jBq5dTqAxtLyFjXsJGcBp8zD6KdOs/jT301SIYpSHVdY4YWriAE2Vy23iMJ
	pOBqPsvBGFmI7qYgIWZVk5SPeEogJagRK3usHfujuF9rwpSw+c08NJ/HIQ5QC+f4z7mkh7oDMGy
	QcxDZQUUHzwsl/onaVdwuS2bB6Jzynfb9tJup2RtaCZsgBePGpu0HV8OdCNGsv2PndfhwvoMBGK
	QxXEgsIhpGU6TRc8LY/9dWhWcNOJFMZfe4Rxwc38FVvVdqt1BRK0
X-Received: by 2002:a05:6a00:98b:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-73bd0c23517mr2253803b3a.6.1744347680612;
        Thu, 10 Apr 2025 22:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIC6y3kfTqx6FOCy0TY1K2LPWbtvRdwzYJO2IyUfSa5wij8amglx6d0xzJSPEL9BxFADh8lw==
X-Received: by 2002:a05:6a00:98b:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-73bd0c23517mr2253757b3a.6.1744347680105;
        Thu, 10 Apr 2025 22:01:20 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198c17sm529769b3a.36.2025.04.10.22.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 22:01:19 -0700 (PDT)
Message-ID: <54efe237-01ea-4f98-8dbe-390d344aa6cf@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:31:14 +0530
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
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8a221 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jTFA79TV-ThCIif_KeMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: oV1kcHE_H1cvuPY-xGTowH57705d6L4j
X-Proofpoint-ORIG-GUID: oV1kcHE_H1cvuPY-xGTowH57705d6L4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=885
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110035


On 4/10/2025 12:11 AM, Konrad Dybcio wrote:
> On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality. Corresponding DTS and driver
>> changes will be added incrementally.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
>> +			reg = <0 0x08600000 0 0x1000>;
>> +			ranges = <0 0 0x08600000 0x1000>;
> It looks like this should be a little longer


Yes. It is 112KB. But only first 4KB is accessible by all masters in the 
system, remaining regions are access protected by TZ. I shall mention 
this in the commit message in the next version.


>
> Konrad

