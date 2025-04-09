Return-Path: <linux-watchdog+bounces-3263-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E775A82F11
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 20:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10BE57AE8B6
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 18:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6862E2777FF;
	Wed,  9 Apr 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+HdTpgL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3C1278152
	for <linux-watchdog@vger.kernel.org>; Wed,  9 Apr 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224086; cv=none; b=a9JKQ83BjnL2oxs5H+JTQa/l7/OmPzRgm4NL+PFntdo8Yzzs64mdEgn522/qcxFKeLGIdOrxUMbvpCeoPFqPzjFkSlriTLLuDBgyu9cjSGTNy6pJ0Ir+17PjFLmYecph3pQqk63RkE/oyoB1j9aJ0ZucBVTqT/XIjS6gNRGZrdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224086; c=relaxed/simple;
	bh=A76G8XO3zeb5iD/DYgQmAiHYDX+OwlRFq71ay9w4RiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFDRNFZF2Q3U7lEO8RE+LmxnLPVKcjRyqgeCWzhbZAPc5FKvpmBlbHaGXS5J0HLsA1wXsOJUvLgNwEiK2LjAZe8PSjgffB9+eKVlMtGQansQEvCeihr9L0L2NZwD/Y5haNZ256rEdun8a8GQ3agpwSyMMhHH2fYJHnGtduqf2M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+HdTpgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIJqV015731
	for <linux-watchdog@vger.kernel.org>; Wed, 9 Apr 2025 18:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GV+cfJ7GNGGjHR/3RZM3RCjysFsTfWhGkXK6dcXL924=; b=J+HdTpgLzJR9RJc6
	mCenU2yWAm7L89LiUW0y/J660IyjKd6LaoehduFSW1fNLXzxcHv3Mc5UPRRCWSJY
	NGKvLYnnFLWrkYBdEOrc7vAhgaoqNq4PAn6TL0bIxbXAqPwALoEE/zbRj8zLrtOU
	lW0NMH43rtqCgjJwV5E254VWskBrw6JwPuaFTLTOJs0jQlTVhJighlNrn+ZApnig
	3rRqGWciKj1Gw4wRXsdFWtWfQprGAuF6LsYPiuoUjxQI9LSZjLTfK14z86b/YEQk
	ga1AvdB23XAixhazqHS6xbpVTwisv6fCpaqZYv/fXrJbCtVuuoeR71ZjfXFyxSmQ
	NOiDug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2vday-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 09 Apr 2025 18:41:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so3585a.2
        for <linux-watchdog@vger.kernel.org>; Wed, 09 Apr 2025 11:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224082; x=1744828882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GV+cfJ7GNGGjHR/3RZM3RCjysFsTfWhGkXK6dcXL924=;
        b=IcxP5vBdDeiX+E0UrGEbaUOPc/opqRgQSQYC4Qb6kcgIPgVtPOHTouX4e6lxQrlRIP
         CSx6rOsddN0LKJnV9SE/G6gPvcNh4c6HxMX/o1CJhr4qBcfoeyA+kG15Hmiu/3xdHLLz
         B2LDSPV3DI5PffNg3RqzzPlF+XOFkayQVNVLoD71OqoN7OwzMgOWyausv5vJYlC+ef0m
         2qvVLgFxmlZzOfc8scztQgtTjUc6bbjv7f4md3QUQzctuCaPBHJawCRp0x6iYxLMKE/L
         uKqXoQ0/eARsQwCvlUIJmNl69ldOGwHHyKkvixob9JYb6HrErMpMfF+HvfR3JZPg5Z7D
         jRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWah5R2K9u7YaHxAqUl4R/r404W7JTnpCaChZ7xEqy9cxgbRJgbCKtNJ7M8i2ynlNnc4Ri7zGwQBB+y/9NBww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVhPCxbzxTVMS02Ymgp8V0o7ckPhB8Zjk/HLicBb0m7B5Aq8z
	esGnjAFWqXUqOp7eTMbOrMkGXWtu7kv4YYMDuBLenwMp35fIXGAmbMhJ9MrYMmAceHw6SRLL2db
	NgnSIhP+msB+uviGTp0WqjjwtFEpbLgJ/lNlTrRHEKeEGHMlicDKSX4MB6Fw+onFzuQ==
X-Gm-Gg: ASbGnctowWJ9Vpe+FI++PJeKyZ9a1CHp6qZRwoMXczVE4C0R68ybEyKv94euDsW6RC3
	56Zcf6H4tNa02Sih/w/p7sRElaLlaTFuVHq0xukFsr9KG6H5Hv2BmaybcRc/35g2h1yF653oOL4
	HAaLnQAErSKUvtBuSo0Amo9oIMcmZIf9QbzbKnekGuy0ciwd3cak9ZYKSMz7WV84U/a2mSb5wDo
	XXqjCw1ekRKnSNnmPMd6AOxnslarFL3eEQ/tRl2e82d/p0ZeB0NRzzGyCber9VrL/3krFOIA2ct
	WBTq1QRgRH/w8CSLGPdsl8vxpgL5xzivSdwYIubjkMNbV/8g8wC2g0ZuS86p+24A6Q==
X-Received: by 2002:a05:620a:280e:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c79cb2956emr240300285a.0.1744224082386;
        Wed, 09 Apr 2025 11:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfdsHLhjTbUmUhDsUafcwjWCN06cz8NCJ2SisE7fVfjCUv/0AdQTlhlx5gH2u/I84DmW937Q==
X-Received: by 2002:a05:620a:280e:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c79cb2956emr240298885a.0.1744224082014;
        Wed, 09 Apr 2025 11:41:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc2dcsm135479366b.132.2025.04.09.11.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:41:21 -0700 (PDT)
Message-ID: <6298f149-caae-49d0-af68-c3d102d0ef7d@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x-ZaCYR0-9AdWFBPJflU_WfRulSqLgjf
X-Proofpoint-GUID: x-ZaCYR0-9AdWFBPJflU_WfRulSqLgjf
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f6bf53 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=o4o9nyK-Q1O9M6IKefoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=790 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090123

On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality. Corresponding DTS and driver
> changes will be added incrementally.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
> +			reg = <0 0x08600000 0 0x1000>;
> +			ranges = <0 0 0x08600000 0x1000>;

It looks like this should be a little longer

Konrad

